import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Behinderung0 extends StatefulWidget {
  @override
  _Behinderung0State createState() => _Behinderung0State();
}

class _Behinderung0State extends State<Behinderung0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('es hat mich gar nicht behindert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Behinderung1 extends StatefulWidget {
  @override
  _Behinderung1State createState() => _Behinderung1State();
}

class _Behinderung1State extends State<Behinderung1> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('es hat mich kaum behindert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Behinderung2 extends StatefulWidget {
  @override
  _Behinderung2State createState() => _Behinderung2State();
}

class _Behinderung2State extends State<Behinderung2> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('es hat mich wenig behindert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Behinderung3 extends StatefulWidget {
  @override
  _Behinderung3State createState() => _Behinderung3State();
}

class _Behinderung3State extends State<Behinderung3> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('es hat mich etwas behindert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Behinderung4 extends StatefulWidget {
  @override
  _Behinderung4State createState() => _Behinderung4State();
}

class _Behinderung4State extends State<Behinderung4> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('es hat mich ziemlich behindert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Behinderung5 extends StatefulWidget {
  @override
  _Behinderung5State createState() => _Behinderung5State();
}

class _Behinderung5State extends State<Behinderung5> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('es hat mich extrem behindert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Behinderung6 extends StatefulWidget {
  @override
  _Behinderung6State createState() => _Behinderung6State();
}

class _Behinderung6State extends State<Behinderung6> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('nicht zutreffend'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}