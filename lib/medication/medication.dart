import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:herzinsuffizienz/faq/faq.dart';
import 'package:herzinsuffizienz/medication/saveMedications.dart';

class Medication extends StatefulWidget {
  @override
  _MedicationState createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  //Prinzipiell können die folgenden Listen zu einem späteren Eintpunkt aus einer Datenbank gewonnen werden, welche direkt mit dem Arzt verknüpft ist und somit kontinuierlich angepasst werden kann
  // Anlage der Listen für Medikation: Morgens, Mittags, Abends, Nachts
  var medMorning = ["1 Tabl. Metoproiolsuccinat (95 mg)", "1 Tabl. Ramipril (5 mg)", "1 Tabl. Pantoprazol (20 mg)"];
  var medDay = ["2 Kaps. Myrtol (120 mg)"];
  var medEvening =["1 Tabl. Clopidogrel (75 mg)"];
  var medNight = ["1 Tabl. Diphonhydamic-HC (50 mg)"];

  List<Widget> list = new List<Widget>();

  final String _title="Medikation";

  // Anlage der Boolschen Variablen für das Abhacken der Medikationseinnahme -> Initialisierung mit false
  var medicationState;

  void loadMedications () async{
    medicationState = await SaveMedications.loadData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadMedications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xfff0fcfc),
      //FAQ Button -> bewegt sich bei scrollen mit
      floatingActionButton: FloatingActionButton(
          tooltip:'Increment',
          child:
          Icon(Icons.help_outline,size: 50,),
          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        title: Text(_title, style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView(
        children: <Widget>[
          (medicationState != null && medicationState.feeling != null) ? SizedBox():
          Card(
            child:
            ListTile(
              title: Text("Wie geht es Ihnen heute?"),
              subtitle: Column(
                children: <Widget>[
                RaisedButton(
                  color: Colors.lightGreen[200],
                  child: Text("\u{1F642} gut"),
                  onPressed: (){ setState(() {
                    medicationState.feeling = "gut";
                    medicationState.saveData();
                  });},
                ),
                SizedBox(width: 10,),
                RaisedButton(
                  color: Colors.orange[200],
                  child: Text("\u{1F610} mittel"),
                  onPressed: (){ setState(() {
                    medicationState.feeling = "mittel";
                    medicationState.saveData();
                  });},
                ),
                SizedBox(width: 10,),
                RaisedButton(
                  color: Colors.red[200],
                  child: Text("\u{1F641} schlecht"),
                  onPressed: (){ setState(() {
                    medicationState.feeling = "schlecht";
                    medicationState.saveData();
                  });},
                ),
              ],),
            ),

          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text("Sie müssen heute folgende Medikamente einnehmen:",
            style: Theme.of(context).textTheme.headline3),
          ),

          // Einzelne Karten je Tageszeit um Medikationseinnahme sparat abzuhacken
          //Übergabe der Beispiellisten von oben (Medikamentname und Dosirung sowie Einnahmeform) indem eigene Methode (siehe unten) aufgerufen wird
          // Bei Klick auf Box verändert wird der jeweilige Check-Wert auf true verändert und ein Hacken erscheint
          //(medicationState != null && medicationState.checkMorning) ? SizedBox(): // Dieser Codeabschnitt kann eingefügt werden, wenn die Karten zur Medikation
          //nach Einnahme verschwieden sillen -> Aufgrund von vermutlichen Usability Problemen, da ältere menschen versehentlich auf den Knopf drücken können
          // und dann ihre medikation nicht mehr sehen und es so zu falschen Angaben beim Arzt kommen kann, wurde dieser Abschnitt hier auskommentiert
          Card(
              color: (medicationState != null
                  && medicationState.checkMorning) ? Colors.grey[200] : Color(0xfff0fcfc),
          child:
                CheckboxListTile(
                  title: Text("Morgens"),
                  subtitle: getText(medMorning),
                  activeColor: Colors.lightGreen[500],
                  value: (medicationState == null  ? false : medicationState.checkMorning),
                  onChanged: (bool value){
                    setState(() {
                      medicationState.checkMorning = value;
                      medicationState.saveData();
                    });
                  },
                )
            ),
          //(medicationState != null && medicationState.checkDay) ? SizedBox(): // Dieser Codeabschnitt kann eingefügt werden, wenn die Karten zur Medikation
          //nach Einnahme verschwieden sillen -> Aufgrund von vermutlichen Usability Problemen, da ältere menschen versehentlich auf den Knopf drücken können
          // und dann ihre medikation nicht mehr sehen und es so zu falschen Angaben beim Arzt kommen kann, wurde dieser Abschnitt hier auskommentiert
          Card(
            color:  (medicationState != null && medicationState.checkDay) ? Colors.grey[200] : Color(0xfff0fcfc),
              child:
              CheckboxListTile(
                title: Text("Mittags"),
                subtitle: getText(medDay),
                activeColor: Colors.lightGreen[500],
                value: (medicationState == null ? false : medicationState.checkDay),
                onChanged: (bool value){
                  setState(() {
                    medicationState.checkDay = value;
                    medicationState.saveData();
                  });
                },
              ),

          ),
          //(medicationState != null && medicationState.checkEvening) ? SizedBox(): // Dieser Codeabschnitt kann eingefügt werden, wenn die Karten zur Medikation
          //nach Einnahme verschwieden sillen -> Aufgrund von vermutlichen Usability Problemen, da ältere menschen versehentlich auf den Knopf drücken können
          // und dann ihre medikation nicht mehr sehen und es so zu falschen Angaben beim Arzt kommen kann, wurde dieser Abschnitt hier auskommentiert
          Card(
            color:  (medicationState != null && medicationState.checkEvening) ? Colors.grey[200] : Color(0xfff0fcfc),
            child:
            CheckboxListTile(
              title: Text("Abends"),
              subtitle: getText(medEvening),
              value: (medicationState == null ? false : medicationState.checkEvening),
              activeColor: Colors.lightGreen[500],
              onChanged: (bool value){
                setState(() {
                  medicationState.checkEvening = value;
                  medicationState.saveData();
                });
              },
            ),

          ),
          //(medicationState != null && medicationState.checkNight) ? SizedBox(): // Dieser Codeabschnitt kann eingefügt werden, wenn die Karten zur Medikation
          //nach Einnahme verschwieden sillen -> Aufgrund von vermutlichen Usability Problemen, da ältere menschen versehentlich auf den Knopf drücken können
          // und dann ihre medikation nicht mehr sehen und es so zu falschen Angaben beim Arzt kommen kann, wurde dieser Abschnitt hier auskommentiert
          Card(
            color:  (medicationState != null && medicationState.checkNight) ? Colors.grey[200] : Color(0xfff0fcfc),
            child:
            CheckboxListTile(
              title: Text("Nachts"),
              subtitle: getText(medNight),
              activeColor: Colors.lightGreen[500],
              value:(medicationState == null ? false : medicationState.checkNight),
              onChanged: (bool value){
                setState(() {
                  medicationState.checkNight = value;
                  medicationState.saveData();
                });
              },
            ),

          ),

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