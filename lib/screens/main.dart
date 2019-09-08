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
            padding: EdgeInsets.only(bottom: 70),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                onPressed: () {
                  // setState(() {});
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoadingScreen()));
                },
                padding: EdgeInsets.all(20),
                child: Text(
                  'UPDATE WEATHER',
                  style: TextStyle(
                    fontSize: 25,
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
