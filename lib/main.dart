import 'package:flutter/material.dart';

// Colors
import './styleguide/colors.dart';

// COMPONENTS
import './screens/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOADTHER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
          fontFamily: 'JosefinSans'),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'LOADTHER',
            style: TextStyle(fontWeight: FontWeight.w300, color: styleGrey),
          ),
        ),
        body: MainScreen(),
      ),
    );
  }
}
