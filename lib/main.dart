import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/home/home.dart';
import 'package:herzinsuffizienz/onboarding/accessrights.dart';
import 'package:herzinsuffizienz/onboarding/firstscreen.dart';
import 'package:herzinsuffizienz/onboarding/newprofile.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final newProfile = await NewProfile.loadData();
  runApp(MaterialApp(home: (newProfile != null) ? Home() : Start()));
}













