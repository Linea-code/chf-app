import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/home/home.dart';
import 'package:herzinsuffizienz/onboarding/accessrights.dart';
import 'package:herzinsuffizienz/onboarding/firstscreen.dart';
import 'package:herzinsuffizienz/onboarding/newprofile.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final newProfile = await NewProfile.loadData();
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.lightGreen[400],
      accentColor: Colors.lightGreen[600],
      hoverColor: Colors.lightGreen[300],
      textTheme: TextTheme(bodyText1: TextStyle(fontFamily: "Roboto-Light", fontSize: 30.0),
      bodyText2: TextStyle( fontFamily: "Roboto-Light", fontSize: 16.0, fontWeight: FontWeight.bold),
      subtitle1: TextStyle(fontFamily: "Roboto-Light", fontSize: 20.0, fontWeight: FontWeight.bold),
      subtitle2: TextStyle(fontFamily: "Roboto-Light", fontSize: 16.0, color: Colors.black),
      headline1: TextStyle(fontFamily: "Roboto-Black", fontSize: 30.0, color: Colors.black),
      headline3: TextStyle(fontFamily: "Roboto-Light", fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),
      headline4: TextStyle(fontFamily: "Roboto-Light", fontSize: 20.0, color: Colors.black),
      headline5: TextStyle(fontFamily: "Roboto-Light", fontSize: 16.0),
      headline6: TextStyle(fontFamily: "Roboto-Light", fontSize: 16.0),)
    ),
      home: (newProfile != null) ? Home() : Start()));
}













