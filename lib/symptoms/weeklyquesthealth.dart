import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/symptoms/erschweren.dart';
import 'package:herzinsuffizienz/symptoms/healthaswers.dart';
import 'package:herzinsuffizienz/symptoms/symptoms.dart';


class WeeklyQuestHealth extends StatefulWidget {
  @override
  _WeeklyQuestHealthState createState() => _WeeklyQuestHealthState();
}

class _WeeklyQuestHealthState extends State<WeeklyQuestHealth> {
  int currentStep = 0;
  bool complete = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Gesundheitsfragebogen",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w800,),
        ),
        backgroundColor:  Colors.lightGreen[500],
      ),
      body:Column(
        children: <Widget>[
          complete ? Expanded(
            child: Center(
              child: AlertDialog(
                title: new Text('Vielen Dank!'),
                content: new Text("Sie haben den Fragebogen abgeschlossen!"),
                actions: <Widget>[
                  new FlatButton(
                      child: new Text('Schließen'),
                      onPressed: (){
                        setState(() {
                          complete = false;
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> Symptoms()));
                      }
                  )  ,
                ],
              ),
            ),
          )
              :Expanded(
            child: Stepper(
              type: StepperType.vertical,
              steps: _mySteps(),
              currentStep: this.currentStep,
              onStepContinue: (){
                setState(() {
                  if(this.currentStep < this._mySteps().length -1){
                    this.currentStep = this.currentStep +1;
                  } else{
                    complete = true;
                  }
                });
              },
              onStepCancel: (){
                setState(() {
                  if(this.currentStep > 0){
                    this.currentStep = this.currentStep -1;
                  } else{
                    this.currentStep = 0;
                  }
                });
              },
              onStepTapped: (step){
                setState(() {
                  this.currentStep = step;
                });
              },

            ),

          )
        ],
      ),
    );

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
              Health0(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health1(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health2(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health3(),),
          ],
        ),
      ),
      Step(
        title: Text("Niedergeschlagenheit"),
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
              Health0(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health1(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health2(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health3(),),
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
              Health0(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health1(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health2(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health3(),),
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
              Health0(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health1(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health2(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health3(),),
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
              Health0(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health1(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health2(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health3(),),
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
              Health0(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health1(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health2(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health3(),),
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
              Health0(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health1(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health2(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health3(),),
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
              Health0(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health1(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health2(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health3(),),
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
              Health0(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health1(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health2(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Health3(),),
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
              Erschweren0(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Erschweren1(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Erschweren2(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Erschweren3(),),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
              Erschweren4(),),
          ],
        ),
      ),



    ];
    return steps;
  }

}



