import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insta_app/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 /* FirebaseFirestore.instance.settings.setTimestampsInSnapshotsEnabled(true).then((_){
      print("Timestamp enabled in Snapshot\n");
  }, onError: (_){
    print("Error in enabling timestamp in snapshot\n");
  });*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterShare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.teal,
      ),
      home: Home(),
    );
  }
}
