import 'package:flutter/material.dart';

import '../styleguide/colors.dart';
import '../components/background.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styleLightGrey,
      body: Stack(
        children: <Widget>[
          BackgroundClouds(),
          Center(
            child: Text('APP CONTENT'),
          ),
        ],
      ),
    );
  }
}
