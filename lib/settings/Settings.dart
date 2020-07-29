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
          tooltip:'Increment',
          child:
          Icon(Icons.help_outline,size: 50,),
          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar( //Kopfzeile mit Titel der Seite
        title: Text(_title,
        ),
        backgroundColor: Colors.lightGreen[500],
      ),
    );
  }
}