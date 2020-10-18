import 'package:flutter/material.dart';
import 'package:animation_app/widget/StoreHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Store App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: StoreHomePage(title: 'Drinks App'),
    );
  }
}

