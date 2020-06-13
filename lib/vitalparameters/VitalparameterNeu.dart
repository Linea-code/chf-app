import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:herzinsuffizienz/vitalparameters/bpm.dart';
import 'package:herzinsuffizienz/vitalparameters/createSparkline.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:herzinsuffizienz/vitalparameters/weight.dart';

class Vitalparameter extends StatefulWidget {
  @override
  _VitalparameterState createState() => _VitalparameterState();
}

class _VitalparameterState extends State<Vitalparameter> {
  final String _title = "Vitalparameter";
  var _healthDataList = List<HealthDataPoint>();
  bool _isAuthorized = false;
  List<double> weight = List<double>();
  List<double> height = List<double>();
  List<double> steps = List<double>();
  List<double> bmi = List<double>();
  List<double> bodyFat = List<double>();
  List<double> activeEnergy = List<double>();
  List<double> _bpm = List<double>();
  List<double> bpSystolic = List<double>();
  List<double> bpDiastolic = List<double>();
  List<double> restingHR = List<double>();
  List<double> glucose = List<double>();
  List<double> oxygen = List<double>();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    DateTime startDate = DateTime.utc(2020,DateTime.now().month-1,DateTime.now().day);
    DateTime endDate = DateTime.now();

    Future.delayed(Duration(seconds: 2), () async {
      _isAuthorized = await Health.requestAuthorization();
      if (_isAuthorized) {
        List<HealthDataType> types = [
          HealthDataType.WEIGHT,
          HealthDataType.HEIGHT,
          HealthDataType.STEPS,
          HealthDataType.BODY_MASS_INDEX,
          HealthDataType.BODY_FAT_PERCENTAGE,
          HealthDataType.ACTIVE_ENERGY_BURNED,
          //HealthDataType.HEART_RATE,
          HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
          HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
          HealthDataType.RESTING_HEART_RATE,
          HealthDataType.BLOOD_GLUCOSE,
          HealthDataType.BLOOD_OXYGEN,
        ];
        for (HealthDataType type in types) {
          try {
            if (Health.isDataTypeAvailable(type)) {
              List<HealthDataPoint> healthData =
              await Health.getHealthDataFromType(startDate, endDate, type);
              _healthDataList.addAll(healthData);
            }
          } catch (exception) {
            print(exception.toString());
          }
        }
        setState(() {});
      } else {
        print("Keine Authorisierung vorliegend");
      }

      for (HealthDataPoint point in _healthDataList) {
        switch (point.dataType) {
          case "WEIGHT":
            {
              weight.add(point.value);
            }
            break;
          case "HEIGHT":
            {
              height.add(point.value);
            }
            break;
          case "STEPS":
            {
              steps.add(point.value.toDouble());
            }
            break;
          case "BODY_MASS_INDEX":
            {
              bmi.add(point.value);
            }
            break;
          case "BODY_FAT_PERCENTAGE":
            {
              bodyFat.add(point.value);
            }
            break;
          case "ACTIVE_ENERGY_BURNED":
            {
              activeEnergy.add(point.value.toDouble());
            }
            break;
          case "HEART_RATE":
            {
              _bpm.add(point.value.toDouble());
            }
            break;
          case "BLOOD_PRESSURE_SYSTOLIC":
            {
              bpSystolic.add(point.value);
            }
            break;
          case "BLOOD_PRESSURE_DIASTOLIC":
            {
              bpDiastolic.add(point.value);
            }
            break;
          case "RESTING_HEART_RATE":
            {
              restingHR.add(point.value.toDouble());
            }
            break;
          case "BLOOD_GLUCOSE":
            {
              glucose.add(point.value);
            }
            break;
          case "BLOOD_OXYGEN":
            {
              oxygen.add(point.value);
            }
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
            fontFamily: "Arial",
          ),
        ),
        backgroundColor: Colors.lightGreen[500],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                shadowColor: Colors.grey,
                child: Column(children: <Widget>[
                  ListTile(
                    //leading: Icon(Icons.trending_up),
                    title: Text('Herzfrequenz (bpm)'),
                    subtitle: Text("letzte Messung: " + (_bpm.isEmpty ? " " : _bpm.last.round().toString())),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BPM()));
                    },
                  ),
                  _bpm.isEmpty ? Container(padding: EdgeInsets.only(bottom: 15.0),child: SpinKitPumpingHeart(color: Colors.red[300])):
                  CreateSparkline(
                    data: _bpm,
                  ), //TODO: on tap genaueres Diagramm mit Achsenbeschr.
                ]),
              ),
              Card(
                shadowColor: Colors.grey,
                child: Column(children: <Widget>[
                  ListTile(
                    //leading: Icon(Icons.trending_up),
                    title: Text('Gewicht (kg)'),
                    subtitle: Text("letzte Messung: " + (weight.isEmpty ? " " : weight.last.toStringAsFixed(2))),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Weight()));
                    },
                  ),
                  weight.isEmpty ? Container(padding: EdgeInsets.only(bottom: 15.0),child: SpinKitPumpingHeart(color: Colors.red[300])):
                  CreateSparkline(
                    data: weight,
                  ),
                ]),
              ),
              Card(
                shadowColor: Colors.grey,
                child: Column(children: <Widget>[
                  ListTile(
                    //leading: Icon(Icons.trending_up),
                    title: Text('Körperfett'),
                    subtitle: Text("letzte Messung: " + (bodyFat.isEmpty ? " " : bodyFat.last.round().toString())),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Vitalparameter()));
                    },
                  ),
                  bodyFat.isEmpty ? Container(padding: EdgeInsets.only(bottom: 15.0),child: SpinKitPumpingHeart(color: Colors.red[300])):
                  CreateSparkline(
                    data: bodyFat,
                  ),
                ]),
              ),
              Card(
                shadowColor: Colors.grey,
                child: Column(children: <Widget>[
                  ListTile(
                    title: Text('Schritte'),
                    subtitle: Text("letzte Messung: " + (steps.isEmpty ? " " : steps.last.round().toString())),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Vitalparameter()));
                    },
                  ),
                  steps.isEmpty ? Container(padding: EdgeInsets.only(bottom: 15.0),child: SpinKitPumpingHeart(color: Colors.red[300])):
                  CreateSparkline(data: steps),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
