import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/faq/faq.dart';

class Settings extends StatelessWidget {
  final String _title = "Einstellungen";
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