import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/onboarding/accessrights.dart';

//Erster Bildschirm, wenn man die App neu Installiert
class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //Kopfzeile mit Titel
          title: Text(
            "CHI-App",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: ListView( children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                //kurzer Willkommenstext
                "Herzlich Willkommen in Ihrer Herzinsuffizienz-App! \nDiese App wird Sie im Alltag unterstützen mit Ihrer chronischen Herzinsuffizienz umzugehen!\n\nFolgendes kann in Zukunft von der App übernommen werden: ",
              ),
            ),

            //Aufklärung über Leistungen der App

            Column(
              children: <Widget>[
                new ListTile(
                  leading: Icon(Icons.check),
                  title: new Text(
                    "Darstellung und Speicherung von Gesundheitsdaten", style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                new ListTile(
                  leading: Icon(Icons.check),
                  title: new Text(
                    "Auswertung von Gesundheitsdaten gemeinsam mit Ihrem Arzt",style: Theme.of(context).textTheme.subtitle2,

                  ),
                ),
                new ListTile(
                  leading: Icon(Icons.check),
                  title: new Text(
                    "Erinnerungen an die Medikationseinnahme",style: Theme.of(context).textTheme.subtitle2,

                  ),
                ),
                new ListTile(
                  leading: Icon(Icons.check),
                  title: new Text(
                    "Übermittlung medizinischer Daten an den behandelnden Arzt",style: Theme.of(context).textTheme.subtitle2,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: RaisedButton(
                //Knopf um auf nächste Seite zu gelangen
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
        )]));
  }
}
