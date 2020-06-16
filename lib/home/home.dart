import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:herzinsuffizienz/connectioncode/connectioncode.dart';
import 'package:herzinsuffizienz/faq/faq.dart';
import 'package:herzinsuffizienz/medication/medication.dart';
import 'package:herzinsuffizienz/onboarding/newprofile.dart';
import 'package:herzinsuffizienz/profile/profile.dart';
import 'package:herzinsuffizienz/settings/Settings.dart';
import 'package:herzinsuffizienz/symptoms/symptoms.dart';
import 'package:herzinsuffizienz/vitalparameters/Vitalparameter.dart';


class Home extends StatelessWidget {
  final NewProfile newprofile;
  Home({this.newprofile});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.lightGreen[500],
          child:
          Text("?",style: TextStyle(fontSize: 50,),),
          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
      body:Container(
        padding: EdgeInsets.all(10.0),
          child: ListView(children: <Widget>[
        SizedBox(height: 10.0,),
        Card(child:
        Row(
          children:<Widget>[
            Expanded(
              flex: 1,
              child: Icon(Icons.add_alert,
              size: 60,
              color: Colors.grey,),
            ),
          Expanded(
            flex: 3,
            child: Card(
      child: Container(
          height: 100,
          decoration: BoxDecoration(
           gradient: LinearGradient(
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
             colors: [Colors.lightGreen[50], Colors.lightGreen[100]]
            ),
          ),
          child: InkWell(
            splashColor: Colors.lightGreen[100],
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Symptoms()));
            },
          child:
          Center(
            child: ListTile(
            title: Text('Medikationseinnahme'),
            subtitle: Text('Sie müssen heute noch Ihre Mediakmente einnehmen!'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Medication()));
            },
          ),)
        ),
      ),
        ),)]),),
        SizedBox(height: 10.0,),
        Card(child:
        Row (
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(Icons.assignment,
                size: 60.0,
                color: Colors.grey,),
            ),
            Expanded(
              flex: 3,
              child:
          Card(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.lightGreen[50], Colors.lightGreen[100]]
              ),
            ),
            child: InkWell(
              splashColor: Colors.lightGreen[100],
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Symptoms()));
              },
            child: Center(
              child: ListTile(
              title: Text('Symptome'),
              subtitle: Text(
                  'Bitte beantworten Sie einmal alle 2 Wochen die Symptom-Fragebögen!'),
            ),)
            ),
          ),
        ),),
           ]),),
        SizedBox(height: 10.0,),
        Card(child:
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Vitalparameter()));
          },
          child:Row(
    children:<Widget>[
      Expanded(
        flex: 1,
        child: Icon(Icons.favorite_border,
        size: 60,
        color: Colors.grey,)
      ),
          Expanded(
            flex:3,
          child: Card(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.lightGreen[50], Colors.lightGreen[100]]
                ),
              ),
              child: InkWell(
                splashColor: Colors.lightGreen[100],
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Symptoms()));
                },
                child: Center(
                  child:   ListTile(
                  title: Text('Vitalparameter'),
                  subtitle: Text('Bitte messen Sie täglich Ihre Vitalparameter!'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Vitalparameter()));
                  },
                ),)
              ),
            ),
          ),)])
        ),),

      ])),

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


