import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ConfigureIT",
      home: MyHomePage(),
    );
  }
}
