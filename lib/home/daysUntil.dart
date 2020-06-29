import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DaysUntil extends StatefulWidget {
  @override
  _DaysUntilState createState() => _DaysUntilState();
}

class _DaysUntilState extends State<DaysUntil> {
  DateTime nextSurvey = DateTime(2020,7,3);

 int getDate (nextSurvey){
    if(DateTime.now().toUtc().millisecondsSinceEpoch <= nextSurvey.toUtc().millisecondsSinceEpoch) {
      return nextSurvey
          .difference(DateTime.now())
          .inDays + 1;
    }
    else {
      return getDate(nextSurvey.add(new Duration(days:14)));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Text ("Nächster Fragebogen fällig in: " +  getDate(nextSurvey).toString() + ((getDate(nextSurvey) <= 1) ? " Tag." : " Tagen."));
  }
}
