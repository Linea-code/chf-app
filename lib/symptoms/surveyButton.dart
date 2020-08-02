import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:herzinsuffizienz/symptoms/AppBuilder.dart';
//Erstellen des Knopfes für die Umfragen -> mit callback Funktion um die Ergebnisse während der Umfarge kurz zu speichern und die Frabe zu ändern (grün wenn ausgewählt und weiß wenn nicht ausgewählt)
class SurveyButton extends StatefulWidget {
  final String text;
  Function(String, int) callback;
  String currentValue;
  final int currentStep;


  SurveyButton({this.text, this.callback, this.currentValue, this.currentStep});

  @override
  _SurveyButtonState createState() => _SurveyButtonState();
}

class _SurveyButtonState extends State<SurveyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child:
        RaisedButton(padding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
        child:Align(
          alignment: Alignment.centerLeft,
          child:
        Text(widget.text,style: Theme.of(context).textTheme.bodyText2,textAlign: TextAlign.left,)),
        color: (widget.text == widget.currentValue) ? Colors.lightGreen[400] : Colors.grey[300],
        onPressed: () {
          setState(() {
            widget.callback(widget.text, widget.currentStep);
            AppBuilder.of(context).rebuild();
          });}),
    );
  }
}
