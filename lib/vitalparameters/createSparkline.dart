import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class CreateSparkline extends StatefulWidget {
  var data;

  CreateSparkline({this.data});
  @override
  _CreateSparklineState createState() => _CreateSparklineState();
}

class _CreateSparklineState extends State<CreateSparkline> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.0, bottom: 3.0, left: 3.0,right: 3.0),
      child: Sparkline(
        data: widget.data,
        fillMode: FillMode.below,
        lineColor: Colors.lightGreen[800],
        fillGradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.lightGreen[800], Colors.lightGreen[100]],

        ),

      ),
    );
  }
}

