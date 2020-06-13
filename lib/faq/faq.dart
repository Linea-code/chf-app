import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

class FAQ extends StatelessWidget {
  final String _title = "FAQ";
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
      body:Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Card(
        child:
            ExpansionTile(
              title: Text("Was genau ist Herzinsuffizienz?",
              style: TextStyle(
                fontSize: 18.0,
              ),),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child:
                Text("Bei chronischer Herzinsuffizienz handelt es sich um eine fortschreitende Herzerkrankung. Hierbei ist die Pumpfunktion des Herzens vermindert, sodass nicht mehr genügend Blut und damit Sauerstoff und Nährstoffe zu Organen und anderen Körperbereichen gelangen.", //TODO:Text ersetzten durch eigenen!
                style: TextStyle(
                  fontSize: 16.0,
                ),),
                )],
            ),),
            Card(
              child:
              ExpansionTile(
                title: Text("Wie misst man korrekt Blutdruck?",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),),
                children: <Widget>[
                  Container(
                    child:
                      Image.asset("assets/Blume.JPG"),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child:
                    Text("Bei chronischer Herzinsuffizienz handelt es sich um eine fortschreitende Herzerkrankung. Hierbei ist die Pumpfunktion des Herzens vermindert, sodass nicht mehr genügend Blut und damit Sauerstoff und Nährstoffe zu Organen und anderen Körperbereichen gelangen.", //TODO:Text ersetzten durch eigenen!
                      style: TextStyle(
                        fontSize: 16.0,
                      ),),
                  )],
              ),),

            ]),
      )

    );
  }


}