import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Verstehen0 extends StatefulWidget {
  @override
  _Verstehen0State createState() => _Verstehen0State();
}

class _Verstehen0State extends State<Verstehen0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ich bin komplett informiert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Verstehen1 extends StatefulWidget {
  @override
  _Verstehen1State createState() => _Verstehen1State();
}

class _Verstehen1State extends State<Verstehen1> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ich verstehe fast alles'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Verstehen2 extends StatefulWidget {
  @override
  _Verstehen2State createState() => _Verstehen2State();
}

class _Verstehen2State extends State<Verstehen2> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ich verstehe etwas'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Verstehen3 extends StatefulWidget {
  @override
  _Verstehen3State createState() => _Verstehen3State();
}

class _Verstehen3State extends State<Verstehen3> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ich verstehe nur wenig'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Verstehen4 extends StatefulWidget {
  @override
  _Verstehen4State createState() => _Verstehen4State();
}

class _Verstehen4State extends State<Verstehen4> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ich verstehe gar nichts'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}