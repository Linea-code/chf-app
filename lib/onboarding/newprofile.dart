import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Anlage der eigenen Klasse Profil mit Deklaration der Variablen: Vorname, Nachname, Begleiterkrankungen, Lebensumstände, Geburtsdatum, Krankenhausaufenthalte, Geschlecht
class NewProfile{
  String firstName;
  String secondName;
  String comorbidities;
  String livingConditions = "mit Ehepartner";
  DateTime birthdate;
  int hospitalization;
  String gender;
  NewProfile({this.firstName, this.secondName, this.livingConditions, this.birthdate ,this.comorbidities ,this.hospitalization, this.gender
  });
  }