import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Erstellen der einzelnen Auswahlmöglichkeiten für die Fragebögen -> jeweils einzelne Knöpfe mit spezifischem Text
class Complicate0 extends StatefulWidget {
  @override
  _Complicate0State createState() => _Complicate0State();
}

class _Complicate0State extends State<Complicate0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ich hatte keines der angegebenen Probleme'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Complicate1 extends StatefulWidget {
  @override
  _Complicate1State createState() => _Complicate1State();
}

class _Complicate1State extends State<Complicate1> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('überhaupt nicht erschwert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Complicate2 extends StatefulWidget {
  @override
  _Complicate2State createState() => _Complicate2State();
}

class _Complicate2State extends State<Complicate2> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('etwas erschwert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Complicate3 extends StatefulWidget {
  @override
  _Complicate3State createState() => _Complicate3State();
}

class _Complicate3State extends State<Complicate3> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('relativ stark erschwert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Complicate4 extends StatefulWidget {
  @override
  _Complicate4State createState() => _Complicate4State();
}

class _Complicate4State extends State<Complicate4> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('sehr stark erschwert'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}