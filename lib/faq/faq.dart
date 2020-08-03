import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  final String _title = "Häufige Fragen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(//Kopfzeile mit Titel
          title: Text(
            _title, style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Krankheitsbild:",
              style: Theme.of(context).textTheme.headline3,
                //color: Colors.lightGreen[800],
              ),
            ),

            //Einzelne Karten, jeweils zum Ausklappen -> auf Vorderseite Frage, bei Ausklappen Antwort/Tipps etc. mit Bildern und Texten
            //Zudem unterteilung der Fragen in spezifische Gruppen um eine bessere Strucktur zu ermöglichen

            Card(
              color:  Color(0xfff0fcfc),
              child: ExpansionTile(
                title: Text(
                  "Was genau ist chronische Herzinsuffizienz?"
                ),
                children: <Widget>[
                  Container(
                    child: Column(children: <Widget>[
                      Image.asset("assets/Herzinsuffizienz_Abb.jpg"), //Bild aus dem Ordner Assets
                      Text(
                        "http://www.info-praxisteam.de/2010/03/img/8-2.jpg?m=1396268804", //Bildquelle
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
                      "Stoffwechsel negativ beeinflusst. Häufige Symptome einer Herzinsuffizienz sind beispielsweise: Müdigkeit, Atemnot oder Schmerzen in der Brust."
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Vitalparameter:",
                style: Theme.of(context).textTheme.headline3,),
            ),
            Card(
              color:  Color(0xfff0fcfc),
              child: ExpansionTile(
                title: Text(
                  "Wie misst man korrekt Blutdruck?"
                ),
                children: <Widget>[
                  Container(
                    child: Column(children: <Widget>[
                      Image.asset("assets/Blutdruck_messen.png"), //Bild aus dem Ordner assets
                      Text(
                        "https://www.blutdruckdaten.de/images/man/Richtig-messen2.png", //Bildquelle
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
                      "Sollten Sie Fragen zum korrekten Messen des Blutdrucks haben, wenden Sie sich bitte an Ihren behandelnden Arzt."
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Symptome:",
                style: Theme.of(context).textTheme.headline3,),
            ),
            Card(
              color:  Color(0xfff0fcfc),
              child: ExpansionTile(
                title: Text(
                  "Wie kann man Atemnot vorbeugen?"
                ),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Atemnot ist ein häufiges Leiden von Patienten mit chronischer Herzinsuffizienz.\n"
                      "Um Atemnot vorzubeugen sollten Sie in Ihrem Alltag auf genügend Pausen achten. Planen Sie beispielsweise Termine und Freizeit sehr locker, um Stress und Druck zu vermeiden.\n\n"
                      "Planen Sie auch im Haushalt und alltäglichen Arbeiten genügend Zeit ein und achten Sie darauf häufig kurze Verschnaufpausen einzubinden.\n\n"
                      "Sollten Sie Atemnot beim Liegen haben, ist es ratsam den Kopf beim schlafen höher zu langern. Dies kann beispielsweise durch die Erhöhung des Kopfteils passieren, oder mittels zusätzlicher Kissen im Rücken.\n\n"
                      "Bei sich schnell verschlimmernder Atemnot oder Unsicherheiten suchen Sie bitte umgehend Ihren behandelnen Arzt auf."
                    ),
                  )
                ],
              ),
            ),
            Card(
              color:  Color(0xfff0fcfc),
              child: ExpansionTile(
                title: Text(
                  "Wie kann man Schwindel vorbeugen?"
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
                      "Bei sich schnell verschlimmerndem Schwindel oder Unsicherheiten suchen Sie bitte umgehend Ihren behandelnen Arzt auf."
                    ),
                  )
                ],
              ),
            ),
            Card(
              color:  Color(0xfff0fcfc),
              child: ExpansionTile(
                title: Text(
                  "Wie kann man Schwellungen vorbeugen?"
                ),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Schwellungen treten bei Patienten mit chronischer Herzinsuffizienz veräuft auf.\n\n"
                      "Um Schwellungen entgegen zu wirken achten Sie bitte auf Ihre Ernährung. Dabei sollte vor allem auf eine möglichst salzarme Ernährung geachtet werden. "
                      "Zudem sollten Sie Genussmittel wie Alkohol und Zigaretten meiden. Außerdem müssen Sie sich an die von Ihrem Arzt festgeschriebene Trinkmenge halten und Ihre "
                      "Flüssigkeitszufuhr kontrollieren.\n\n"
                      "Bei sich schnell verschlimmernden Schwellungen oder Unsicherheiten suchen Sie bitte umgehend Ihren behandelnen Arzt auf."
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("Notfall",
                style: Theme.of(context).textTheme.headline3,),
            ),
            Card(
              color:  Color(0xfff0fcfc),
              child: ExpansionTile(
                title: Text(
                    "An wen wende ich mich bei einem Notfall?"
                ),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        "Sollten Sie unter aktuten Krankheitsverschlechterungen leiden, begeben Sie sich bitte umgehend in ein Krankenhaus. "
                            "Fühlen Sie sich nicht in der Lage eigenständig ein Krankenhaus aufzusuchen, rufen Sie bitte den Notarzt mit der Nummer: 112"
                    ),
                  )
                ],
              ),
            ),
            Card(
              color:  Color(0xfff0fcfc),
              child: ExpansionTile(
                title: Text(
                    "Wie kann ich mich auf einen Notfall vorbereiten?"
                ),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                        "Um auf einen Ernstfall eingerichtet zu sein, sollten Sie sicherstellen, dass Sie immer die Möglichkeit haben Hilfe anzufordern. "
                            "Tragen Sie beispielsweise grundätzlich ein Ihr Smartphone bei sich. Allen Sie sich außerdem von Ihrem behandelnden Arzt Hinweise zum Umgang mit aktuten Krankheitsverschlechterungen geben."
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
