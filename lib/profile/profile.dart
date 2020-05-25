import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/onboarding/createprofile.dart';
import 'package:herzinsuffizienz/onboarding/newprofile.dart';


class Profile extends StatelessWidget {
  final NewProfile newprofile;
  Profile({this.newprofile});
  final String _title = "Profil: ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title + newprofile.vorname + " "+ newprofile.nachname,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
            fontFamily: "Arial",
          ),
        ),
        backgroundColor: Colors.lightGreen[500],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black12,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ]),
          ),
          ListTile(
                  title: Text(
                    "Vorname: ${newprofile.vorname} ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      color: Colors.black54,
                    ),
                  ),
                ),
          ListTile(
                  title: Text(
                    "Nachname: ${newprofile.nachname}",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      color: Colors.black54,
                    ),
                  ),
                ),
          ListTile(
                  title: Text(
                    "Geschlecht: ${newprofile.geschlecht} ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      color: Colors.black54,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Geburtsdatum: ${newprofile.birthdate.day}.${newprofile.birthdate.month}.${newprofile.birthdate.year} ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      color: Colors.black54,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Lebensumstände: ${newprofile.lebensumstaende} ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      color: Colors.black54,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Anzahl der Krankenhausaufenthalte: ${newprofile.krankenhausaufenthalte} ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      color: Colors.black54,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Begleiterkrankungen/Komorbiditäten: ${newprofile.begleiterkrankungen} ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      color: Colors.black54,
                    ),
                  ),
                ),
          Container(
            child: RaisedButton(
              color: Colors.black54,
              child: Text("Bearbeiten",
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Arial",
                  color: Colors.white,
                ),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateProfile()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
