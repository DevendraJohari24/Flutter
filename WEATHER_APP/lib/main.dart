import 'package:flutter/material.dart';
import 'package:WEATHER_APP/ui/MyHomePage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Weather App",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Weather Sun Lo Friends'),
    );
  }
}
