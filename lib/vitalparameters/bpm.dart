import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:health/health.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:herzinsuffizienz/faq/faq.dart';

class BPM extends StatefulWidget {
  @override
  _BPMState createState() => _BPMState();
}

class _BPMState extends State<BPM> {
  bool _isAuthorized = false;
  var bpm = List<Datapoints>();
  double avrBpm = 0;

  List<charts.Series<Datapoints, DateTime>> _seriesData;

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Datapoints, DateTime>>();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    DateTime startDate =
        DateTime.utc(2020, DateTime.now().month - 1, DateTime.now().day);
    DateTime endDate = DateTime.now();

    Future.delayed(Duration(seconds: 2), () async {
      _isAuthorized = await Health.requestAuthorization();
      if (_isAuthorized) {
        try {
          List<HealthDataPoint> data = await Health.getHealthDataFromType(
              startDate, endDate, HealthDataType.HEART_RATE);
          for (HealthDataPoint point in data) {
            bpm.add(new Datapoints(point.dateFrom, point.value));
            avrBpm += point.value;
          }
        } catch (exception) {
          print(exception.toString());
        }
      } else {
        print("Keine Authorisierung vorliegend");
      }
      setState(() {});
      avrBpm= avrBpm/bpm.length;

      _seriesData.add(
        charts.Series(
          data: bpm,
          domainFn: (Datapoints datapoints, _) => datapoints.getDate(),
          measureFn: (Datapoints datapoints, _) => datapoints.getValue(),
          id: 'Herzfrequenz in BPM',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightGreen[500],
            child:
            Text("?",style: TextStyle(fontSize: 50,),),
            onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));}
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          title: Text(
            'Herzfrequenz - Übersicht',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          backgroundColor: Colors.lightGreen[500],
        ),
        body: Container(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(children: <Widget>[
            _seriesData.isEmpty
                ? Container(
                    child: SpinKitPumpingHeart(
                    color: Colors.red[400],
                  ))
                : Container(
                    height: 300,
                    child: Card(
                        child: charts.TimeSeriesChart(
                      _seriesData,
                      primaryMeasureAxis: new charts.NumericAxisSpec(
                          tickProviderSpec:
                              new charts.BasicNumericTickProviderSpec(
                                  zeroBound: false)),
                      domainAxis: new charts.DateTimeAxisSpec(
                          tickFormatterSpec:
                              new charts.AutoDateTimeTickFormatterSpec(
                                  day: new charts.TimeFormatterSpec(
                                      format: 'd', transitionFormat: 'd.MM'))),
                      defaultRenderer: new charts.LineRendererConfig(
                        //includeArea: true,  //Könnte noch hinzugefügt werden um Bereich unter Grafen auszufüllen
                        stacked: true,
                      ),
                      animate: false,
                      animationDuration: Duration(seconds: 3),
                      behaviors: [
                        new charts.ChartTitle('Herzfrequenz (BPM)'),
                      ],
                    ))),
            Card(
                child: ExpansionTile(
                  title: Text(
                    ("Durchschnittliche Herzfrequenz des letzten Monats: " +
                        (avrBpm.toStringAsFixed(2))),
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Ihr durchschnittliche Herzfrequenz setzt sich aus allen Messwerten des vergangen Monats zusammen.",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ))
          ]),
        )));
  }
}

class Datapoints {
  int date;
  double value;

  Datapoints(this.date, this.value);

  double getValue() {
    return value;
  }

  DateTime getDate() {
    return DateTime.fromMillisecondsSinceEpoch(date);
  }
}
