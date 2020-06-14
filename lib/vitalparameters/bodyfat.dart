import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:health/health.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:herzinsuffizienz/faq/faq.dart';

class Bodyfat extends StatefulWidget {
  @override
  _BodyfatState createState() => _BodyfatState();
}

class _BodyfatState extends State<Bodyfat> {
  bool _isAuthorized = false;
  var bodyfat = List<Datapoints>();
  double avrBodyfat = 0;

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
              startDate, endDate, HealthDataType.BODY_FAT_PERCENTAGE);
          for (HealthDataPoint point in data) {
            bodyfat.add(new Datapoints(point.dateFrom, point.value));
            avrBodyfat += point.value;
          }
        } catch (exception) {
          print(exception.toString());
        }
      } else {
        print("Keine Authorisierung vorliegend");
      }
      setState(() {});
      avrBodyfat = avrBodyfat / bodyfat.length;
      _seriesData.add(
        charts.Series(
          data: bodyfat,
          domainFn: (Datapoints datapoints, _) => datapoints.getDate(),
          measureFn: (Datapoints datapoints, _) => datapoints.getValue(),
          id: 'Schritte',
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
          'Körperfett - Übersicht',
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
          child: ListView(
            children: <Widget>[
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
                                    format: 'd',
                                    transitionFormat: 'd.MM'))),
                        defaultRenderer: new charts.LineRendererConfig(
                          //includeArea: true,  //Könnte noch hinzugefügt werden um Bereich unter Grafen auszufüllen
                          stacked: true,
                        ),
                        animate: false,
                        animationDuration: Duration(seconds: 3),
                        behaviors: [
                          new charts.ChartTitle('Körperfett'),
                        ],
                      ))),
              Card(
                  child: ExpansionTile(
                    title: Text(
                      ("Durchschnittlicher Körperfettanteil des letzten Monats: " +
                          (avrBodyfat.toStringAsFixed(2))),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Ihr durchschnittlicher Körperfettanteil setzt sich aus allen Messwerten des vergangen Monats zusammen.",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
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
