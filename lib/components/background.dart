import 'package:flutter/material.dart';

import './bg-noshadow.dart';
import './bg-shadow.dart';

const shadowColor = Colors.black;
const blurRadius = 20.0;
const spreadRadius = 5.0;
const offset = Offset(
  0, // horizontal, move right 10
  0, // vertical, move down 10
);

class BackgroundClouds extends StatefulWidget {
  @override
  _BackgroundCloudsState createState() => _BackgroundCloudsState();
}

class _BackgroundCloudsState extends State<BackgroundClouds> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            BgShadow(),
            BgNoShadow(),
          ],
        );
      },
    );
  }
}
