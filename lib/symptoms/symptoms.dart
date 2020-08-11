import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:herzinsuffizienz/symptoms/weeklyquesthealth.dart';
import 'package:herzinsuffizienz/symptoms/weeklyquestsymptoms.dart';
import 'package:herzinsuffizienz/faq/faq.dart';

class Symptoms extends StatelessWidget {
  final String _title = "Fragebögen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //FAQ-Knopf unten rechts
      floatingActionButton: FloatingActionButton(
          tooltip:'Increment',
          child:
         Icon(Icons.help_outline,size: 50,),
          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar( //Kopfzeile mit Titel
        title: Text(_title,style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            child: Card(
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 30),
                decoration: BoxDecoration(
                  //Farbverlauf als Hintergund
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xfff0fcfc),
                        Color(0xffbed3d4),
                      ]),
                 // Wahlweise auch mit Bild als Hintergund:
                 /* image: DecorationImage(
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                    image: AssetImage('assets/Neuseeland_Panorama.JPG'), //Hintergrundbild aus Assets
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.topCenter,
                  ),*/
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
                    title: Text("Symptome", style: Theme.of(context).textTheme.bodyText1,),
                    subtitle: Text("Bitte machen Sie in diesem Fragebogen einmal alle 2 Wochen Angaben zu Ihren Symptomen!",),
                  ),
                ),
              ))
          ),
          Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child:  Card(
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xfffaf7e3),
                      Color(0xffe8caa4),
                    ]),
                /*image: DecorationImage(
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                  image: AssetImage('assets/Neuseeland_Steine.png'), //Hintergundbild aus Assets
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),*/
              ),
            child: InkWell(
              splashColor: Colors.lightGreen[200],
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> WeeklyQuestHealth(),)); //Bei Klick gelangen zu Fragebogen
              },
              child:
              ListTile(
              title: Text("Gesundheit",style: Theme.of(context).textTheme.bodyText1,
                ),
              subtitle: Text("Bitte machen Sie in diesem Fragebogen einmal alle 2 Wochen Angaben zu Ihrer psychischen Gesundheit!",
              ),
            )
          ),
            ),),),
          Container(
            padding: EdgeInsets.only(right: 60, left: 60, top: 10, bottom: 15),
            child:Image.asset('assets/Doktor.PNG',
            fit: BoxFit.contain),
          ),
          ]
      ),
    );
  }
}