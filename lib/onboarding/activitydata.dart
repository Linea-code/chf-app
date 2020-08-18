import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

//Zugriffrechte auf Aktivitätsdaten
class ActivityData extends StatefulWidget {
  @override
  _ActivityDataState createState() => _ActivityDataState();
}

class _ActivityDataState extends State<ActivityData> {
  //Zu Beginn wird Zugriffsrecht ausgeschaltet
  bool _aktivity = false;
  HealthFactory health = HealthFactory();

  @override
  Widget build(BuildContext context) {
    //Slider um Aktivitätszugriff zu aktivieren
    return SwitchListTile(
      title: const Text('Aktivitätsdaten'),
      value: _aktivity,
      onChanged: (bool value) {
        //Abfrage der Authorisierung-> Wenn sie gegeben wird, so ändert sich der Slider auf true und die Daten können verwendet werden
        Future<void> initPlatformState() async {
          DateTime startDate =
              DateTime.utc(2020, DateTime.now().month - 1, DateTime.now().day);
          DateTime endDate = DateTime.now();
          List<HealthDataType> types = [
            HealthDataType.WEIGHT,
            HealthDataType.HEIGHT,
            HealthDataType.STEPS,
            HealthDataType.BODY_FAT_PERCENTAGE,
            HealthDataType.ACTIVE_ENERGY_BURNED,
            HealthDataType.HEART_RATE,
            HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
            HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
            HealthDataType.BLOOD_GLUCOSE,
            HealthDataType.BLOOD_OXYGEN,
          ];
          List<HealthDataPoint> healthData =
              await health.getHealthDataFromTypes(startDate, endDate,
                  types); //Abfragen der Authorisierung über Health kit
          if (healthData.isNotEmpty) {
            setState(() {

              _aktivity = value; // veränderung des activity Wertes
            });
          }
        }
        initPlatformState();
      },
    );
  }
}
