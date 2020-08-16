import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts; //Um Charts zu erstellen
import 'package:health/health.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:herzinsuffizienz/faq/faq.dart';

//Detailansicht Gewicht
class Weight extends StatefulWidget {
  @override
  _WeightState createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  bool _isAuthorized = false;
  var weight = List<Datapoints>();
  double avrWeight = 0;

  List<charts.Series<Datapoints, DateTime>> _seriesData;

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Datapoints, DateTime>>();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    DateTime startDate = DateTime.utc(2020, DateTime.now().month - 1,
        DateTime.now().day); //Zeitraum der Datenabfrage
    DateTime endDate = DateTime.now();

    Future.delayed(Duration(seconds: 2), () async {
      _isAuthorized = await Health
          .requestAuthorization(); //Autorisierungsabfrage über Health kit
      if (_isAuthorized) {
        try {
          List<HealthDataPoint> data = await Health.getHealthDataFromType(
              startDate, endDate, HealthDataType.WEIGHT);
          for (HealthDataPoint point in data) {
            weight.add(new Datapoints(
                point.dateFrom, point.value)); //Liste mit Gewichtsdaten füllen
            avrWeight += point.value;
          }
        } catch (exception) {
          print(exception.toString());
        }
      } else {
        print("Keine Authorisierung vorliegend");
      }
      setState(() {});
      avrWeight = avrWeight / weight.length; //Durchschnitt bilden

      //Datenserie anlegen mit Gewichtsdaten
      _seriesData.add(
        charts.Series(
          data: weight,
          domainFn: (Datapoints datapoints, _) => datapoints.getDate(),
          measureFn: (Datapoints datapoints, _) => datapoints.getValue(),
          id: 'Gewicht in kg',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //FAQ-Button unten rechts
      floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: Icon(
            Icons.help_outline,
            size: 50,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FAQ()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: Text(
          'Gewicht',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              //Ladebildschirm falls keine Daten vorhanden oder falls Daten noch laden
              _seriesData.isEmpty
                  ? Container(
                      padding: EdgeInsets.only(top: 50, bottom: 50),
                      child: SpinKitWave(color: Theme.of(context).accentColor))
                  : Container(
                      height: 300,
                      child: Card(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              //Diagramm mit detailierten Datenpunkten und spezifischen Achseneinstellungen
                              child: charts.TimeSeriesChart(
                                _seriesData,
                                primaryMeasureAxis: new charts.NumericAxisSpec(
                                    tickProviderSpec:
                                        new charts.BasicNumericTickProviderSpec(
                                            zeroBound: false)),
                                domainAxis: new charts.DateTimeAxisSpec(
                                    tickFormatterSpec: new charts
                                            .AutoDateTimeTickFormatterSpec(
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
                                  new charts.ChartTitle('Gewicht (kg)'),
                                ],
                              )))),

              //Ergänzende Infos in ausklappbaren Karten
              Card(
                  color: Color(0xfff0fcfc),
                  child: ExpansionTile(
                    title: Text(
                      ("Durchschnittliches Gewicht des letzten Monats: " +
                          (avrWeight.toStringAsFixed(2))),
                    ),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Ihr durchschnittliches Gewicht setzt sich aus allen Messwerten des vergangen Monats zusammen. Sollten Sie starke Gewichtsveränderungen feststellen kontaktieren Sie bitte Ihren Arzt.",
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

//Eigene Klasse um Datenpunkte zu spezifizieren mit getter-Methoden für Werte
class Datapoints {
  DateTime date;
  double value;

  Datapoints(this.date, this.value);

  double getValue() {
    return value;
  }

  DateTime getDate() {
    return date; //Umwandlung in korrekten Datentyp
  }
}
