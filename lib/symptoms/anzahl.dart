import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Veraendert0 extends StatefulWidget {
  @override
  _Veraendert0State createState() => _Veraendert0State();
}

class _Veraendert0State extends State<Veraendert0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('Beschwerdefrei seit 1 Woche'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }