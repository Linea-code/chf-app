import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ungluecklich0 extends StatefulWidget {
  @override
  _Ungluecklich0State createState() => _Ungluecklich0State();
}

class _Ungluecklich0State extends State<Ungluecklich0> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('gar nicht unglücklich'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Ungluecklich1 extends StatefulWidget {
  @override
  _Ungluecklich1State createState() => _Ungluecklich1State();
}

class _Ungluecklich1State extends State<Ungluecklich1> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('kaum unglücklich'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Ungluecklich2 extends StatefulWidget {
  @override
  _Ungluecklich2State createState() => _Ungluecklich2State();
}

class _Ungluecklich2State extends State<Ungluecklich2> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('wenig unglücklich'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Ungluecklich3 extends StatefulWidget {
  @override
  _Ungluecklich3State createState() => _Ungluecklich3State();
}

class _Ungluecklich3State extends State<Ungluecklich3> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('etwas unglücklich'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Ungluecklich4 extends StatefulWidget {
  @override
  _Ungluecklich4State createState() => _Ungluecklich4State();
}

class _Ungluecklich4State extends State<Ungluecklich4> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('ziemlich unglücklich'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
class Ungluecklich5 extends StatefulWidget {
  @override
  _Ungluecklich5State createState() => _Ungluecklich5State();
}

class _Ungluecklich5State extends State<Ungluecklich5> {
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('sehr unglücklich'),
        color: _pressed ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() => _pressed = !_pressed);
        }
    );
  }
}
