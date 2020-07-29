import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:herzinsuffizienz/symptoms/weeklyquesthealth.dart';
import 'package:herzinsuffizienz/symptoms/weeklyquestsymptoms.dart';
import 'package:herzinsuffizienz/faq/faq.dart';

class Symptoms extends StatelessWidget {
  final String _title = "Symptome";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //FAQ-Knopf unten rechts
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen[500],
          tooltip:'Increment',
          child:
         Icon(Icons.help_outline,size: 50,),
          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar( //Kopfzeile mit Titel
        title: Text(_title,
        ),
        backgroundColor: Colors.lightGreen[500],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15),
          Card(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                    image: AssetImage('assets/Neuseeland_Panorama.JPG'), //Hintergrundbild aus Assets
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: InkWell(
                  splashColor: Colors.lightGreen[200],
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> WeeklyQuestSymptoms()) //Bei Klick gelangen zu Fragebogen
                    );
                  },
                  child:
                  ListTile(
                    title: Text("Fragebogen: Symptome",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22.0,
                      ),),
                    subtitle: Text("Bitte machen Sie in diesem Fragebogen einmal alle 2 Wochen Angaben zu Ihren Symptomen!",
                      style: TextStyle(
                        color: Colors.black,
                      ),),
                  ),
                ),
              )
          ),
          Card(
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                  image: AssetImage('assets/Neuseeland_Steine.png'), //Hintergundbild aus Assets
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
            child: InkWell(
              splashColor: Colors.lightGreen[200],
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> WeeklyQuestHealth(),)); //Bei Klick gelangen zu Fragebogen
              },
              child:
              ListTile(
              title: Text("Fragebogen: Gesundheit",
                ),
              subtitle: Text("Bitte machen Sie in diesem Fragebogen einmal alle 2 Wochen Angaben zu Ihrer psychischen Gesundheit!",
              style: TextStyle(color: Colors.black),),
            )
          ),
            ),)
          ]
      ),
    );
  }
}