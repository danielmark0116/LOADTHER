import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Loading'),
      ),
      bottomNavigationBar: MaterialButton(
        child: Padding(
          padding: EdgeInsets.only(bottom: 100),
          child: Text('Go back'),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
