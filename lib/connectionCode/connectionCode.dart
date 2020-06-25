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
      // Fragezeichen unten rechts, bewegt sich bei scrollen mit
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightGreen[500],
            child:
            Text("?",style: TextStyle(fontSize: 50,),),
            onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));} //Bei Klick wechsel zu FAQ
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar( //Kopfzeile mit Titel
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
            child: Text("Bitte zeigen Sie Ihrem behandelnden Arzt den unten stehenden QR-Code oder nennen Sie ihm die unten stehende Webadresse. Mit dem Scan des Codes erlauben Sie den Zugriff auf Ihre persönlichen Gesundheitsdaten.",
            style: TextStyle(
              fontSize: 18.0,
            ),),
          ),
      Center(
          child:
              Column( children: <Widget> [
          Container(
        padding: EdgeInsets.all(10.0),
        child: QrImage( //QR-Code mit verlinkter Internetseite (kann beliegig angepasst werden)
        data: "https://www.figma.com/proto/6gqEgzGl8CyR9CjCn1NpWE/Untitled?node-id=30%3A20&scaling=min-zoom", //Aktuell beispielhaft mit Webseite verbunden.
        version: QrVersions.auto,
      ),
      ),
                Text("Web-Adresse: https://www.figma.com/proto/6gqEgzGl8CyR9CjCn1NpWE/Untitled?node-id=30%3A20&scaling=min-zoom ")
              ]))])
    );
  }
}
