import 'dart:collection';
import 'package:herzinsuffizienz/symptoms/AppBuilder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/symptoms/surveyButton.dart';
import 'package:herzinsuffizienz/symptoms/symptoms.dart';

//2Wöchentlicher Fragebogen zum Ausfüllen der Gesundheit/Depressionsfragebogen
//Umsetzung mittels Steppers
//Pro Antwortauswahl wird ein SurveyButton (siehe eigene Klasse) gebildet und ein spezifischer Text übergeben
//Mittels AppBuilder und callback wird die Seite konstant geupdated und somit ist auch ein "umentscheiden" bzw. erneutes anklicken möglich sowie ein vor und zurück gehen

class WeeklyQuestHealth extends StatefulWidget {
  @override
  _WeeklyQuestHealthState createState() => _WeeklyQuestHealthState();
}

class _WeeklyQuestHealthState extends State<WeeklyQuestHealth> {
  int currentStep = 0;
  bool complete = false;
  String text;

  HashMap healthvalues = new HashMap<int,String>(); // HashMap zum Speichern der Werte

  callback(String text,int currentStep) {
    healthvalues[currentStep] = text;//Antwort auf Frage speichern
  }

  @override
  Widget build(BuildContext context) {
    return AppBuilder(builder: (context) //verwenden des AppBuilders damit ein koninuierliches Updaten möglich ist
    {
      return new Scaffold(
        appBar: AppBar(
          title: Text("Gesundheitsfragebogen", style: Theme.of(context).textTheme.headline4,
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
        title: Text("Tätigkeiten"),
        isActive: true,
        state: StepState.complete,
        content: Column(
          children: <Widget>[
            Container(
              child: Text("In wie weit fühlten Sie sich in den letzten 2 Wochen durch wenig Interesse oder Freude an Ihren Tätigkeiten beeintächtigt?"),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              SurveyButton(text: "\u{1F642} überhaupt nicht",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep,)),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              SurveyButton(text: "\u{1F610} an einzelnen Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              SurveyButton(text: "\u{1F641} an mehr als der Hälfte der Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              SurveyButton(text: "\u{2639} beinahe jeden Tag",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
          ],
        ),
      ),
      Step(
        title: Text("Schwermut"),
        isActive: currentStep > 0,
        state: (currentStep > 0) ? StepState.complete : StepState.editing,
        content: Column(
          children: <Widget>[
            Container(
              child: Text("In wie weit fühlten Sie sich in den letzten 2 Wochen durch Niedergeschlagenheit, Schwermut oder Hoffnungslosigkeit beeintächtigt?"),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              SurveyButton(text: "\u{1F642} überhaupt nicht",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F610} an einzelnen Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F641} an mehr als der Hälfte der Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{2639} beinahe jeden Tag",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
          ],
        ),
      ),
      Step(
        title: Text("Schlaf"),
        isActive: currentStep > 1,
        state: (currentStep > 1) ? StepState.complete : StepState.editing,
        content: Column(
          children: <Widget>[
            Container(
              child: Text("In wie weit fühlten Sie sich in den letzten 2 Wochen durch Schwierigkeiten beim ein- oder durschschlafen oder verminderten Schlaf beeintächtigt?"),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              SurveyButton(text: "\u{1F642} überhaupt nicht",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F610} an einzelnen Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F641} an mehr als der Hälfte der Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{2639} beinahe jeden Tag",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
          ],
        ),
      ),
      Step(
        title: Text("Müdigkeit"),
        isActive: currentStep > 2,
        state: (currentStep > 2) ? StepState.complete : StepState.editing,
        content: Column(
          children: <Widget>[
            Container(
              child: Text("In wie weit fühlten Sie sich in den letzten 2 Wochen durch Müdigkeit oder das Gefühl, keine Energie zuhaben, beeintächtigt?"),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              SurveyButton(text: "\u{1F642} überhaupt nicht",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F610} an einzelnen Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F641} an mehr als der Hälfte der Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{2639} beinahe jeden Tag",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
          ],
        ),
      ),
      Step(
        title: Text("Appetit"),
        isActive: currentStep > 3,
        state: (currentStep > 3) ? StepState.complete : StepState.editing,
        content: Column(
          children: <Widget>[
            Container(
              child: Text("In wie weit fühlten Sie sich in den letzten 2 Wochen durch verminderten Appetit oder das übermäßige Bedürfnis zu essen beeintächtigt?"),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              SurveyButton(text: "\u{1F642} überhaupt nicht",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F610} an einzelnen Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F641} an mehr als der Hälfte der Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{2639} beinahe jeden Tag",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
          ],
        ),
      ),
      Step(
        title: Text("Ungutes Gefühl"),
        isActive: currentStep > 4,
        state: (currentStep > 4) ? StepState.complete : StepState.editing,
        content: Column(
          children: <Widget>[
            Container(
              child: Text("In wie weit fühlten Sie sich in den letzten 2 Wochen durch eine schlechte Meinung von sich selbst/ das Gefühl ein Versager zu ein oder die Familie enttäuscht zu haben beeintächtigt?"),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              SurveyButton(text: "\u{1F642} überhaupt nicht",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F610} an einzelnen Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F641} an mehr als der Hälfte der Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{2639} beinahe jeden Tag",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
          ],
        ),
      ),
      Step(
        title: Text("Konzentration"),
        isActive: currentStep > 5,
        state: (currentStep > 5) ? StepState.complete : StepState.editing,
        content: Column(
          children: <Widget>[
            Container(
              child: Text("In wie weit fühlten Sie sich in den letzten 2 Wochen durch Schwierigkeiten sich auf etwas zu konzentrieren (z.B. Zeitung lesen/ Fernsehen) beeintächtigt?"),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              SurveyButton(text: "\u{1F642} überhaupt nicht",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F610} an einzelnen Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F641} an mehr als der Hälfte der Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{2639} beinahe jeden Tag",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
          ],
        ),
      ),
      Step(
        title: Text("Bewegungen"),
        isActive: currentStep > 6,
        state: (currentStep > 6) ? StepState.complete : StepState.editing,
        content: Column(
          children: <Widget>[
            Container(
              child: Text("Waren Ihre Bewegungen oder Ihre Sprache so verlangsamt, dass es auch anderen auffallen würde? Oder waren Sie im Gegenteil zappelig oder ruhelos und hatten eine stärkeren Bewegungsdrang als sonst?"),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              SurveyButton(text: "\u{1F642} überhaupt nicht",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F610} an einzelnen Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F641} an mehr als der Hälfte der Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{2639} beinahe jeden Tag",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
          ],
        ),
      ),
      Step(
        title: Text("Gedanken"),
        isActive: currentStep > 7,
        state: (currentStep > 7) ? StepState.complete : StepState.editing,
        content: Column(
          children: <Widget>[
            Container(
              child: Text("In wie weit fühlten Sie sich in den letzten 2 Wochen durch Gedanken, dass Sie lieber tot wären oder sich Leid zufügen möchten beeintächtigt?"),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              SurveyButton(text: "\u{1F642} überhaupt nicht",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F610} an einzelnen Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F641} an mehr als der Hälfte der Tagen",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{2639} beinahe jeden Tag",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
          ],
        ),
      ),
      Step(
        title: Text("Beeintächtigung"),
        isActive: currentStep > 8,
        state: (currentStep > 8) ? StepState.complete : StepState.editing,
        content: Column(
          children: <Widget>[
            Container(
              child: Text("Geben Sie bitte an, wie sehr diese Probleme es Ihnen erschwert haben, Ihre Arbeit zu erledigen, Ihren Haushalt zu regeln, oder mit anderen Menschen zurecht zu kommen."),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              SurveyButton(text: "\u{1F603} ich hatte keines der angegebenen Probleme",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F642} überhaupt nicht erschwert",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F610} etwas erschwert",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{1F641} relativ stark erschwert",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
            Container(
                width: MediaQuery.of(context).size.width,
                child:
                SurveyButton(text: "\u{2639} sehr stark erschwert",callback: callback,currentValue: healthvalues[currentStep],currentStep: currentStep)),
          ],
        ),
      ),

    ];
    return steps;
  }

}



