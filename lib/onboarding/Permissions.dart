import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

class Permission extends StatefulWidget {
  @override
  _PermissionState createState() => _PermissionState();
}

class _PermissionState extends State<Permission> {
  @override
  Widget build(BuildContext context) {
    return Container(child:
        RaisedButton(
      onPressed: _getHealthDataPoints,
        ),
    );
  }
}



void _getHealthDataPoints() async {

  List<HealthDataType> types = [
    HealthDataType.WEIGHT,
    HealthDataType.HEIGHT,
    HealthDataType.STEPS,
  ];

  DateTime startDate = DateTime.utc(2001, 01, 01);
  DateTime endDate = DateTime.now();

  List<HealthDataPoint> healthDataList = List<HealthDataPoint>();

  Future.delayed(Duration(seconds: 2), () async {
    bool isAuthorized = await Health.requestAuthorization();
    if (isAuthorized) {
      for (HealthDataType type in types) {
        /// Calls to 'Health.getHealthDataFromType' must be wrapped in a try catch block.
        try {
          List<HealthDataPoint> healthData = await Health.getHealthDataFromType(startDate, endDate, type);
          healthDataList.addAll(healthData);
        } catch (exception) {
          print(exception.toString());
        }
      }
    }
    /// Do something with the health data list
    for (var healthData in healthDataList) {
      print(healthData);
    }
  });
}
