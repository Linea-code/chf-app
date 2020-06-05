import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
//TODO: hier müssen neue Interfaces erstellt werden für die Details.
class BPM extends StatefulWidget {


  @override
  _BPMState createState() => _BPMState();
}

class _BPMState extends State<BPM> {
List<charts.Series<Datapoints,int>>  _seriesData;

  _generateData(){
    var dataBP = [
      new Datapoints(1, 77),
      new Datapoints(4, 65),
      new Datapoints(5, 85),
      new Datapoints(6, 45),
      new Datapoints(9, 100),
    ];
    _seriesData.add(
      charts.Series(
        data: dataBP,
        domainFn: (Datapoints datapoints,_)=> datapoints.day,
        measureFn: (Datapoints datapoints,_)=> datapoints.value,
        id: 'Tägliche Herzfrequenz in BPM',
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    _seriesData = List<charts.Series<Datapoints,int>>();
    _generateData();

  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text(
            'Übersicht',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          backgroundColor: Colors.lightGreen[500],
        ),
        body: ListView(children: <Widget>[
        Card(
        child: ListTile(
            leading: Icon(Icons.local_hospital),
        title: Text('Medikationseinnahme'),
        subtitle: Text('Sie müssen heute noch Ihre Mediakmente einnehmen!'),
      ),
    ),
    Card(
      child:
      Padding(
      padding: EdgeInsets.all(8.0),
    child:
        Column(
          children: <Widget>[
            Text('Test'),
    Expanded(
        child:
    charts.LineChart(
        _seriesData,
        defaultRenderer: new charts.LineRendererConfig(
          includeArea: true, stacked: true,
        ),
        animate: true,
        animationDuration: Duration(seconds: 3),
        behaviors: [
          new charts.ChartTitle('BPM'),
        ],
      )),
    ]),),)
    ],
    ),
      );
  }
}


class Datapoints{
  int day;
  int value;

  Datapoints(this.day,this.value);
}