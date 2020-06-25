import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/onboarding/createprofile.dart';
import 'package:herzinsuffizienz/onboarding/newprofile.dart';
import 'package:herzinsuffizienz/faq/faq.dart';


class Profile extends StatelessWidget {
  //Ermöglichung der Übertragung der Daten aus CreateProfile in die Profilansicht
  final NewProfile newprofile;
  Profile({this.newprofile});
  final String _title = "Profil: ";
  @override
  Widget build(BuildContext context) {
    return Scaffold( //FAQ-Knopf unten rechts
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen[500],
          child:
          Text("?",style: TextStyle(fontSize: 50,),),
          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar( //Kopfzeile mit Titel und Name sowie Vorname (aus CreateProfile)
        title: Text(
          _title + newprofile.firstName + " "+ newprofile.secondName,
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
          //Liste mit einzelnen Angaben, welche in CreateProfile getätigt wurden
          ListTile(
                  title: Text(
                    "Vorname: ${newprofile.firstName} ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      color: Colors.black54,
                    ),
                  ),
                ),
          ListTile(
                  title: Text(
                    "Nachname: ${newprofile.secondName}",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      color: Colors.black54,
                    ),
                  ),
                ),
          ListTile(
                  title: Text(
                    "Geschlecht: ${newprofile.gender} ",
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
                    "Lebensumstände: ${newprofile.livingConditions} ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      color: Colors.black54,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Anzahl der Krankenhausaufenthalte: ${newprofile.hospitalization} ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      color: Colors.black54,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Begleiterkrankungen/Komorbiditäten: ${newprofile.comorbidities} ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      color: Colors.black54,
                    ),
                  ),
                ),
          Container(
            //Knopf zum bearbeiten/neu Eingeben des Profils
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
