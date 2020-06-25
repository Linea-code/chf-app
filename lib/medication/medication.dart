import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:herzinsuffizienz/faq/faq.dart';

class Medication extends StatefulWidget {
  @override
  _MedicationState createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  //Prinzipiell können die folgenden Listen zu einem späteren Eintpunkt aus einer Datenbank gewonnen werden, welche direkt mit dem Arzt verknüpft ist und somit kontinuierlich angepasst werden kann
  // Anlage der Listen für Medikation: Morgens, Mittags, Abends, Nachts
  var medMorning = ["1 Tabl. Metoproiolsuccinat (95 mg)", "1 Tabl. Ramipril (5 mg)", "1 Tabl. Pantoprazol (20 mg)"];
  var medDay = ["2 Kaps. Myrtol (120 mg)"];
  var medEavening =["1 Tabl. Clopidogrel (75 mg)"];
  var medNight = ["1 Tabl. Diphonhydamic-HC (50 mg)"];

  List<Widget> list = new List<Widget>();
// Anlage der Boolschen Variablen für das Abhacken der Medikationseinnahme -> Initialisierung mit false
  bool checkMorning = false;
  bool checkDay = false;
  bool checkEavening = false;
  bool checkNight = false;

  final String _title="Medikation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //FAQ Button -> bewegt sich bei scrollen mit
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen[500],
          child:
          Text("?",style: TextStyle(fontSize: 50,),),
          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: Text(_title,
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
            padding: EdgeInsets.all(10.0),
            child: Text("Basierend auf Ihrer Patientenakte müssen Sie folgende Medikamente zu den angegebenen Tageszeiten einnehmen:",
            style: TextStyle(
              fontSize: 16.0,
            ),),
          ),

          // Einzelne Karten je Tageszeit um Medikationseinnahme sparat abzuhacken
          //Übergabe der Beispiellisten von oben (Medikamentname und Dosirung sowie Einnahmeform) indem eigene Methode (siehe unten) aufgerufen wird
          // Bei Klick auf Box verändert wird der jeweilige Check-Wert auf true verändert und ein Hacken erscheint
          Card(
              color: checkMorning ? Colors.grey[200] : Colors.white,
          child:
                CheckboxListTile(
                  title: Text("Morgens"),
                  subtitle: getText(medMorning),
                  activeColor: Colors.lightGreen[500],
                  value: checkMorning,
                  onChanged: (bool value){
                    setState(() {
                      checkMorning = value;
                    });
                  },
                )
            ),
          Card(
            color: checkDay ? Colors.grey[200] : Colors.white,
              child:
              CheckboxListTile(
                title: Text("Mittags"),
                subtitle: getText(medDay),
                activeColor: Colors.lightGreen[500],
                value: checkDay,
                onChanged: (bool value){
                  setState(() {
                    checkDay = value;
                  });
                },
              ),

          ),
          Card(
            color: checkEavening ? Colors.grey[200] : Colors.white,
            child:
            CheckboxListTile(
              title: Text("Abends"),
              subtitle: getText(medEavening),
              value: checkEavening,
              activeColor: Colors.lightGreen[500],
              onChanged: (bool value){
                setState(() {
                  checkEavening = value;
                });
              },
            ),

          ),
          Card(
            color: checkNight ? Colors.grey[200] : Colors.white,
            child:
            CheckboxListTile(
              title: Text("Nachts"),
              subtitle: getText(medNight),
              activeColor: Colors.lightGreen[500],
              value: checkNight,
              onChanged: (bool value){
                setState(() {
                  checkNight = value;
                });
              },
            ),

          )
        ],
      ),
    );
  }
// Erstellung einer eigenen Methode um aus den angelegten Liste die Textteile sparat zu extrahieren und als text anzeigen zu lassen
  Widget getText(List<String> string){
    String text = "";
    for(var i = 0; i < string.length; i++){
      text = text + string[i] + "\n";
    }
    return Text(text);
  }

}