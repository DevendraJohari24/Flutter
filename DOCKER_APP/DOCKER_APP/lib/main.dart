import 'package:flutter/material.dart';
import 'ui/MyHomePage.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DOCKER_APP",
      home: MyHomePage(),
    );
  }
}
