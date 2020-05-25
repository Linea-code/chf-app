import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    );
  }
}