import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Versorgt0 extends StatefulWidget {
  @override
  _Versorgt0State createState() => _Versorgt0State();
}

class _Versorgt0State extends State<Versorgt0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ich bin komplett und gut versorgt'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Versorgt1 extends StatefulWidget {
  @override
  _Versorgt1State createState() => _Versorgt1State();
}

class _Versorgt1State extends State<Versorgt1> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ich bin gut versorgt'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Versorgt2 extends StatefulWidget {
  @override
  _Versorgt2State createState() => _Versorgt2State();
}

class _Versorgt2State extends State<Versorgt2> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ich bin ein wenig versorgt'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Versorgt3 extends StatefulWidget {
  @override
  _Versorgt3State createState() => _Versorgt3State();
}

class _Versorgt3State extends State<Versorgt3> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ich habe wenig Ahnung'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}

class Versorgt4 extends StatefulWidget {
  @override
  _Versorgt4State createState() => _Versorgt4State();
}

class _Versorgt4State extends State<Versorgt4> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ich habe überhaupt keine Ahnung'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}