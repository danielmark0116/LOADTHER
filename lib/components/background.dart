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

const skew = 0.01;
const skew2 = 0.07;

class BackgroundClouds extends StatefulWidget {
  @override
  _BackgroundCloudsState createState() => _BackgroundCloudsState();
}

class _BackgroundCloudsState extends State<BackgroundClouds>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    animation = CurvedAnimation(curve: Curves.easeOutCubic, parent: controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void didUpdateWidget(BackgroundClouds oldWidget) {
    controller.reset();
    controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Transform(
          transform: Matrix4.skew(
            skew - skew * animation.value,
            skew2 - skew2 * animation.value,
          )..scale(1.1 - 0.1 * animation.value),
          origin: Offset(0, 1000),
          child: Stack(
            children: <Widget>[
              BgShadow(),
              BgNoShadow(),
            ],
          ),
        );
      },
    );
  }
}
