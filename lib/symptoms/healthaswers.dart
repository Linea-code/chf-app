import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Erstellen der einzlenen Knöpfe für Fragebogen mit spezifischem Text
class Health0 extends StatefulWidget {
  @override
  _Health0State createState() => _Health0State();
}

class _Health0State extends State<Health0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('überhaupt nicht'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Health1 extends StatefulWidget {
  @override
  _Health1State createState() => _Health1State();
}

class _Health1State extends State<Health1> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('An einzelnen Tagen'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Health2 extends StatefulWidget {
  @override
  _Health2State createState() => _Health2State();
}

class _Health2State extends State<Health2> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('an mehr als der Hälfte der Tagen'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Health3 extends StatefulWidget {
  @override
  _Health3State createState() => _Health3State();
}

class _Health3State extends State<Health3> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('beinahe jeden Tag'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}