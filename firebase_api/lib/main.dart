import 'package:flutter/material.dart';
import 'package:firebase_api/pages/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FIREBASE API",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.teal,
      ),
    );
  }
}
