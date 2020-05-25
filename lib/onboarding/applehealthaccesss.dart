import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppleHealth extends StatefulWidget {
  @override
  _AppleHealthState createState() => _AppleHealthState();
}

class _AppleHealthState extends State<AppleHealth> {
  bool _apple = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Apple-Health Daten'),
      value: _apple,
      onChanged: (bool value) {
        setState(() {
          _apple = value;
        });
      },
    );
  }
}