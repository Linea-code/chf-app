import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectBirthdate extends StatefulWidget {
  @override
  _SelectBirthdateState createState() => _SelectBirthdateState();
}

class _SelectBirthdateState extends State<SelectBirthdate> {
  DateTime selectedDate = DateTime.now();

    Future<Null> _selectBirthdate(BuildContext context) async{
      final DateTime picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(1900), lastDate: DateTime.now());
      if(picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });
  }
  @override
  Widget build (BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Steckbrief',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w800,
              fontFamily: "Arial",
            ),
          ),
          backgroundColor: Colors.lightGreen[500],
        ),
      body: Center(
        child: Column(
        children: <Widget>[
          Text(selectedDate.toString()),
        ],
      ),
      )
      );
  }
}
