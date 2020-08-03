import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/symptoms/symptoms.dart';
import 'SurveyButton.dart';
import 'package:herzinsuffizienz/symptoms/AppBuilder.dart';

//2-Wöchentlicher Fragebogen zum Ausfüllen der Symptome
//Umsetzung mittels Steppers
//Pro Antwortauswahl wird ein SurveyButton (siehe eigene Klasse) gebildet und ein spezifischer Text übergeben
//Mittels AppBuilder und callback wird die Seite konstant geupdated und somit ist auch ein "umentscheiden" bzw. erneutes anklicken möglich sowie ein vor und zurück gehen

class WeeklyQuestSymptoms extends StatefulWidget {
  @override
  _WeeklyQuestSymptomsState createState() => _WeeklyQuestSymptomsState();
}

class _WeeklyQuestSymptomsState extends State<WeeklyQuestSymptoms> {
  int currentStep = 0;
  bool complete = false;
//Verwenden einer HashMap zum Speichern der ausgewählten Optionen
  HashMap values =  new HashMap<int,String>();

  callback(String text,int currentStep) {
    values[currentStep] = text;//Antwort auf Frage speichern
  }

  @override
  Widget build(BuildContext context) {
    return AppBuilder(builder: (context)
    {
      return new Scaffold(
        appBar: AppBar(
          title: Text("Symptomfragebogen", style: Theme.of(context).textTheme.headline4,
          ),
        ),
        body: Column(
          children: <Widget>[
            complete ? Expanded(
              child: Center(
                child: AlertDialog(
                  title: new Text('Vielen Dank!'),
                  content: new Text("Sie haben den Fragebogen abgeschlossen!"),
                  actions: <Widget>[
                    new FlatButton(
                        child: new Text('Schließen'),
                        onPressed: () {
                          setState(() {
                            complete = false;
                          });
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  Symptoms()));
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
                        onPressed: onStepContinue,
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
                    if (this.currentStep < this
                        ._mySteps()
                        .length - 1) {
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
      title: Text("Ankleiden"),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          Container(
            child: Text("In wie weit fühlten Sie sich in den letzten 2 Wochen beim selbst Ankleiden eingeschränkt?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} extrem eingeschränkt',callback: callback,currentValue: values[currentStep],currentStep: currentStep,),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} sehr eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),), //TODO: hashMap.get(Frage1)
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} mäßig eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} etwas eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} gar nicht eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),

        ],

      ),
    ),
    Step(
      isActive: currentStep > 0,
      state: (currentStep > 0) ? StepState.complete : StepState.editing,
      title: Text('Hygiene'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("In wie weit fühlten Sie sich in den letzten 2 Wochen beim selbst Duschen oder Baden eingeschränkt?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} extrem eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep,),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} sehr eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} mäßig eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} etwas eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} gar nicht eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),

        ],

      ),
    ),
    Step(
      isActive: currentStep > 1,
      state: (currentStep > 1) ? StepState.complete : StepState.editing,
      title: Text('Spazieren'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("In wie weit fühlten Sie sich in den letzten 2 Wochen beim Spazieren auf ebener Straße (um den eigenen Block) eingeschränkt?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} extrem eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} sehr eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} mäßig eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} etwas eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} gar nicht eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),

        ],

      ),
    ),
    Step(
      isActive: currentStep > 2,
      state: (currentStep > 2) ? StepState.complete : StepState.editing,
      title: Text('Tägliche Arbeit'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("In wie weit fühlten Sie sich in den letzten 2 Wochen beim Ausführen täglicher Arbeiten wie Hausarbeit, Einkäufe tragen oder bei Gartenarbeiten eingeschränkt?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} extrem eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} sehr eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} mäßig eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} etwas eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} gar nicht eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),

        ],

      ),
    ),
    Step(
      isActive: currentStep > 3,
      state: (currentStep > 3) ? StepState.complete : StepState.editing,
      title: Text('Treppen steigen'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("In wie weit fühlten Sie sich in den letzten 2 Wochen beim Steigen von Treppen (ohne anzuhalten) eingeschränkt?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} extrem eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} sehr eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} mäßig eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} etwas eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} gar nicht eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),

        ],

      ),
    ),
    Step(
      isActive: currentStep > 4,
      state: (currentStep > 4) ? StepState.complete : StepState.editing,
      title: Text('Schnelles Gehen'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("In wie weit fühlten Sie sich in den letzten 2 Wochen beim schnellen Gehen oder Joggen (z.B. um den Bus zu erreichen) eingeschränkt?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} extrem eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} sehr eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} mäßig eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} etwas eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} gar nicht eingeschränkt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),


        ],

      ),
    ),

    Step(
      isActive: currentStep > 5,
      state: (currentStep > 5) ? StepState.complete : StepState.editing,
      title: Text('Symptome'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("In wie weit haben sich Ihre Symptome wie Atemnot, Müdigkeit und Schwellungen der Knöchel in der letzten Woche verändert?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} sehr viel schlimmer', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} etwas schlimmer', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} unverändert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} etwas besser', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F60A} sehr viel besser', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} beschwerdefrei seit 1 Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),

        ],

      ),
    ),

    Step(
      isActive: currentStep > 6,
      state: (currentStep > 6) ? StepState.complete : StepState.editing,
      title: Text('Schwellungen - 1'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Wie oft hatten Sie in der vergangenen Woche am Morgen, wenn Sie aufgestanden sind, Schwellungen Ihrer Knöchel, Füße oder Unterschenkel?"),
  ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} jeden Tag', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} 3 oder mehrfach pro Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} 1-2 mal pro Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} weniger als 1 mal pro Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} nie in der Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
        ],

      ),
    ),
    Step(
      isActive: currentStep > 7,
      state: (currentStep > 7) ? StepState.complete : StepState.editing,
      title: Text('Schwellungen - 2'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Wie heftig sind in der vergangenen Woche Ihre Füße, Gelenke und Unterschenkel geschwollen und haben Sie belästig? Es war: "),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} extrem lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} ziemlich lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} etwas lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} wenig lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F60A} nicht lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} ich hatte keine', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
        ],

      ),
    ),
    Step(
      isActive: currentStep > 8,
      state: (currentStep > 8) ? StepState.complete : StepState.editing,
      title: Text('Schlappheit - 1'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Wie oft haben Sie durchschnittlich Schlappheit und Müdigkeit daran gehindert es zu tun, was Sie tun wollten? "),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} die ganze Zeit', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} einige Male am Tag', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} mindestens 1 mal pro Tag', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} 3 mal oder weniger pro Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F60A} 1-2 mal pro Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} nie in der Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),

        ],

      ),
    ),
    Step(
      isActive: currentStep > 9,
      state: (currentStep > 9) ? StepState.complete : StepState.editing,
      title: Text('Müdigkeit - 2'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Verglichen mit der vergangenen Woche, wie heftig hat Müdigkeit und Schlappheit behindert? Es war: "),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} extrem lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} ziemlich lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} etwas lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} wenig lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F60A} nicht lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} ich hatte keine', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
        ],

      ),
    ),
    Step(
      isActive: currentStep > 10,
      state: (currentStep > 10) ? StepState.complete : StepState.editing,
      title: Text('Atemnot - 1'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Verglichen mit vergangener Woche, wie oft hat Sie durchschnittlich Atemnot daran gehindert es zu tun, was Sie tun wollten? "),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} die ganze Zeit', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} einige Male am Tag', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} mindestens 1 mal pro Tag', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} 3 mal oder weniger pro Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F60A} 1-2 mal pro Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} nie in der Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),

        ],

      ),
    ),
    Step(
      isActive: currentStep > 11,
      state: (currentStep > 11) ? StepState.complete : StepState.editing,
      title: Text('Atemnot - 2'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Verglichen mit der vergangenen Woche, wie heftig Atemnot Sie belästigt? Es war: "),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
              child:
              SurveyButton(text: '\u{2639} extrem lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} ziemlich lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} etwas lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} wenig lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F60A} nicht lästig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} ich hatte keine', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
        ],

      ),
    ),
    Step(
      isActive: currentStep > 12,
      state: (currentStep > 12) ? StepState.complete : StepState.editing,
      title: Text('Atemnot - 3'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Wie oft mussten Sie sich nachts aufsetzen oder mehrere Kissen im Rücken verwenden, weil sie Luftnot hatten??"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} jeden Tag', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} 3 oder mehrfach pro Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} 1-2 mal pro Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} weniger als 1 mal pro Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} nie in der Woche', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
        ],

      ),
    ),
    Step(
      isActive: currentStep > 13,
      state: (currentStep > 13) ? StepState.complete : StepState.editing,
      title: Text('Versorgung'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Wissen Sie, was Sie tun können, wenn Sie merken, dass sich Ihre Herzinsuffizienz verschlechtert?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} ich habe überhaupt keine Ahnung', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} ich habe wenig Ahnung', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} ich bin ein wenig versorgt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} ich bin gut versorgt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} ich bin komplett und gut versorgt', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
        ],

      ),
    ),

    Step(
      isActive: currentStep > 14,
      state: (currentStep > 14) ? StepState.complete : StepState.editing,
      title: Text('Verständnis'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Wie gut sind Sie darüber informiert, was Sie tun können um eine Verschlimmerung der Herzinsuffizienz zu vermeiden?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} ich verstehe gar nichts', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} ich verstehe nur wenig', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} ich verstehe etwas', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} ich verstehe fast alles', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} ich bin komplett informiert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
        ],

      ),
    ),
    Step(
      isActive: currentStep > 15,
      state: (currentStep > 15) ? StepState.complete : StepState.editing,
      title: Text('Hindernis'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Verglichen mit der vergangenen Woche, wie sehr hat Sie ihre Herzinsuffizienz daran gehindert, Ihr Leben zu genießen?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} es hat mich extrem behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} es hat mich ziemlich behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} es hat mich etwas behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} es hat mich wenig behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F60A} es hat mich kaum behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} es hat mich gar nicht behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
        ],

      ),
    ),
    Step(
      isActive: currentStep > 16,
      state: (currentStep > 16) ? StepState.complete : StepState.editing,
      title: Text('Befinden - 1'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Wenn Sie genau wissen, dsss die Herzinsuffizienz Sie ihr Leben lang begleiten wird, wie fühlen Sie sich bei diesem Gedanken?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} sehr unglücklich', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} ziemlich unglücklich', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} etwas unglücklich', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} wenig unglücklich', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F60A} kaum unglücklich', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} gar nicht unglücklich', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
        ],

      ),
    ),
    Step(
      isActive: currentStep > 17,
      state: (currentStep > 17) ? StepState.complete : StepState.editing,
      title: Text('Befinden - 2'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Verglichen mit der vergangenen Woche, wie häufig fühlten Sie sich wegen Ihrer Herzinsuffizienz entmudtigt oder niedergeschlagen?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} immer', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} oft', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} gelegentlich', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} selten', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} nie', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
        ],

      ),
    ),
    Step(
      isActive: currentStep > 18,
      state: (currentStep > 18) ? StepState.complete : StepState.editing,
      title: Text('Hobbys'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Wie sehr beeinträchtigt Sie Ihre Herzinsuffizienz bei Hobbys und Entspannungsaktivitäten?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: 'nicht zutreffend', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} es hat mich extrem behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} es hat mich etwas behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} es hat mich wenig behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} es hat mich kaum behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} es hat mich gar nicht behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
        ],

      ),
    ),
    Step(
      isActive: currentStep > 19,
      state: (currentStep > 19) ? StepState.complete : StepState.editing,
      title: Text('Arbeiten'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Wie sehr beeinträchtigt Sie Ihre Herzinsuffizienz beim Arbeiten oder Haushalt versorgen?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: 'nicht zutreffend', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} es hat mich extrem behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} es hat mich etwas behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} es hat mich wenig behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} es hat mich kaum behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} es hat mich gar nicht behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
        ],

      ),
    ),
    Step(
      isActive: currentStep > 20,
      state: (currentStep > 20) ? StepState.complete : StepState.editing,
      title: Text('Familie/Freunde'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Wie sehr beeinträchtigt Sie Ihre Herzinsuffizienz dabei Freunde und Familie außerhalb der Wohung zu besuchen?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: 'nicht zutreffend', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} es hat mich extrem behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} es hat mich etwas behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} es hat mich wenig behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} es hat mich kaum behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} es hat mich gar nicht behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
        ],

      ),
    ),
    Step(
      isActive: currentStep > 21,
      state: (currentStep > 21) ? StepState.complete : StepState.editing,
      title: Text('Sexuelle Aktivität'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Wie sehr beeinträchtigt Sie Ihre Herzinsuffizienz bei sexuellen Aktivitäten?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: 'nicht zutreffend', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{2639} es hat mich extrem behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F641} es hat mich etwas behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F610} es hat mich wenig behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F642} es hat mich kaum behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            SurveyButton(text: '\u{1F603} es hat mich gar nicht behindert', callback: callback, currentValue: values[currentStep],currentStep: currentStep),),
        ],

      ),
    ),


  ];
  return steps;
  }

  }



