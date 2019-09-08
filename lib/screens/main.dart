import 'package:flutter/material.dart';

// COLORS
import '../styleguide/colors.dart';

// COMPONENTS
import '../components/background.dart';
import '../components/weather-icon.dart';
import '../components/weather-data.dart';
import './loading.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var sizeData = MediaQuery.of(context).size;

    double sizeBlockH = sizeData.height.toDouble() / 100;
    double sizeBlockW = sizeData.width.toDouble() / 100;

    double responsizeFix;

    if (sizeData.height < 700) {
      responsizeFix = 25.0;
    } else {
      responsizeFix = 0.0;
    }

    return Scaffold(
      backgroundColor: styleYellow,
      body: Stack(
        children: <Widget>[
          BackgroundClouds(),
          Column(
            children: <Widget>[
              WeatherIcon(),
              WeatherDataComponent(
                cityName: 'Hawkins',
                cityTemp: 27,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: sizeBlockH * 10 - responsizeFix),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                onPressed: () {
                  // setState(() {});
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoadingScreen()));
                },
                padding: EdgeInsets.all(sizeBlockH),
                child: Text(
                  'UPDATE WEATHER',
                  style: TextStyle(
                    fontSize: sizeBlockH * 3,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
