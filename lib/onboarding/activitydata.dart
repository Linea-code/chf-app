import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

//Zugriffrechte auf Aktivitätsdaten
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
      onChanged: (bool value) {
        //Abfrage der Authorisierung-> Wenn sie gegeben wird, so ändert sich der Slider auf true und die Daten können verwendet werden
        Future.delayed(Duration(seconds: 0), () async {
          bool isAuthorized = await Health
              .requestAuthorization(); //Abfragen der Autorisierung über Heath kit
          if (isAuthorized) {
            setState(() {
              _aktivity = value; // veränderung des activity Wertes
            });
          }
        });
      },
    );
  }
}
