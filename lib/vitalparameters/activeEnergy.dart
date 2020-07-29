import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:health/health.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:herzinsuffizienz/faq/faq.dart';

//Laden der BPM Daten -> speicherung in Liste-> Darstellung in Diagramm

class ActiveEnergy extends StatefulWidget {
  @override
  _ActiveEnergyState createState() => _ActiveEnergyState();
}

class _ActiveEnergyState extends State<ActiveEnergy> {
  bool _isAuthorized = false;
  var activeEnergy = List<Datapoints>();
  double avrEnergy = 0;

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
      _isAuthorized = await Health.requestAuthorization(); //Autorisierungsabfrage
      if (_isAuthorized) {
        try {
          List<HealthDataPoint> data = await Health.getHealthDataFromType(
              startDate, endDate, HealthDataType.ACTIVE_ENERGY_BURNED);
          for (HealthDataPoint point in data) {
            activeEnergy.add(new Datapoints(point.dateFrom, point.value));
            avrEnergy += point.value;
          }
        } catch (exception) {
          print(exception.toString());
        }
      } else {
        print("Keine Authorisierung vorliegend");
      }
      setState(() {});
      avrEnergy= avrEnergy/activeEnergy.length;

      _seriesData.add(
        charts.Series(
          data: activeEnergy,
          domainFn: (Datapoints datapoints, _) => datapoints.getDate(),
          measureFn: (Datapoints datapoints, _) => datapoints.getValue(),
          id: 'Aktivitätsenergie',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( //FAQ-Button unten rechts
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightGreen[500],
            tooltip:'Increment',
            child:
            Icon(Icons.help_outline,size: 50,),
            onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));}
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar( //Kopfzeile mit Titel
          title: Text(
            'Aktivitätskalorien'
          ),
          backgroundColor: Colors.lightGreen[500],
        ),
        body: Container(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ListView(children: <Widget>[
                //Ladebildschirm bei keinen Daten/leere Liste
                _seriesData.isEmpty
                    ? Container(
                    child: SpinKitPumpingHeart(
                      color: Colors.red[400],
                    ))
                    : Container(
                    height: 300,
                    child: Card( //Diagramm erstellen mit spezifischen Achsen- und Farbeinstellungen
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
                            new charts.ChartTitle('Aktivitätskalorien (kcal)'),
                          ],
                        ))),
                //Ergänzug um Innormationsboxen-> zum auklappen
                Card(
                    child: ExpansionTile(
                      title: Text(
                        ("Durchschnittlich verbrannte Aktivitätskalorien des letzten Monats: " +
                            (avrEnergy.toStringAsFixed(2)))
                      ),
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Ihr durchschnittlich verbrannten Aktivitätskalorien setzten sich aus allen Messwerten des vergangen Monats zusammen."
                          ),
                        ),
                      ],
                    )),
              ]),
            )));
  }
}
//Eigene Klasse für Datenpunkte
class Datapoints {
  int date;
  double value;

  Datapoints(this.date, this.value);

  double getValue() {
    return value;
  }

  DateTime getDate() {
    return DateTime.fromMillisecondsSinceEpoch(date); //Umwandlung in korrektes Datenformat
  }
}
