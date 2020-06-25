import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/faq/faq.dart';

// Vorlage für eine spätere Seite mit der Möglichkeit Einstellungen zu verändern -> aktuell noch funktionslos

class Settings extends StatelessWidget {
  final String _title = "Einstellungen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //FAQ-Button unten rechts
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen[500],
          child:
          Text("?",style: TextStyle(fontSize: 50,),),
          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar( //Kopfzeile mit Titel der Seite
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