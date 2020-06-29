import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/home/home.dart';
import 'package:herzinsuffizienz/onboarding/newprofile.dart';

enum SingingCharacter { male, female, diverse }

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {

  SingingCharacter _gender; //Variable für Geschlecht anlegen
  final formKey = GlobalKey<FormState>();
  final newProfile = new NewProfile(); // neues Profil anlegen

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Steckbrief',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
            fontFamily: "Arial",
          ),
        ),
        backgroundColor: Colors.lightGreen[500],
      ),
      body: ListView(padding: const EdgeInsets.all(8), children: <Widget>[
        Form(
          key: formKey,
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            TextFormField( //Feld zum Namen eintragen
              decoration: InputDecoration(labelText: 'Vorname:'),
              validator: (input) =>
                  input.isEmpty ? 'Bitte geben Sie Ihren Vornamen ein' : null,
              onSaved: (input) =>  newProfile.firstName= input, //Speichern in Profil
            ),
            TextFormField( //Feld zum Nachnamen eintragen
              decoration: InputDecoration(labelText: 'Nachname:'),
              validator: (input) =>
                  input.isEmpty ? 'Bitte geben Sie Ihren Nachnamen ein' : null,
              onSaved: (input) => newProfile.secondName = input, //Speichern in Profil
            ),
            SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Geschlecht:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Arial",
                    color: Colors.black54,
                  ),
                ),
                Row( //Auswahlfelder für Geschlecht
                  children: <Widget>[
                    Radio(
                      value: SingingCharacter.male,
                      groupValue: _gender,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _gender = value;
                          newProfile.gender="männlich"; //Speichern in Profil
                        });
                      },
                    ),
                    Text(
                      'männlich',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Arial",
                        color: Colors.black54,
                      ),
                    ),
                    Radio(
                      value: SingingCharacter.female,
                      groupValue: _gender,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _gender = value;
                          newProfile.gender="weiblich"; //Speichern in Profil
                        });
                      },
                    ),
                    Text(
                      'weiblich',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Arial",
                        color: Colors.black54,
                      ),
                    ),
                    Radio(
                      value: SingingCharacter.diverse,
                      groupValue: _gender,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _gender = value;
                          newProfile.gender="divers"; //Speichern in Profil
                        });
                      },
                    ),
                    Text(
                      'divers',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Arial",
                        color: Colors.black54,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Bitte wählen Sie Ihr Geburtsdatum aus:",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Arial",
                    color: Colors.black54,
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Container(
              height: 75,
              child: CupertinoDatePicker( //Datumswähler beginnend bei Jahr von heute - 120nd endend bei Jahr von heute
                mode: CupertinoDatePickerMode.date,
                minimumYear: DateTime.now().year - 120,
                maximumYear: DateTime.now().year,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
                  newProfile.birthdate = newDateTime; //Speichern in Profil
                },
              ),
            ),
            Row(
              children: <Widget>[
                Text ("Lebensumstände:    ",
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Arial",
                    color: Colors.black54,
                ),),
                  DropdownButton<String>( //Dropdown Menu um Lebensumstände auszuwählen
                  value: newProfile.livingConditions,
                  icon: Icon(Icons.arrow_downward),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Arial",
                    color: Colors.black54,
                  ),
                  onChanged: (String newValue){
                    setState(() {
                      newProfile.livingConditions = newValue;
                    });
                  },
                  items: <String>['mit Ehepartner','mit festem Partner','alleinstehend','verwitwet','geschieden'].map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>( value: value,
                      child: Text(value),);
                  }).toList(),
                ),
              ],
            ),
            TextFormField( //Eingabefeld für bisherige Krankenhaus aufenthalte
              decoration: InputDecoration(
                  labelText: 'Anzahl bisheriger Krankenhausaufenthalte:'),
              validator: (input) => input.isEmpty
                  ? 'Bitte geben Sie die Anzahl Ihrer bisheringen Krankenhausaufenthalte ein!'
                  : null,
              onSaved: (input) => newProfile.hospitalization = int.parse(input),
            ),
            TextFormField( //Eingabefeld für Begleiterkrankungen
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  labelText: 'Begleiterkrankungen/Komorbiditäten:'),
              validator: (input) => input.isEmpty
                  ? 'Bitte geben Sie Ihre Begleiterkrankungen ein!'
                  : null,
              onSaved: (input) => newProfile.comorbidities = input,
            ),
            Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: _weiter,
                      child: Text('Weiter'),
                    ),
                  ),
                ],
              ),
            ]),
          ]),
        )
      ]),
    );
  }
//Definition der eigenen Methode "weiter" -> wenn alle Werte ihre Voraussetzungen erfüllen kann zur nächsten Seite (Home) fortgefahren werden
  void _weiter() {
    if (formKey.currentState.validate() &&
        (_gender != null) &&
        (newProfile.birthdate != DateTime.now())) {
      formKey.currentState.save();
      newProfile.saveData();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }
}
