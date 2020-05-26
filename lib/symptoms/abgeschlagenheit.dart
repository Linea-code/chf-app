import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Abgeschlagenheit0 extends StatefulWidget {
  @override
  _Abgeschlagenheit0State createState() => _Abgeschlagenheit0State();
}

class _Abgeschlagenheit0State extends State<Abgeschlagenheit0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('gar nicht'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Abgeschlagenheit1 extends StatefulWidget {
  @override
  _Abgeschlagenheit1State createState() => _Abgeschlagenheit1State();
}

class _Abgeschlagenheit1State extends State<Abgeschlagenheit1> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('leicht'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Abgeschlagenheit2 extends StatefulWidget {
  @override
  _Abgeschlagenheit2State createState() => _Abgeschlagenheit2State();
}

class _Abgeschlagenheit2State extends State<Abgeschlagenheit2> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('stark'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}