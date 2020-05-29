import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Laestig0 extends StatefulWidget {
  @override
  _Laestig0State createState() => _Laestig0State();
}

class _Laestig0State extends State<Laestig0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ich hatte keine'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}

class Laestig1 extends StatefulWidget {
  @override
  _Laestig1State createState() => _Laestig1State();
}

class _Laestig1State extends State<Laestig1> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('nicht lästig'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Laestig2 extends StatefulWidget {
  @override
  _Laestig2State createState() => _Laestig2State();
}

class _Laestig2State extends State<Laestig2> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('wenig lästig'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}

class Laestig3 extends StatefulWidget {
  @override
  _Laestig3State createState() => _Laestig3State();
}

class _Laestig3State extends State<Laestig3> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('etwas lästig'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Laestig4 extends StatefulWidget {
  @override
  _Laestig4State createState() => _Laestig4State();
}

class _Laestig4State extends State<Laestig4> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ziemlich lästig'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Laestig5 extends StatefulWidget {
  @override
  _Laestig5State createState() => _Laestig5State();
}

class _Laestig5State extends State<Laestig5> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('extrem lästig'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}