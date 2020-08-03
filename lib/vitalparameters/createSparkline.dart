import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

//eigene Klasse um Sparkline zu erstellen (für ersten Bildschirm der Vitalparameter)

class CreateSparkline extends StatefulWidget {
  var data;

  CreateSparkline({this.data});
  @override
  _CreateSparklineState createState() => _CreateSparklineState();
}

class _CreateSparklineState extends State<CreateSparkline> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.0, bottom: 3.0, left: 3.0,right: 3.0),
      child: Sparkline(
        data: widget.data, //Datenübergabe
        //fillMode: FillMode.below, //kan hinzugefügt werden um Bereich unter Grafen zu füllen
        lineColor: Theme.of(context).primaryColor,//Colors.lightGreen[500],
        //kann hinzugefügt werden um Füllung unter Graphen mit Farbverlauf zu versehen
        /*fillGradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.lightGreen[500], Colors.lightGreen[100]],

        ),*/

      ),
    );
  }
}

