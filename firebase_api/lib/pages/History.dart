
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class History extends StatefulWidget{
  HistoryState createState() => HistoryState();
}
final usersRef =  FirebaseFirestore.instance;
class HistoryState extends State<History>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: Container(
        child: Column(
          children: [
            StreamBuilder(builder: (context, snapshot){
              var msg = snapshot.data;
              print(msg);
              return Container(
                child: Text("Hi"),
              );
            },
              stream: usersRef.collection("api_commands").snapshots(),
            ),
          ],
        ),
      )
    );
  }
}