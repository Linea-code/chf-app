import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Anlage der eigenen Klasse um Medikations angaben zu speichern mit Deklaration der Variablen:
class SaveMedications {
  bool checkMorning = false;
  bool checkDay = false;
  bool checkEvening = false;
  bool checkNight = false;
  int lastDate;
  String feeling;

  void saveData () async{
    final prefs = await SharedPreferences.getInstance();
    lastDate = DateTime.now().millisecondsSinceEpoch;
    prefs.setBool("checkMorning", checkMorning);
    prefs.setBool("checkDay", checkDay);
    prefs.setBool("checkEvening", checkEvening);
    prefs.setBool("checkNight", checkNight);
    prefs.setInt('lastDate', lastDate);
    prefs.setString("feeling", feeling);
  }

  static Future<SaveMedications> loadData () async {
    final prefs = await SharedPreferences.getInstance();
    var data = new SaveMedications();
    if (prefs.containsKey('checkMorning')
        && prefs.containsKey('checkDay')
        && prefs.containsKey('checkEvening')
        && prefs.containsKey('checkNight')
        && prefs.containsKey('lastDate')) {
      data.lastDate = prefs.getInt('lastDate');
      if (DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(data.lastDate)).inDays == 0) {
        data.checkMorning = prefs.getBool('checkMorning');
        data.checkDay = prefs.getBool('checkDay');
        data.checkEvening = prefs.getBool('checkEvening');
        data.checkNight = prefs.getBool('checkNight');
        data.feeling = prefs.getString("feeling");
      } else {
        data.checkMorning = false;
        data.checkDay = false;
        data.checkEvening = false;
        data.checkNight = false;
        data.feeling = null;
      }
    }
    return data;
  }
}