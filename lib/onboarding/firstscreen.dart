import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/onboarding/accessrights.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( //Kopfzeile mit Titel
          title: Text(
            "Herzinsuffizienz-App",style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text( //kurzer Willkommenstext
                "Herzlich Willkommen in Ihrer Herzinsuffizienz-App! \nDiese App wird Sie im Alltag unterstützen mit Ihrer chronischen Herzinsuffizienz umzugehen!\n\nFolgendes kann in Zukunft von der App übernommen werden: ",
                style: TextStyle(
                  fontFamily: "Arial",
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            //Aufklärung über Leistungen der App

            Column(
              children: <Widget>[
                new ListTile(
                  leading: Icon(Icons.check),
                  title: new Text("Darstellung und Speicherung von Gesundheitsdaten",
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),),
                ),
                new ListTile(
                  leading: Icon(Icons.check),
                  title: new Text("Auswertung von Gesundheitsdaten gemeinsam mit Ihrem Arzt",
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),),
                ),
                new ListTile(
                  leading: Icon(Icons.check),
                  title: new Text("Erinnerungen an die Medikationseinnahme",
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),),
                ),
                new ListTile(
                  leading: Icon(Icons.check),
                  title: new Text("Übermittlung medizinischer Daten an den behandelnden Arzt",
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),),
                )
              ],
            ),
            SizedBox(height: 30,),
            Container(
              child: RaisedButton( //Knopf um auf nächste Seite zu gelangen
                child: Text('Alles klar!'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Access()),
                  );
                },
              ),
            )
          ],
        ));


  }
}