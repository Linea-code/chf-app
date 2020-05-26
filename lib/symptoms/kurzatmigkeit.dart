import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Kurzatmigkeit0 extends StatefulWidget {
  @override
  _Kurzatmigkeit0State createState() => _Kurzatmigkeit0State();
}

class _Kurzatmigkeit0State extends State<Kurzatmigkeit0> {
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
class Kurzatmigkeit1 extends StatefulWidget {
  @override
  _Kurzatmigkeit1State createState() => _Kurzatmigkeit1State();
}

class _Kurzatmigkeit1State extends State<Kurzatmigkeit1> {
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
class Kurzatmigkeit2 extends StatefulWidget {
  @override
  _Kurzatmigkeit2State createState() => _Kurzatmigkeit2State();
}

class _Kurzatmigkeit2State extends State<Kurzatmigkeit2> {
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