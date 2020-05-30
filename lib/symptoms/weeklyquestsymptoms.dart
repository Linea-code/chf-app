import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/symptoms/anzahlen.dart';
import 'package:herzinsuffizienz/symptoms/behinderung.dart';
import 'package:herzinsuffizienz/symptoms/durchschnittanzahl.dart';
import 'package:herzinsuffizienz/symptoms/laestig.dart';
import 'package:herzinsuffizienz/symptoms/niedergeschlagen.dart';
import 'package:herzinsuffizienz/symptoms/ungluecklich.dart';
import 'package:herzinsuffizienz/symptoms/veraendert.dart';
import 'package:herzinsuffizienz/symptoms/symptoms.dart';
import 'package:herzinsuffizienz/symptoms/eingeschraenkt.dart';
import 'package:herzinsuffizienz/symptoms/versorgt.dart';
import 'package:herzinsuffizienz/symptoms/verstehen.dart';

class WeeklyQuestSymptoms extends StatefulWidget {
  @override
  _WeeklyQuestSymptomsState createState() => _WeeklyQuestSymptomsState();
}

class _WeeklyQuestSymptomsState extends State<WeeklyQuestSymptoms> {
  int currentStep = 0;
  bool complete = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Symptomfragebogen",
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
            Anzahlen4(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Anzahlen3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Anzahlen2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Anzahlen1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Anzahlen0(),),
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
            Laestig5(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig4(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig0(),),
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
            Durchschnitt5(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Durchschnitt4(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Durchschnitt3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Durchschnitt2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Durchschnitt1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Durchschnitt0(),),

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
            Laestig5(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig4(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig0(),),
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
            Durchschnitt5(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Durchschnitt4(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Durchschnitt3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Durchschnitt2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Durchschnitt1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Durchschnitt0(),),

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
            Laestig5(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig4(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Laestig0(),),
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
            Anzahlen4(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Anzahlen3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Anzahlen2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Anzahlen1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Anzahlen0(),),
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
            Versorgt4(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Versorgt3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Versorgt2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Versorgt1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Versorgt0(),),
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
            Verstehen4(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Verstehen3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Verstehen2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Verstehen1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Verstehen0(),),
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
            Behinderung5(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung4(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung0(),),
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
            Ungluecklich5(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Ungluecklich4(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Ungluecklich3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Ungluecklich2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Ungluecklich1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Ungluecklich0(),),
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
            Niedergeschlagen4(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Niedergeschlagen3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Niedergeschlagen2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Niedergeschlagen1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Niedergeschlagen0(),),
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
            Behinderung6(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung5(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung0(),),
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
            Behinderung6(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung5(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung0(),),
        ],

      ),
    ),
    Step(
      isActive: currentStep > 20,
      state: (currentStep > 20) ? StepState.complete : StepState.editing,
      title: Text('Familie und Freunde'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Wie sehr beeinträchtigt Sie Ihre Herzinsuffizienz dabei Freunde und Familie außerhalb der Wohung zu besuchen?"),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung6(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung5(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung0(),),
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
            Behinderung6(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung5(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung3(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung2(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung1(),),
          Container(
            width: MediaQuery.of(context).size.width,
            child:
            Behinderung0(),),
        ],

      ),
    ),


  ];
  return steps;
  }

  }



