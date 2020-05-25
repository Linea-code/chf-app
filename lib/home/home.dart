import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/connectioncode/connectioncode.dart';
import 'package:herzinsuffizienz/faq/faq.dart';
import 'package:herzinsuffizienz/medication/medication.dart';
import 'package:herzinsuffizienz/onboarding/newprofile.dart';
import 'package:herzinsuffizienz/profile/profile.dart';
import 'package:herzinsuffizienz/settings/Settings.dart';
import 'package:herzinsuffizienz/symptoms/symptoms.dart';
import 'package:herzinsuffizienz/vitalparameters/vitalparameters.dart';

class Home extends StatelessWidget {
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
            subtitle: Text(
                'Sie müssen heute noch Ihre Mediakmente einnehmen!'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Medication()));
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Symptome'),
            subtitle: Text(
              'Bitte beantworten Sie heute noch Ihren Symptom-Fragebogen!'
            ),
            onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=> Symptoms()));
            },
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.trending_up),
            title: Text('Vitalparameter'),
            subtitle: Text('Bitte messen Sie Ihre Vitalparameter!'),
            onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=> VitalParameters()));
            },
          ),
        )
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
                  MaterialPageRoute(builder: (context) => VitalParameters()));
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
                  context, MaterialPageRoute(builder: (context) => Profile(newprofile: newprofile)));
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
