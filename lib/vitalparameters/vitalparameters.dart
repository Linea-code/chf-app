import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/vitalparameters/bmp.dart';
import 'package:herzinsuffizienz/vitalparameters/createSparkline.dart';

class VitalParameters extends StatelessWidget {
  var dataBPM = [71.0, 57.0, 59.0, 60.0, 62.0, 100.0, 77.0, 60.0, 55.0, 100.0,88.0,55.0,64.0];// beispielhaft manuell Daten eingegeben
  var dataGewicht = [49.53,49.56, 49.94,50.13,50.44,50.32,49.89,50.12, 50.15,50.48, 50.96,50.52,51.10, 50.38, 50.64, 50.48,49.76, 50.16,50.39,50.20,50.70, 50.52,50.66,50.76, 50.12,50.70,50.66,51.25, 50.94, 50.08,50.18,50.15,50.31,50.41,50.66,51.13,50.53,50.24,50.46,49.79,49.70,49.80,49.77]; //echte Beispieldaten LS
  var dataVariabilitaet =[61.0,60.0,51.0,40.0,54.0,50.0,46.0,53.0,45.0,61.0,37.0,66.0,46.0,49.0,55.0,56.0,47.0,44.0,45.0,44.0,45.0,40.0,55.0,31.0,47.0,43.0,38.0,43.0,60.0,40.0]; //echte Beispieldaten LS
  final String _title = "Vitalparameter";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
            fontFamily: "Arial",
          ),
        ),
        backgroundColor: Colors.lightGreen[500],
      ),
      body: Column(
        children: <Widget>[
          Card(
            shadowColor: Colors.grey,
            child: Column(children: <Widget>[
              ListTile(
                //leading: Icon(Icons.trending_up),
                title: Text('Herzfrequenz (bpm)'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BPM()));
                },
              ),
              CreateSparkline(data: dataBPM,), //TODO: on tap genaueres Diagramm mit Achsenbeschr.
            ]),
          ),
          Card(
            shadowColor: Colors.grey,
            child: Column(children: <Widget>[
              ListTile(
                //leading: Icon(Icons.trending_up),
                title: Text('Gewicht (kg)'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VitalParameters()));
                },
              ),
              CreateSparkline(data: dataGewicht,), // TODO: on tap sollten dann auch Diagramme zu Wasserhaushalt, Fett etc. sein
            ]),
          ),
          Card(
            shadowColor: Colors.grey,
            child: Column(children: <Widget>[
              ListTile(
                //leading: Icon(Icons.trending_up),
                title: Text('Herzfrequenzvariabilität'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VitalParameters()));
                },
              ),
              CreateSparkline(data: dataVariabilitaet,), // TODO: on tap sollten dann auch Diagramme zu Wasserhaushalt, Fett etc. sein
            ]),
          ),
        ],
      ),
    );
  }
}