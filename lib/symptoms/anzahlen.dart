import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anzahlen0 extends StatefulWidget {
  @override
  _Anzahlen0State createState() => _Anzahlen0State();
}

class _Anzahlen0State extends State<Anzahlen0> {
  bool tap = false;
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('nie in der Woche'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          if(tap == false) {
            setState(() => _pressed = !_pressed);
            tap = !tap;
          }
        }
    );
  }
}

class Anzahlen1 extends StatefulWidget {
  @override
  _Anzahlen1State createState() => _Anzahlen1State();
}

class _Anzahlen1State extends State<Anzahlen1> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('weniger als 1 mal pro Woche'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}

class Anzahlen2 extends StatefulWidget {
  @override
  _Anzahlen2State createState() => _Anzahlen2State();
}

class _Anzahlen2State extends State<Anzahlen2> {
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

class Anzahlen3 extends StatefulWidget {
  @override
  _Anzahlen3State createState() => _Anzahlen3State();
}

class _Anzahlen3State extends State<Anzahlen3> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('3 oder mehrfach pro Woche'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}

class Anzahlen4 extends StatefulWidget {
  @override
  _Anzahlen4State createState() => _Anzahlen4State();
}

class _Anzahlen4State extends State<Anzahlen4> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('jeden Tag'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}