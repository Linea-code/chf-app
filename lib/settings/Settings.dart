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
          tooltip:'Increment',
          child:
          Icon(Icons.help_outline,size: 50,),
          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar( //Kopfzeile mit Titel der Seite
        title: Text(_title,style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
      decoration: BoxDecoration(
          //Farbverlauf als Hintergund
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xfff0fcfc),
            Color(0xffbed3d4),
          ]),),
            padding: EdgeInsets.all(20),
            child: Card(

              child: Container(
                padding: EdgeInsets.all(15),
                child: Text("Aktuell müssen keine Einstellungen vorgenommen werden! Zu einem späteren Zeitpunkt finden Sie hier die Einstellungen, die innerhalb der Applikation vorgenommen werden können.", style: Theme.of(context).textTheme.bodyText2,),
            ))
          ),
          Container(
              decoration: BoxDecoration(
                //Farbverlauf als Hintergund
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xfffaf7e3),
                      Color(0xffe8caa4),
                    ]),),
              padding: EdgeInsets.all(20),
              child: Card(

                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text("Später können hier Einstellungen, wie die Zugriffsrechte auf Google Fit und Apple Health eingestellt und verändert werden.", style: Theme.of(context).textTheme.bodyText2,),
                  ))
          ),
          Container(
            padding: EdgeInsets.only(right: 80, left: 20, top: 25, bottom: 15),
            child:Image.asset('assets/Doktor2.PNG',
                fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}