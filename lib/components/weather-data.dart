import 'package:flutter/material.dart';

import '../styleguide/colors.dart';

class WeatherDataComponent extends StatefulWidget {
  String cityName;
  int cityTemp;
  var weatherColor;

  WeatherDataComponent(
      {@required this.cityName,
      @required this.cityTemp,
      @required this.weatherColor});

  @override
  _WeatherDataComponentState createState() => _WeatherDataComponentState();
}

class _WeatherDataComponentState extends State<WeatherDataComponent>
    with SingleTickerProviderStateMixin {
  //
  int temp;
  String city;
  double skew = 0.2;
  var color;

  AnimationController controller;
  Animation animation;
  Animation animation2;

  @override
  void initState() {
    setState(() {
      city = widget.cityName;
      temp = widget.cityTemp;
      color = widget.weatherColor;
    });

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    animation2 =
        CurvedAnimation(parent: controller, curve: Curves.easeOutCubic);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void didUpdateWidget(WeatherDataComponent oldWidget) {
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
    var sizeData = MediaQuery.of(context);

    var blockSizeW = sizeData.size.width / 100;
    var blockSizeH = sizeData.size.height / 100;

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Transform(
            transform: Matrix4.skew(
                skew - skew * animation2.value, skew - skew * animation2.value),
            child: Text(
              '$temp°',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: blockSizeH * 7,
                color: color,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Opacity(
            opacity: 1 * animation.value,
            child: Text(
              'It\'s sunny in',
              style: TextStyle(
                fontSize: blockSizeH * 2,
                color: styleGrey,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Text(
            '${city.toUpperCase()}',
            style: TextStyle(
              fontSize: blockSizeH * 5 * animation.value,
              color: styleGrey,
            ),
          ),
        ),
      ],
    );
  }
}
