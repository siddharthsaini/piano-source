import 'package:flutter/material.dart';
import 'dart:js' as js;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: Container(
          height: 45,
          width: double.infinity,
          color: Colors.blue[800],
          child: Center(
            child: Text(
              "Siddharth Saini - 2018UIT2502",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
                fontSize: 17,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          title: Text("ITC15 - Piano"),
          backgroundColor: Colors.blue[900],
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              White("B3"),
              White("C4"),
              BlackwithWhite("D4", "C#4"),
              BlackwithWhite("E4", "D#4"),
              White("F4"),
              BlackwithWhite("G4", "F#4"),
              BlackwithWhite("A4", "G#4"),
              BlackwithWhite("B4", "A#4"),
              White("C5"),
              BlackwithWhite("D5", "C#5"),
              BlackwithWhite("E5", "D#5"),
              White("F5"),
              BlackwithWhite("G5", "F#5"),
              BlackwithWhite("A5", "G#5"),
              BlackwithWhite("B5", "A#5"),
              White("C6")
            ],
          ),
        ),
      ),
    );
  }
}

class White extends StatelessWidget {
  White(this.wn);
  final String wn;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 120, 5, 120),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            boxShadow: kElevationToShadow[3],
            borderRadius: BorderRadius.circular(8),
          ),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            onPressed: () {
              js.context.callMethod("playNote", [wn, "8n"]);
            },
            color: Colors.white,
            highlightColor: Colors.blue[300],
          ),
        ),
      ),
    );
  }
}

class BlackwithWhite extends StatelessWidget {
  BlackwithWhite(this.wn, this.bn);
  final String bn;
  final String wn;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(5, 120, 5, 120),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                boxShadow: kElevationToShadow[3],
                borderRadius: BorderRadius.circular(8),
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                onPressed: () {
                  js.context.callMethod("playNote", [bn, "8n"]);
                },
                color: Colors.white,
                highlightColor: Colors.blue[300],
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: -30,
            child: Container(
              width: 60,
              height: 230,
              child: RaisedButton(
                highlightColor: Colors.grey[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                onPressed: () {
                  js.context.callMethod("playNote", [wn, "8n"]);
                },
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
