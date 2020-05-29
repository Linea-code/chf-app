import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Veraendert0 extends StatefulWidget {
  @override
  _Veraendert0State createState() => _Veraendert0State();
}

class _Veraendert0State extends State<Veraendert0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('Beschwerdefrei seit 1 Woche'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Veraendert1 extends StatefulWidget {
  @override
  _Veraendert1State createState() => _Veraendert1State();
}

class _Veraendert1State extends State<Veraendert1> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('sehr viel besser'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Veraendert2 extends StatefulWidget {
  @override
  _Veraendert2State createState() => _Veraendert2State();
}

class _Veraendert2State extends State<Veraendert2> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('etwas besser'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}

class Veraendert3 extends StatefulWidget {
  @override
  _Veraendert3State createState() => _Veraendert3State();
}

class _Veraendert3State extends State<Veraendert3> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('unverändert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}

class Veraendert4 extends StatefulWidget {
  @override
  _Veraendert4State createState() => _Veraendert4State();
}

class _Veraendert4State extends State<Veraendert4> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('etwas schlimmer'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}

class Veraendert5 extends StatefulWidget {
  @override
  _Veraendert5State createState() => _Veraendert5State();
}

class _Veraendert5State extends State<Veraendert5> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('sehr viel schlimmer'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}

