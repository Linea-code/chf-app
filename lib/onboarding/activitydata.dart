import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      onChanged: (bool value) {
        setState(() {
          _aktivity = value;
        });
      },
    );
  }
}