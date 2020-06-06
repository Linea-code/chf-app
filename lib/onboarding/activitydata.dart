import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

class AktivitaetsDaten extends StatefulWidget {
  @override
  _AktivitaetsDatenState createState() => _AktivitaetsDatenState();
}

class _AktivitaetsDatenState extends State<AktivitaetsDaten> {
  bool _aktivity = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Aktivitätsdaten'),
      value: _aktivity,
      onChanged: (bool value) { //ab hier neue Funktion mit Daten einlesen
    Future.delayed(Duration(seconds: 2), () async {
      bool isAuthorized = await Health.requestAuthorization();
      if (isAuthorized) {
        setState(() {
          _aktivity = value;
        });
      }
    }
    );
      },
    );
  }
}