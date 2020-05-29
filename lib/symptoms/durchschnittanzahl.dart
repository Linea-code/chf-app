import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Durchschnitt0 extends StatefulWidget {
  @override
  _Durchschnitt0State createState() => _Durchschnitt0State();
}

class _Durchschnitt0State extends State<Durchschnitt0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('nie in der Woche'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Durchschnitt1 extends StatefulWidget {
  @override
  _Durchschnitt1State createState() => _Durchschnitt1State();
}

class _Durchschnitt1State extends State<Durchschnitt1> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('1-2 mal pro Woche'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Durchschnitt2 extends StatefulWidget {
  @override
  _Durchschnitt2State createState() => _Durchschnitt2State();
}

class _Durchschnitt2State extends State<Durchschnitt2> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('3 mal oder weniger pro Woche'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Durchschnitt3 extends StatefulWidget {
  @override
  _Durchschnitt3State createState() => _Durchschnitt3State();
}

class _Durchschnitt3State extends State<Durchschnitt3> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('mindestens 1 mal pro Tag'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Durchschnitt4 extends StatefulWidget {
  @override
  _Durchschnitt4State createState() => _Durchschnitt4State();
}

class _Durchschnitt4State extends State<Durchschnitt4> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('einige Male am Tag'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Durchschnitt5 extends StatefulWidget {
  @override
  _Durchschnitt5State createState() => _Durchschnitt5State();
}

class _Durchschnitt5State extends State<Durchschnitt5> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('die ganze Zeit'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}