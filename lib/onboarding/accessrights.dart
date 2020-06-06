import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/onboarding/activitydata.dart';
import 'package:herzinsuffizienz/onboarding/applehealthaccesss.dart';
import 'package:herzinsuffizienz/onboarding/cameraaccess.dart';
import 'package:herzinsuffizienz/onboarding/createprofile.dart';



class Access extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zugriffsrechte',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
            fontFamily: "Arial",
          ),
        ),
        backgroundColor: Colors.lightGreen[500],
      ),
      body: Column(children: <Widget>[
        Container(
          child: Text(
            'Auf welche Daten darf die Herzinsuffizienz-App zugreifen? Natürlich werden alle persönlichen Daten vertraulich behandelt und nur in Kooperation mit dem behandelnden Arzt verwendet!',
            style: TextStyle(
              fontFamily: "Arial",
              fontSize: 16.0,
            ),
          ),
        ),
        AppleHealth(), // TODO: apple hinzufügen API
        AktivitaetsDaten(),
        KameraZugriff(), //TODO Permission hinzufügen
        Container(
          child: RaisedButton(
            child: Text('Weiter'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateProfile()),
              );
            },
          ),
        ),
      ]),
    );
  }
}