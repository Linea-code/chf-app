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



  final String _title = "Profil";
  @override
  Widget build(BuildContext context) {
    return profile != null ? Scaffold( //FAQ-Knopf unten rechts
      floatingActionButton: FloatingActionButton(
          tooltip:'Increment',
          child:
          Icon(Icons.help_outline,size: 50,),
          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar( //Kopfzeile mit Titel und Name sowie Vorname (aus CreateProfile)
        title: Text(
          _title , style: Theme.of(context).textTheme.headline1,
        ) ,
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
          Container(
            padding: EdgeInsets.all(15),
                  child: Text(
                    "Vorname: ${profile.firstName} "
                  ),
                ),
          Container(
            padding: EdgeInsets.all(15),
            child:  Text(
                    "Nachname: ${profile.secondName}"
                  ),
                ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
                    "Geschlecht: ${profile.gender} "
                  ),
                ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text("Geburtsdatum: ${profile.birthdate.day}.${profile.birthdate.month}.${profile.birthdate.year} "
                  ),
                ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
                    "Lebensumstände: ${profile.livingConditions} "
                  ),
                ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
                    "Krankenhausaufenthalte: ${profile.hospitalization} "
                  ),
                ),
          Container(
            padding: EdgeInsets.all(15),
            child:  Text(
                    "Begleiterkrankungen: ${profile.comorbidities} "
                  ),
                ),
          Container(
            padding: EdgeInsets.only(left:50,right: 50, top: 30),
            //Knopf zum bearbeiten/neu Eingeben des Profils
            child: RaisedButton(
              padding: EdgeInsets.all(10),
              color: Theme.of(context).primaryColor,
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
    ) : Scaffold( appBar: AppBar( //Kopfzeile mit Titel und Name sowie Vorname (aus CreateProfile)
      title: Text(
       "Steckbiref ", style: Theme.of(context).textTheme.headline1,
      ) ,
    ),
        body: Center( child: SpinKitPumpingHeart(color: Colors.red[300])));
  }
}
