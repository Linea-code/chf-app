import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/onboarding/createprofile.dart';
import 'package:herzinsuffizienz/onboarding/newprofile.dart';
import 'package:herzinsuffizienz/faq/faq.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  //Ermöglichung der Übertragung der Daten aus CreateProfile in die Profilansicht
 var profile;

  void loadProfile () async{
    profile = await NewProfile.loadData();
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    loadProfile();
  }



  final String _title = "Profil: ";
  @override
  Widget build(BuildContext context) {
    return profile != null ? Scaffold( //FAQ-Knopf unten rechts
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen[500],
          tooltip:'Increment',
          child:
          Icon(Icons.help_outline,size: 50,),
          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar( //Kopfzeile mit Titel und Name sowie Vorname (aus CreateProfile)
        title: Text(
          _title + profile.firstName + " "+ profile.secondName
        ) ,
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
                  title:  Text(
                    "Vorname: ${profile.firstName} "
                  ),
                ),
          ListTile(
                  title: Text(
                    "Nachname: ${profile.secondName}"
                  ),
                ),
          ListTile(
                  title: Text(
                    "Geschlecht: ${profile.gender} "
                  ),
                ),
                ListTile(
                  title: Text("Geburtsdatum: ${profile.birthdate.day}.${profile.birthdate.month}.${profile.birthdate.year} "
                  ),
                ),
                ListTile(
                  title: Text(
                    "Lebensumstände: ${profile.livingConditions} "
                  ),
                ),
                ListTile(
                  title: Text(
                    "Anzahl der Krankenhausaufenthalte: ${profile.hospitalization} "
                  ),
                ),
                ListTile(
                  title: Text(
                    "Begleiterkrankungen/Komorbiditäten: ${profile.comorbidities} "
                  ),
                ),
          Container(
            padding: EdgeInsets.all(30),
            //Knopf zum bearbeiten/neu Eingeben des Profils
            child: RaisedButton(
              child: Text("Bearbeiten", style: Theme.of(context).textTheme.headline3),
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
    ) : Scaffold( body: SpinKitPumpingHeart(color: Colors.red[300]));
  }
}
