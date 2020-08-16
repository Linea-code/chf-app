import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/onboarding/activitydata.dart';
import 'package:herzinsuffizienz/onboarding/applehealthaccesss.dart';
import 'package:herzinsuffizienz/onboarding/cameraaccess.dart';
import 'package:herzinsuffizienz/onboarding/createprofile.dart';

//Abfrage der Zugriffsrechte bei erstmaligem Öffnen
class Access extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Kopfzeile mit Titel
        title: Text(
          'Zugriffsrechte',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Auf welche Daten darf die Herzinsuffizienz-App zugreifen? Natürlich werden alle persönlichen Daten vertraulich behandelt und nur in Kooperation mit dem behandelnden Arzt verwendet!',
          ),
        ),
        // Aufruf eigener Mathoden für Zugriffsrechte
        //AppleHealth(),
        ActivityData(),
        CameraAccess(), //TODO Permission hinzufügen // ist für spätere Erweiterungen gut (z.B. Scannen von Laborbefunden oder Arztbriefen etc.)
        Container(
          child: RaisedButton(
            child: Text('Weiter'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CreateProfile()), //Weiterleitung auf Profilerstellung
              );
            },
          ),
        ),
      ]),
    );
  }
}
