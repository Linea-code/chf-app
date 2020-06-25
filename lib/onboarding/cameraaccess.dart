import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraAccess extends StatefulWidget {
  @override
  _CameraAccessState createState() => _CameraAccessState();
}

class _CameraAccessState extends State<CameraAccess> {
  // Kamerazugriff vorerst nicht gestattet
  bool _camera = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Kamera'),
      value: _camera,
      onChanged: (bool value) {
        setState(() {
          _camera = value;
        });
      },
    );
  }
}