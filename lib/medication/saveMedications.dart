import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Anlage der eigenen Klasse um Medikations angaben zu speichern mit Deklaration der Variablen:
class SaveMedications{
  bool checkMorning = false;
  bool checkDay = false;
  bool checkEavening = false;
  bool checkNight = false;
  SaveMedications({ this.checkMorning,this.checkNight,this.checkEavening,this.checkDay
  });
}