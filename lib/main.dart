import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herzinsuffizienz/home/home.dart';
import 'package:herzinsuffizienz/onboarding/accessrights.dart';
import 'package:herzinsuffizienz/onboarding/firstscreen.dart';
import 'package:herzinsuffizienz/onboarding/newprofile.dart';

// Main-Methode mit dem allgemeinen Theme der Applikation (Farben und Schrift)
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final newProfile = await NewProfile.loadData();
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Color(0xff9abf4e), //Colors.lightGreen[400],
      accentColor:Color(0xff50697d),  //Colors.lightGreen[600],
      hoverColor: Colors.lightGreen[300],
      textTheme: TextTheme(bodyText1: TextStyle(fontFamily: "Roboto-Light", fontSize: 30.0),
      bodyText2: TextStyle( fontFamily: "Roboto-Light", fontSize: 16.0, fontWeight: FontWeight.bold),
      subtitle1: TextStyle(fontFamily: "Roboto-Light", fontSize: 20.0, fontWeight: FontWeight.bold),
      subtitle2: TextStyle(fontFamily: "Roboto-Light", fontSize: 16.0, color: Colors.black),
      headline1: TextStyle(fontFamily: "Roboto-Light", fontSize: 28.0, color: Colors.black, fontWeight: FontWeight.bold),
      headline3: TextStyle(fontFamily: "Roboto-Light", fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),
      headline4: TextStyle(fontFamily: "Roboto-Light", fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontFamily: "Roboto-Light", fontSize: 22.0, color: Colors.black),
      headline6: TextStyle(fontFamily: "Roboto-Light", fontSize: 16.0),)
    ),
      home: (newProfile != null) ? Home() : Start()
  ));
}













