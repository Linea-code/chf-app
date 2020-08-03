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
            tooltip:'Increment',
            child:
            Icon(Icons.help_outline,size: 50,),
            onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));} //Bei Klick wechsel zu FAQ
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar( //Kopfzeile mit Titel
        title: Text(_title, style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView (
        children:<Widget> [
          Column(
        children: <Widget> [
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text("Code für Ihren behandelnden Arzt: Mit dem Scan des Codes erlauben Sie den Zugriff auf Ihre persönlichen Gesundheitsdaten.", style: Theme.of(context).textTheme.subtitle1,),
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
                Container(
                  padding:EdgeInsets.all(10.0),
                  child:
                      Card( color: Color(0xfff0fcfc),
                        child:
                            ListTile (
                            title: Text("Web-Adresse:") ,
                            subtitle: Text("https://www.figma.com/proto/6gqEgzGl8CyR9CjCn1NpWE/Untitled?node-id=30%3A20&scaling=min-zoom "),
    )
                ))
              ]))])])
    );
  }
}
