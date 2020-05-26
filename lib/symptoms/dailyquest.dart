import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:herzinsuffizienz/symptoms/abgeschlagenheit.dart';
import 'package:herzinsuffizienz/symptoms/kurzatmigkeit.dart';
import 'package:herzinsuffizienz/symptoms/wassereinlagerung.dart';

class DailyQuest extends StatefulWidget {
  @override
  _DailyQuestState createState() => _DailyQuestState();
}

class _DailyQuestState extends State<DailyQuest> {
  List<Step> steps = [
    Step(
    title: Text("Wassereinlagerungen"),
    isActive: true,
    state: StepState.complete,
    content: Column(
      children: <Widget>[
        Container(
          child: Text("Hatten Sie am heutigen Tag Wassereinlagerung (beispielsweise in den Beinen/Füßen)?"),
        ),
        SizedBox(height: 20),
        Wassereinlagerung0(),
        Wassereinlagerung1(),
        Wassereinlagerung2(),
      ],

    ),
  ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: Text('Kurzatmigkeit'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Hatten Sie am heutigen Tag Probleme mit Kurzatmigkeit?"),
          ),
          SizedBox(height: 20),
          Kurzatmigkeit0(),
          Kurzatmigkeit1(),
          Kurzatmigkeit2(),
        ],

      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: Text('Abgeschlagenheit'),
      content: Column(
        children: <Widget>[
          Container(
            child: Text("Fühlten Sie sich am heutigen Tag abgeschlagen?"),
          ),
          SizedBox(height: 20),
          Abgeschlagenheit0(),
          Abgeschlagenheit1(),
          Abgeschlagenheit2(),
        ],

      ),
    ),];

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
                    }
                    )  ,
                  ],
                ),
              ),
            )
            :Expanded(
              child: Stepper(
                type: StepperType.vertical,
                steps: steps,
                currentStep: currentStep,
                onStepContinue: next,
                onStepCancel: cancel,
                onStepTapped: (step)=> goTo(step),

              ),

            )
          ],
      ),
    );

    }
  next() {
    currentStep + 1 != steps.length ? goTo(currentStep + 1) : setState(() =>
    complete = true,
    );
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step){
    setState(() {
      currentStep = step;
    });
  }

}

