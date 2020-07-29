import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:herzinsuffizienz/connectioncode/connectioncode.dart';
import 'package:herzinsuffizienz/faq/faq.dart';
import 'package:herzinsuffizienz/home/daysUntil.dart';
import 'package:herzinsuffizienz/medication/medication.dart';
import 'package:herzinsuffizienz/profile/profile.dart';
import 'package:herzinsuffizienz/settings/Settings.dart';
import 'package:herzinsuffizienz/symptoms/symptoms.dart';
import 'package:herzinsuffizienz/vitalparameters/Vitalparameter.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Button unten rechts zum FAQ -> bleibt beim scrollen
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen[400],
          tooltip:'Increment',
          child:
          Icon(Icons.help_outline,size: 50,),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FAQ()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        //Kopfzeile mit Titel
        title: Text(
          'Übersicht',
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Colors.lightGreen[400],
      ),
      body: Container(
          padding: EdgeInsets.all(10.0), //Seitenrand von 10 festgelegt
          child: ListView(children: <Widget>[
            SizedBox(
              height: 10.0,
            ), //Abstandshalter

            // Verschiedene Karten mit den jeweiligen Infos/Erinnerungen und eingeleitet durch ein entsprechendes Icon
            //Aufteilung jeweils so, dass 1/4 der Siete Icon und 3/4 der Seite Karte mit Text sind
            Card(
              child: Row(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.add_alert,
                    size: 60,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Card(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        //jeweils Farbverlauf im Hintergrund der Karten
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.lightGreen[50],
                              Colors.lightGreen[100]
                            ]),
                      ),
                      child: InkWell(
                          splashColor: Colors.lightGreen[100],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Symptoms())); //Durch Klick auf Karte wechsel zu Symptomen
                          },
                          child: Center(
                            child: ListTile(
                              title: Text('Medikation'),
                              subtitle: Text(
                                  'Sie müssen noch Ihre Medikamente einnehmen!'),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Medication())); //Durch Klick auf Karte wechsel zu Medikation
                              },
                            ),
                          )),
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 10.0,
            ), //Abstandshalter
            Card(
              child: Row(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.assignment,
                    size: 60.0,
                    color: Colors.grey,
                  ),
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
                            colors: [
                              Colors.lightGreen[50],
                              Colors.lightGreen[100]
                            ]),
                      ),
                      child: InkWell(
                          splashColor: Colors.lightGreen[100],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Symptoms())); //durch Klick gelangen zu Symptomen
                          },
                          child: Center(
                            child: ListTile(
                              title: Text('Symptome'),
                              subtitle:
                                DaysUntil(),
                            ),
                          )),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Vitalparameter())); // durch Klick gelangen auf Vitalparameter
                  },
                  child: Row(children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.favorite_border,
                          size: 60,
                          color: Colors.grey,
                        )),
                    Expanded(
                      flex: 3,
                      child: Card(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.lightGreen[50],
                                  Colors.lightGreen[100]
                                ]),
                          ),
                          child: InkWell(
                              splashColor: Colors.lightGreen[100],
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Symptoms()));
                              },
                              child: Center(
                                child: ListTile(
                                  title: Text('Vitalparameter'),
                                  subtitle: Text(
                                      'Bitte messen Sie täglich Ihre Vitalparameter!'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Vitalparameter())); //durch Klick gelangen auf Vitalparameter
                                  },
                                ),
                              )),
                        ),
                      ),
                    )
                  ])),
            ),
          ])),

      // Drawer oben links -> Menu was geöffnet und geschlossen werden kann und eine Übersicht über alle Funktionen inklusive der entsprechenden Navigation gefunden werden kann

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
            leading: Icon(Icons.favorite, size: 35,),
            title: Text(
              'Vitalparameter', style: Theme.of(context).textTheme.headline4,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Vitalparameter())); // Wechsel zu Vitalparameter
            },
          ),
          ListTile(
            leading: Icon(Icons.tag_faces, size: 35,),
            title: Text(
              'Symptome',
              style: Theme.of(context).textTheme.headline4,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Symptoms())); //wechsel zu Symptome
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital, size: 35,),
            title: Text(
              'Medikamente',
              style: Theme.of(context).textTheme.headline4,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Medication())); // wechsel zu Medikation
            },
          ),
          ListTile(
            leading: Icon(Icons.share, size: 35,),
            title: Text(
              'Visitencode',
              style: Theme.of(context).textTheme.headline4,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ConnectionCode())); // Wechsel zu Visitencode
            },
          ),
          ListTile(
            leading: Icon(Icons.person, size: 35,),
            title: Text(
              'Profil',
              style: Theme.of(context).textTheme.headline4,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile())); // wechsel zu Profil und Übergabe der eingegebenen Werte auf onboarding Seite
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline, size: 35,),
            title: Text(
              'Häufige Fragen',
              style: Theme.of(context).textTheme.headline4,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FAQ())); // wechsel zu FAQ
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 35,),
            title: Text(
              'Einstellungen',
              style: Theme.of(context).textTheme.headline4,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Settings())); // wechsel zu Einstellungen
            },
          )
        ]),
      ),
    );
  }
}
