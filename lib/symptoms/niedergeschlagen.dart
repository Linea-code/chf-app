import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Niedergeschlagen0 extends StatefulWidget {
  @override
  _Niedergeschlagen0State createState() => _Niedergeschlagen0State();
}

class _Niedergeschlagen0State extends State<Niedergeschlagen0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('nie'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Niedergeschlagen1 extends StatefulWidget {
  @override
  _Niedergeschlagen1State createState() => _Niedergeschlagen1State();
}

class _Niedergeschlagen1State extends State<Niedergeschlagen1> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('selten'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Niedergeschlagen2 extends StatefulWidget {
  @override
  _Niedergeschlagen2State createState() => _Niedergeschlagen2State();
}

class _Niedergeschlagen2State extends State<Niedergeschlagen2> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('gelegentlich'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Niedergeschlagen3 extends StatefulWidget {
  @override
  _Niedergeschlagen3State createState() => _Niedergeschlagen3State();
}

class _Niedergeschlagen3State extends State<Niedergeschlagen3> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('oft'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Niedergeschlagen4 extends StatefulWidget {
  @override
  _Niedergeschlagen4State createState() => _Niedergeschlagen4State();
}

class _Niedergeschlagen4State extends State<Niedergeschlagen4> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('immer'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}