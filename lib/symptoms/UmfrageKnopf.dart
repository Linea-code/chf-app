import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:herzinsuffizienz/symptoms/AppBuilder.dart';

class UmfrageButton extends StatefulWidget {
  final String text;
  Function(String, int) callback;
  String currentValue;
  final int currentStep;


  UmfrageButton({this.text, this.callback, this.currentValue, this.currentStep});

  @override
  _UmfrageButtonState createState() => _UmfrageButtonState();
}

class _UmfrageButtonState extends State<UmfrageButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(widget.text),
        color: (widget.text == widget.currentValue) ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() {
            widget.callback(widget.text, widget.currentStep);
            AppBuilder.of(context).rebuild();
          });

        }
    );
  }
}
