import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewProfile{
  String vorname;
  String nachname;
  String begleiterkrankungen;
  String lebensumstaende = "mit Ehepartner";
  DateTime birthdate;
  int krankenhausaufenthalte;
  String geschlecht;
  NewProfile({this.vorname, this.nachname, this.lebensumstaende, this.birthdate ,this.begleiterkrankungen ,this.krankenhausaufenthalte, this.geschlecht
  });
  }