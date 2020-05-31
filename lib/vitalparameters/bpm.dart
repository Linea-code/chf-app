import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class BPM extends StatefulWidget {
  @override
  _BPMState createState() => _BPMState();
}

class _BPMState extends State<BPM> {
  var data = [71.0, 57.0, 59.0, 60.0, 62.0, 100.0, 77.0, 60.0, 55.0, 100.0,88.0,55.0,64.0];// beispielhaft manuell Daten eingegeben
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.0, bottom: 3.0, left: 3.0,right: 3.0),
      child: Sparkline(
        data: data,
        fillMode: FillMode.below,
        lineColor: Colors.lightGreen[800],
        fillGradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.lightGreen[800], Colors.lightGreen[100]],

        ),

      ),
    );
  }
}
