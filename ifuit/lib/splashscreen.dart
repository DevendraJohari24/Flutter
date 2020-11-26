import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home.dart';
class MySplash extends StatefulWidget{
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context){
    return SplashScreen(seconds: 2,
      navigateAfterSeconds: Home(),
    title: Text('Dogs And Cat',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Colors.teal,
    ),),
      image: Image.asset('assets/cat.png'),
      backgroundColor: Colors.black,
      photoSize: 50,
      loaderColor: Colors.purple,
    );
  }
}