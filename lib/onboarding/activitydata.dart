import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

class ActivityData extends StatefulWidget {
  @override
  _ActivityDataState createState() => _ActivityDataState();
}

class _ActivityDataState extends State<ActivityData> {
  //Zu Beginn wird Zugriffsrecht ausgeschaltet
  bool _aktivity = false;

  @override
  Widget build(BuildContext context) {
    //Slider um Aktivitätszugriff zu aktivieren
    return SwitchListTile(
      title: const Text('Aktivitätsdaten'),
      value: _aktivity,
      onChanged: (bool value) { //ab hier neue Funktion mit Daten einlesen
    Future.delayed(Duration(seconds: 2), () async {
      bool isAuthorized = await Health.requestAuthorization(); //Abfragen der Autorisierung über Heath kit
      if (isAuthorized) {
        setState(() {
          _aktivity = value; // veränderung des activity Wertes
        });
      }
    }
    );
      },
    );
  }
}