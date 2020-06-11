import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:health/health.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BPM extends StatefulWidget {
  @override
  _BPMState createState() => _BPMState();
}

class _BPMState extends State<BPM> {
  var _healthDataList = List<HealthDataPoint>();
  bool _isAuthorized = false;
  var bpm = List<Datapoints>();

  List<charts.Series<Datapoints, int>> _seriesData;

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Datapoints, int>>();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    DateTime startDate = DateTime.utc(2020,DateTime.now().month-1,DateTime.now().day);
    DateTime endDate = DateTime.now();

    Future.delayed(Duration(seconds: 2), () async {
      _isAuthorized = await Health.requestAuthorization();
      if (_isAuthorized) {
        List<HealthDataType> types = [
          HealthDataType.HEART_RATE,
        ];
        for (HealthDataType type in types) {
          try {
            List<HealthDataPoint> healthData =
            await Health.getHealthDataFromType(startDate, endDate, type);
            _healthDataList.addAll(healthData);
          } catch (exception) {
            print(exception.toString());
          }
        }
        setState(() {});
      } else {
        print("Keine Authorisierung vorliegend");
      }
      for (HealthDataPoint point in _healthDataList) {
        switch (point.dataType) {
          case "HEART_RATE":
            {
              bpm.add(new Datapoints(point.dateFrom , point.value));
            }
            break;
        }

      }

      _seriesData.add(
        charts.Series(
          data: bpm,
          domainFn: (Datapoints datapoints, _) => datapoints.getDate(),
          measureFn: (Datapoints datapoints, _) => datapoints.getValue(),
          id: 'Herzfrequenz in BPM',
          colorFn: (_,__) => charts.MaterialPalette.green.shadeDefault,
        ),
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(children: <Widget>[
            Expanded(
                child:
                _seriesData.isEmpty ? SpinKitPumpingHeart(color: Colors.red[400],) : Container(
                child:
                 charts.LineChart(
              _seriesData,
              defaultRenderer: new charts.LineRendererConfig(
               // includeArea: true,  Könnte noch hinzugefügt werden um Bereich unter Grafen auszufüllen
                stacked: true,
              ),
              animate: true,
              animationDuration: Duration(seconds: 3),
              behaviors: [
                new charts.ChartTitle('Herzfrequenz (BPM)'),
              ],
            ))
            ),
            Card(
              child:
              ListTile(
                title: Text("Was bedeutet dir Herzfrequenz?"),
              ),
            ),
          ]),
        ))
    );
  }
}

class Datapoints {
  int date;
  double value;

  Datapoints(this.date, this.value);

  double getValue (){
    return value;
  }
  int getDate (){
    return date;
  }
}
