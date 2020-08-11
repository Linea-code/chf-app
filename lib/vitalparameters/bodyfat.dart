import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:health/health.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:herzinsuffizienz/faq/faq.dart';

//Laden der Körperfettwerte aus dem letzten Monat (vergangene 30 Tage)

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
    DateTime.utc(2020, DateTime.now().month - 1, DateTime.now().day); //festlegung des Zeitraums
    DateTime endDate = DateTime.now();

    Future.delayed(Duration(seconds: 2), () async {
      _isAuthorized = await Health.requestAuthorization(); //Abfrage der Autorisierung über health kit
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
      avrBodyfat = avrBodyfat / bodyfat.length; //Bilden eines Durchschnittwerts

      //Anlegung einer Datenserie um diese dem Diagramm zu übergeben
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
      //FAQ-Button unten rechts
      floatingActionButton: FloatingActionButton(
          tooltip:'Increment',
          child:
          Icon(Icons.help_outline,size: 50,),
          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        //Kopfzeile mit Titel
        title: Text(
          'Körperfett', style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[ //Ldebildschirm (Herz) bei keinen Daten und bei warten auf Daten
              _seriesData.isEmpty
                  ? Container(
                  padding: EdgeInsets.only(top: 50, bottom: 50),
                  child:SpinKitWave(color: Theme.of(context).accentColor))
                  : Container(
                  height: 300,
                  child: Card( 
                    child: Container(
                      padding: EdgeInsets.all(5)
                        ,//Detailierter Graph zu Daten mit spezifizierung der Achsenbeschriftungen und Farben etc.
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
                      )))),
              //Ergänzen von Informationen unterhalb des Grafen mit ausklapp Funktion
              Card(color: Color(0xfff0fcfc),
                  child: ExpansionTile(
                    title: Text(
                      ("Durchschnittlicher Körperfettanteil des letzten Monats: " +
                          (avrBodyfat.toStringAsFixed(2)))
                    ),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Ihr durchschnittlicher Körperfettanteil setzt sich aus allen Messwerten des vergangen Monats zusammen."
                        ),
                      ),
                    ],
                  )),
              Card(color: Color(0xfff0fcfc),
                  child: ExpansionTile(
                    title: Text(
                      ("Was sagt der Körperfettanteil aus?")
                    ),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Der Körperfettanteil beschreibt wie hoch der Fettanteil des Körpers im Verhältnis zum gesamten Körpergewicht ist. EIn Fettanteil von 25 % sagt somit aus, dass 20 % des Körpergewichtes aus angelagertem Fett bestehen."
                        ),
                      ),
                    ],
                  )),
              Card(color: Color(0xfff0fcfc),
                  child: ExpansionTile(
                    title: Text(
                      ("Normalbereiche des Körperfettanteils:")
                    ),
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Wie hoch ein normaler/gesunder Körperfettanteil ist, hängt von verschiedenen Faktoren ab. Vor allem das Alter und das Geschlecht spielen hier eine wichtige Rolle."
                              "Im allgemeinen gilt, dass ein Frauen einen höheren Körperfettanteil als Männer haben sollten. Die Normalwerte schwanken je nach Alter zwischen 21 und 36 %."
                              "Bei Männern schwanken die Richtwerte für einen gesunden Körperfettanteil je nach ALter zwischen 8 und 25 %."
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

//Eigene Klasse um Datenpunkte zu spezifirieren inklusive getter-Methoen für Werte

class Datapoints {
  DateTime date;
  double value;

  Datapoints(this.date, this.value);

  double getValue() {
    return value;
  }

  DateTime getDate() {
    return date; //Umwandlung in korrektes Datenformat
  }
}
