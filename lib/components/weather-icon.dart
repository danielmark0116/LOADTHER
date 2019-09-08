import 'package:flutter/material.dart';

// COLORS
import '../styleguide/colors.dart';

class WeatherIcon extends StatefulWidget {
  @override
  _WeatherIconState createState() => _WeatherIconState();
}

class _WeatherIconState extends State<WeatherIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;

  double icoSize = 30;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();

    animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);

    _controller.reset();
    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(WeatherIcon oldWidget) {
    _controller.reset();
    _controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeData = MediaQuery.of(context);

    var blockSizeW = sizeData.size.width / 100;
    var blockSizeH = sizeData.size.height / 100;

    return Align(
      alignment: Alignment.center,
      child: Transform.scale(
        scale: 1 * animation.value,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          width: blockSizeW * icoSize,
          height: blockSizeW * icoSize,
          child: Align(
            alignment: Alignment.center,
            child: Image.asset('assets/images/sun-clouds.png'),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 20.0,
                spreadRadius: 2.0,
                color: styleLightShadowColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
