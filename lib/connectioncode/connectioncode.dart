import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/faq/faq.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ConnectionCode extends StatelessWidget {
  final String _title = "Visitencode";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
            fontFamily: "Arial",
          ),
        ),
        backgroundColor: Colors.lightGreen[500],
      ),
      body: Column(
        children: <Widget> [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Bitte zeigen Sie Ihrem behandelnden Arzt den unten stehenden QR-Code. Mit dem Scan des Codes erlauben Sie den Zugriff auf Ihre persönlichen Gesundheitsdaten.",
            style: TextStyle(
              fontSize: 18.0,
            ),),
          ),
      Center(
          child:
          Container(
        padding: EdgeInsets.all(10.0),
        child: QrImage(
        data: "https://www.linkedin.com/in/linea-schmidt-3a3951199/", //Aktuell beispielhaft mit Webseite verbunden.
        version: QrVersions.auto,
      ),
      ))])
    );
  }
}
