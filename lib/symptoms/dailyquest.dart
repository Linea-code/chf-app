import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/symptoms/veraendert.dart';
import 'package:herzinsuffizienz/symptoms/symptoms.dart';
import 'package:herzinsuffizienz/symptoms/eingeschraenkt.dart';

class DailyQuest extends StatefulWidget {
  @override
  _DailyQuestState createState() => _DailyQuestState();
}

class _DailyQuestState extends State<DailyQuest> {
  int currentStep = 0;
  bool complete = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Symptomfragebogen"),
      ),
      body:Column(
          children: <Widget>[
            complete ? Expanded(
              child: Center(
                child: AlertDialog(
                  title: new Text('Vielen Dank!'),
                  content: new Text("Sie haben den täglichen Fragebogen abgeschlossen!"),
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
          Eingeschraenkt4(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt0(),),

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
            Eingeschraenkt4(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt0(),),

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
            Eingeschraenkt4(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt0(),),

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
            Eingeschraenkt4(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt0(),),

        ],

      ),
    ),
    Step(
      isActive: currentStep > 2,
      state: (currentStep > 2) ? StepState.complete : StepState.editing,
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
            Eingeschraenkt4(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt0(),),

        ],

      ),
    ),
    Step(
      isActive: currentStep > 2,
      state: (currentStep > 2) ? StepState.complete : StepState.editing,
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
            Eingeschraenkt4(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Eingeschraenkt0(),),

        ],

      ),
    ),

    Step(
      isActive: currentStep > 2,
      state: (currentStep > 2) ? StepState.complete : StepState.editing,
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
            Veraendert5(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Veraendert4(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Veraendert3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Veraendert2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Veraendert1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Veraendert0(),),

        ],

      ),
    ),


  ];
  return steps;
  }

  }



