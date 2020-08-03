import 'dart:collection';
import 'package:herzinsuffizienz/home/home.dart';
import 'package:herzinsuffizienz/symptoms/AppBuilder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/onboarding/NewProfile.dart';
// Zweite Variante um das Profil anzulegen mittels Stepper
enum SingingCharacter { male, female, diverse }

class CreateProfile2 extends StatefulWidget {
  @override
  _CreateProfile2 createState() => _CreateProfile2();
}

class _CreateProfile2 extends State<CreateProfile2> {
  SingingCharacter _gender; //Variable für Geschlecht anlegen
  final formKey = GlobalKey<FormState>();
  final newProfile = new NewProfile(); // neues Profil anlegen
  int currentStep = 0;
  bool complete = false;


  @override
  Widget build(BuildContext context) {
    return AppBuilder(builder: (context) //verwenden des AppBuilders damit ein koninuierliches Updaten möglich ist
    {
      return new Scaffold(
        appBar: AppBar(
          title: Text("Steckbrief", style: Theme.of(context).textTheme.headline4,
          ),
        ),
        body: Column(
          key: formKey,
          children: <Widget>[
            complete ? Expanded(
              child: Center(
                child: AlertDialog(
                  title: new Text('Vielen Dank!'),
                  content: new Text("Sie haben Ihr Profil erstellt!"),
                  actions: <Widget>[
                    new FlatButton(
                        child: new Text('Schließen'),
                        onPressed: () {
                          if (formKey.currentState.validate() &&
                              (_gender != null) &&
                              (newProfile.birthdate != DateTime.now())) {
                            formKey.currentState.save();
                            newProfile.saveData();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                          }
                        }
                    ),
                  ],
                ),
              ),
            )
                : Expanded(
              child: Stepper(
                controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel} ){
                  return Row(
                    children: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 40),
                        color: Colors.lightGreen[400],
                        child: Text("Weiter"),
                        onPressed: onStepContinue
                      ),
                      SizedBox(width: 10,),
                      RaisedButton(
                        padding: EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 40),
                        color: Colors.grey[100],
                        child: Text("Zurück"),
                        onPressed: onStepCancel,
                      )
                    ],
                  );
                },
                type: StepperType.vertical,
                steps: _mySteps(),
                currentStep: this.currentStep,
                onStepContinue: () {
                  setState(() {
                    if ((this.currentStep < this
                        ._mySteps()
                        .length - 1) && (formKey.currentState.validate())) {
                      formKey.currentState.save();
                      this.currentStep = this.currentStep + 1;
                    } else {
                      complete = true;
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (this.currentStep > 0) {
                      this.currentStep = this.currentStep - 1;
                    } else {
                      this.currentStep = 0;
                    }
                  });
                },
                onStepTapped: (step) {
                  setState(() {
                    this.currentStep = step;
                  });
                },

              ),

            )
          ],
        ),
      );
    });

  }
  List<Step> _mySteps(){
    List<Step> steps = [
      Step(
        title: Text("Name"),
        isActive: true,
        state: StepState.complete,
        content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
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
    ),]
      ),
      ),
      Step(
        title: Text("Geschlecht"),
        content:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column( //Auswahlfelder für Geschlecht
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
                )
              ],
            )
          ],
        ),
      ),
      Step(
        title: Text("Geburtsdatum"),
        content:
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
      ),
      Step(
        title: Text("Lebensumstände"),
        content:
        DropdownButton<String>( //Dropdown Menu um Lebensumstände auszuwählen
          value: newProfile.livingConditions,
          icon: Icon(Icons.arrow_downward),
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
      ),
      Step(
        title: Text("Krankenhaus- \nAufenthalte"),
        content:
        TextFormField( //Eingabefeld für bisherige Krankenhaus aufenthalte
          decoration: InputDecoration(
              labelText: 'Anzahl bisheriger Krankenhausaufenthalte:'),
          validator: (input) => input.isEmpty
              ? 'Bitte geben Sie die Anzahl Ihrer bisheringen Krankenhausaufenthalte ein!'
              : null,
          onSaved: (input) => newProfile.hospitalization = int.parse(input),
        ),
      ),
      Step(
        title: Text("Erkrankungen"),
        content:
        TextFormField( //Eingabefeld für Begleiterkrankungen
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
              labelText: 'Begleiterkrankungen'),
          validator: (input) => input.isEmpty
              ? 'Bitte geben Sie Ihre Begleiterkrankungen ein!'
              : null,
          onSaved: (input) => newProfile.comorbidities = input,
        ),
      )

    ];
    return steps;
  }

}



