import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wassereinlagerung0 extends StatefulWidget {
  @override
  _Wassereinlagerung0State createState() => _Wassereinlagerung0State();
}

class _Wassereinlagerung0State extends State<Wassereinlagerung0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('gar nicht'),
      color: _pressed ? Colors.lightGreen : Colors.grey,
      onPressed: () {
        setState(() => _pressed = !_pressed);
      }
    );
  }
}
class Wassereinlagerung1 extends StatefulWidget {
  @override
  _Wassereinlagerung1State createState() => _Wassereinlagerung1State();
}

class _Wassereinlagerung1State extends State<Wassereinlagerung1> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('gar nicht'),
        color: _pressed ? Colors.lightGreen : Colors.grey,
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Wassereinlagerung2 extends StatefulWidget {
  @override
  _Wassereinlagerung2State createState() => _Wassereinlagerung2State();
}

class _Wassereinlagerung2State extends State<Wassereinlagerung2> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('gar nicht'),
        color: _pressed ? Colors.lightGreen : Colors.grey,
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}