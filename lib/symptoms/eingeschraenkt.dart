import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Eingeschraenkt0 extends StatefulWidget {
  @override
  _Eingeschraenkt0State createState() => _Eingeschraenkt0State();
}

class _Eingeschraenkt0State extends State<Eingeschraenkt0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('gar nicht eingeschränkt'),
      color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
      onPressed: () {
        setState(() => _pressed = !_pressed);
      }
    );
  }
}
class Eingeschraenkt1 extends StatefulWidget {
  @override
  _Eingeschraenkt1State createState() => _Eingeschraenkt1State();
}

class _Eingeschraenkt1State extends State<Eingeschraenkt1> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('etwas eingeschränkt'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Eingeschraenkt2 extends StatefulWidget {
  @override
  _Eingeschraenkt2State createState() => _Eingeschraenkt2State();
}

class _Eingeschraenkt2State extends State<Eingeschraenkt2> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('mäßig eingeschränkt'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}

class Eingeschraenkt3 extends StatefulWidget {
  @override
  _Eingeschraenkt3State createState() => _Eingeschraenkt3State();
}

class _Eingeschraenkt3State extends State<Eingeschraenkt3> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('sehr eingeschränkt'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}

class Eingeschraenkt4 extends StatefulWidget {
  @override
  _Eingeschraenkt4State createState() => _Eingeschraenkt4State();
}

class _Eingeschraenkt4State extends State<Eingeschraenkt4> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('extrem eingeschränkt'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}