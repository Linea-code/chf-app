import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Erschweren0 extends StatefulWidget {
  @override
  _Erschweren0State createState() => _Erschweren0State();
}

class _Erschweren0State extends State<Erschweren0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ich hatte keines der angegebenen Probleme'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Erschweren1 extends StatefulWidget {
  @override
  _Erschweren1State createState() => _Erschweren1State();
}

class _Erschweren1State extends State<Erschweren1> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('überhaupt nicht erschwert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Erschweren2 extends StatefulWidget {
  @override
  _Erschweren2State createState() => _Erschweren2State();
}

class _Erschweren2State extends State<Erschweren2> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('etwas erschwert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Erschweren3 extends StatefulWidget {
  @override
  _Erschweren3State createState() => _Erschweren3State();
}

class _Erschweren3State extends State<Erschweren3> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('relativ stark erschwert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Erschweren4 extends StatefulWidget {
  @override
  _Erschweren4State createState() => _Erschweren4State();
}

class _Erschweren4State extends State<Erschweren4> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('sehr stark erschwert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}