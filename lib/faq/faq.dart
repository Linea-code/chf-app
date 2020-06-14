import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

class FAQ extends StatelessWidget {
  final String _title = "FAQ";
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
          padding: EdgeInsets.all(10.0),
          child: ListView(children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Krankheitsbild:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                //color: Colors.lightGreen[800],
              ),),
            ),
            Card(
              child: ExpansionTile(
                title: Text(
                  "Was genau ist chronische Herzinsuffizienz?",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                children: <Widget>[
                  Container(
                    child: Column(children: <Widget>[
                      Image.asset("assets/Herzinsuffizienz_Abb.jpg"),
                      Text(
                        "http://www.info-praxisteam.de/2010/03/img/8-2.jpg?m=1396268804",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Bei chronischer Herzinsuffizienz handelt es sich um eine Krankheit des Herzens. Sie beschreibt eine Abnahme der Pumpfähigkeit des Herzmuskels. "
                      "Das Herz ist somit nicht mehr fähig den Körper und seine Organe mit genügend Blut und Sauerstoff zu versorgen. Durch diesen Mangel wird der "
                      "Stoffwechsel negativ beeinflusst. Häufige Symptome einer Herzinsuffizienz sind beispielsweise: Müdigkeit, Atemnot oder Schmerzen in der Brust.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Vitalparameter:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),),
            ),
            Card(
              child: ExpansionTile(
                title: Text(
                  "Wie misst man korrekt Blutdruck?",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                children: <Widget>[
                  Container(
                    child: Column(children: <Widget>[
                      Image.asset("assets/Blutdruck_messen.png"),
                      Text(
                        "https://www.blutdruckdaten.de/images/man/Richtig-messen2.png",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Bitte setzen Sie sich zum messen des Blutdrucks auf einen Stuhl und legen Sie einen Arm locker ausgestreckt auf einen Tisch.\n\n"
                      "Der Blutdruck wird mittels einer Manschette gemessen, welche an ein Messgerät angeschlossen ist. Um den Blutdruck korrekt zu messen,"
                      "wird die Manschette, je nach Gerät, um den gestrecken und unbekleideten Oberarm oder das Handgelenk angelegt. Achten Sie darauf, dass sich wie auf dem Bild, die Manschette auf der Höhe des Herzens befindet.\n\n"
                      "Anschließend wird die Manschette aufgebumpt (Druck auf \"Start\"-Knopf).\n\n"
                      "Es folgt automatisch ein langsames Ablassen der Luft aus der Manschette. Das Gerät zeigt anschließend den ermittelten Blutdruck an.\n\n"
                      "Sollten Sie Fragen zum korrekten Messen des Blutdrucks haben, wenden Sie sich bitte an Ihren behandelnden Arzt.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Symptome:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),),
            ),
            Card(
              child: ExpansionTile(
                title: Text(
                  "Wie kann man Atemnot vorbeugen?",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Atemnot ist ein häufiges Leiden von Patienten mit chronischer Herzinsuffizienz.\n"
                      "Um Atemnot vorzubeugen sollten Sie in Ihrem Alltag auf genügend Pausen achten. Planen Sie beispielsweise Termine und Freizeit sehr locker, um Stress und Druck zu vermeiden.\n\n"
                      "Planen Sie auch im Haushalt und alltäglichen Arbeiten genügend Zeit ein und achten Sie darauf häufig kurze Verschnaufpausen einzubinden.\n\n"
                      "Sollten Sie Atemnot beim Liegen haben, ist es ratsam den Kopf beim schlafen höher zu langern. Dies kann beispielsweise durch die Erhöhung des Kopfteils passieren, oder mittels zusätzlicher Kissen im Rücken.\n\n"
                      "Bei sich schnell verschlimmernder Atemnot oder Unsicherheiten suchen Sie bitte umgehend Ihren behandelnen Arzt auf.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              child: ExpansionTile(
                title: Text(
                  "Wie kann man Schwindel vorbeugen?",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Schwindel tritt bei Patienten mit chronischer Herzinsuffizienz häufig auf.\n"
                      "Um Schwindel im Alltag vorzubeugen sollten Sie ausreichend Zeit einplanen für Ihre Aktivitäten, um Stress und ruckartiges Aufstehen zu vermeiden.\n\n"
                      "Achten Sie darauf nicht ruckartig aufzustehen, sondern geben Sie Ihrem Kreislauf Zeit in Schwung zu kommen.\n\n"
                      "Beim morgentlichen Aufstehen kann es hilfreich sein, vorerst für einige Minuten die Füße und Zehen zu bewegen, um den Kreislauf anzukurbeln."
                      "Setzen Sie sich anschließend langsam im Bett auf und warten Sie noch einen Moment bis Sie vollständig und in Ruhe aufstehen.\n\n"
                      "Bei sich schnell verschlimmerndem Schwindel oder Unsicherheiten suchen Sie bitte umgehend Ihren behandelnen Arzt auf.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Card(
              child: ExpansionTile(
                title: Text(
                  "Wie kann man Schwellungen vorbeugen?",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Schwellungen treten bei Patienten mit chronischer Herzinsuffizienz veräuft auf.\n\n"
                      "Um Schwellungen entgegen zu wirken achten Sie bitte auf Ihre Ernährung. Dabei sollte vor allem auf eine möglichst salzarme Ernährung geachtet werden. "
                      "Zudem sollten Sie Genussmittel wie Alkohol und Zigaretten meiden. Außerdem müssen Sie sich an die von Ihrem Arzt festgeschriebene Trinkmenge halten und Ihre "
                      "Flüssigkeitszufuhr kontrollieren.\n\n"
                      "Bei sich schnell verschlimmernden Schwellungen oder Unsicherheiten suchen Sie bitte umgehend Ihren behandelnen Arzt auf.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
