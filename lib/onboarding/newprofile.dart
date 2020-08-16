import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Anlage der eigenen Klasse Profil mit Deklaration der Variablen: Vorname, Nachname, Begleiterkrankungen, Lebensumstände, Geburtsdatum, Krankenhausaufenthalte, Geschlecht
class NewProfile {
  String firstName;
  String secondName;
  String comorbidities;
  String livingConditions = "mit Ehepartner";
  DateTime birthdate;
  int hospitalization;
  String gender;

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("firstName", firstName);
    prefs.setString("secondName", secondName);
    prefs.setString("comorbidities", comorbidities);
    prefs.setString("livingConditions", livingConditions);
    prefs.setInt("hospitalization", hospitalization);
    prefs.setInt("birthdate", birthdate.millisecondsSinceEpoch);
    prefs.setString('gender', gender);
  }

  static Future<NewProfile> loadData() async { //Asynchrones laden der Daten
    final prefs = await SharedPreferences.getInstance();

    var data = new NewProfile();
    if (prefs.containsKey('firstName') &&
        prefs.containsKey('secondName') &&
        prefs.containsKey('comorbidities') &&
        prefs.containsKey('livingConditions') &&
        prefs.containsKey('hospitalization') &&
        prefs.containsKey('birthdate') &&
        prefs.containsKey('gender')) {
      data.firstName = prefs.getString('firstName');
      data.secondName = prefs.getString('secondName');
      data.comorbidities = prefs.getString('comorbidities');
      data.livingConditions = prefs.getString('livingConditions');
      data.hospitalization = prefs.getInt('hospitalization');
      data.birthdate =
          DateTime.fromMillisecondsSinceEpoch(prefs.getInt('birthdate'));
      data.gender = prefs.getString('gender');
      return data;
    }
    return null;
  }
}
