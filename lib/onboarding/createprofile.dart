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
  SingingCharacter _gender;
  final formKey = GlobalKey<FormState>();
 final newprofile = NewProfile();
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
            TextFormField(
              decoration: InputDecoration(labelText: 'Vorname:'),
              validator: (input) =>
                  input.isEmpty ? 'Bitte geben Sie Ihren Vornamen ein' : null,
              onSaved: (input) =>  newprofile.vorname= input,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nachname:'),
              validator: (input) =>
                  input.isEmpty ? 'Bitte geben Sie Ihren Nachnamen ein' : null,
              onSaved: (input) => newprofile.nachname = input,
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
                Row(
                  children: <Widget>[
                    Radio(
                      value: SingingCharacter.male,
                      groupValue: _gender,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _gender = value;
                          newprofile.geschlecht="männlich";
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
                          newprofile.geschlecht="weiblich";
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
                          newprofile.geschlecht="divers";
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
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                minimumYear: 1900,
                maximumYear: 2020,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
                  newprofile.birthdate = newDateTime;
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
                  DropdownButton<String>(
                  value: newprofile.lebensumstaende,
                  icon: Icon(Icons.arrow_downward),
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Arial",
                    color: Colors.black54,
                  ),
                  onChanged: (String newValue){
                    setState(() {
                      newprofile.lebensumstaende = newValue;
                    });
                  },
                  items: <String>['mit Ehepartner','mit festem Partner','alleinstehend','verwitwet','geschieden'].map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>( value: value,
                      child: Text(value),);
                  }).toList(),
                ),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Anzahl bisheriger Krankenhausaufenthalte:'),
              validator: (input) => input.isEmpty
                  ? 'Bitte geben Sie die Anzahl Ihrer bisheringen Krankenhausaufenthalte ein!'
                  : null,
              onSaved: (input) => newprofile.krankenhausaufenthalte = int.parse(input),
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  labelText: 'Begleiterkrankungen/Komorbiditäten:'),
              validator: (input) => input.isEmpty
                  ? 'Bitte geben Sie Ihre Begleiterkrankungen ein!'
                  : null,
              onSaved: (input) => newprofile.begleiterkrankungen = input,
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

  void _weiter() {
    if (formKey.currentState.validate() &&
        (_gender != null) &&
        (newprofile.birthdate != DateTime.now())) {
      formKey.currentState.save();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(newprofile: newprofile,)));
    }
  }
}
