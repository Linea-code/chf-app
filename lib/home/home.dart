import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/connectioncode/connectioncode.dart';
import 'package:herzinsuffizienz/faq/faq.dart';
import 'package:herzinsuffizienz/medication/medication.dart';
import 'package:herzinsuffizienz/onboarding/newprofile.dart';
import 'package:herzinsuffizienz/profile/profile.dart';
import 'package:herzinsuffizienz/settings/Settings.dart';
import 'package:herzinsuffizienz/symptoms/symptoms.dart';
import 'package:herzinsuffizienz/vitalparameters/bmp.dart';
import 'package:herzinsuffizienz/vitalparameters/createSparkline.dart';
import 'package:herzinsuffizienz/vitalparameters/vitalparameters.dart';
import 'package:health/health.dart';
import 'package:herzinsuffizienz/vitalparameters/VitalparameterNeu.dart';

class Home extends StatelessWidget {
  var bpm = [
    71.0,
    57.0,
    59.0,
    60.0,
    62.0,
    100.0,
    77.0,
    60.0,
    55.0,
    100.0,
    88.0,
    55.0,
    64.0
  ]; // beispielhaft manuell Daten eingegeben
  final NewProfile newprofile;
  Home({this.newprofile});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Übersicht',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.lightGreen[500],
      ),
      body: ListView(children: <Widget>[
        Card(
          child: ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text('Medikationseinnahme'),
            subtitle: Text('Sie müssen heute noch Ihre Mediakmente einnehmen!'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Medication()));
            },
          ),
        ),
        Card(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage('assets/Blume.JPG'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            child: InkWell(
              splashColor: Colors.lightGreen[200],
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Symptoms()));
              },

            child: ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Symptome'),
              subtitle: Text(
                  'Bitte beantworten Sie heute noch Ihren Symptom-Fragebogen!'),
            ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Vitalparameter())); // muss evtl. wieder gändert werden zu VitalParameters()
          },
          child: Card(
            shadowColor: Colors.grey,
            child: Column(children: <Widget>[
              ListTile(
                //leading: Icon(Icons.trending_up),
                title: Text('Vitalparameter'),
                subtitle: Text('Bitte messen Sie täglich Ihre Vitalparameter!'),
              ),
              CreateSparkline(
                data: bpm,
              ),
            ]),
          ),
        ),
      ]),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          Container(
            height: 100.0,
            child: DrawerHeader(
              child: Text(
                'CHF-App',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22.0,
                ),
              ),
              decoration: BoxDecoration(color: Colors.lightGreen[500]),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              'Vitalparameter',
              style: TextStyle(fontSize: 16.0),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Vitalparameter()));  //Änderung, muss evtl. wieder rückgängig gemacht werden zu VitalParameters()
            },
          ),
          ListTile(
            leading: Icon(Icons.tag_faces),
            title: Text(
              'Symptome',
              style: TextStyle(fontSize: 16.0),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Symptoms()));
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text(
              'Medikamente',
              style: TextStyle(fontSize: 16.0),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Medication()));
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text(
              'Visitencode',
              style: TextStyle(fontSize: 16.0),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ConnectionCode()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profil',
              style: TextStyle(fontSize: 16.0),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile(newprofile: newprofile)));
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text(
              'FAQ',
              style: TextStyle(fontSize: 16.0),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FAQ()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Einstellungen',
              style: TextStyle(fontSize: 16.0),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            },
          )
        ]),
      ),
    );
  }

}


