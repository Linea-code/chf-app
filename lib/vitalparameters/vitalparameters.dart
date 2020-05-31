import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/vitalparameters/bpm.dart';

class VitalParameters extends StatelessWidget {

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
                      MaterialPageRoute(builder: (context) => VitalParameters()));
                },
              ),
              BPM(),
            ]),
          ),
        ],
      ),
    );
  }
}