import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KameraZugriff extends StatefulWidget {
  @override
  _KameraZugriffState createState() => _KameraZugriffState();
}

class _KameraZugriffState extends State<KameraZugriff> {
  bool _camera = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Kamera'),
      value: _camera,
      onChanged: (bool value) {
        setState(() {
          _camera = value;
        });
      },
    );
  }
}