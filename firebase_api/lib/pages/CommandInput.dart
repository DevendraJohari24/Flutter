import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = FirebaseFirestore.instance.collection('api_commands');

class CommandInput extends StatefulWidget{
  CommandInputState createState() => CommandInputState();
}



String Cmd = '';
String Output = '';
final DateTime timestamp = DateTime.now();


class CommandInputState extends State<CommandInput>{

  CommandOutput(String cmd) async {
    var url = "http://192.168.1.103/cgi-bin/new.py?x=${cmd}";
    print(url);
    var r = await http.get(url);
    setState(() {
      Output = r.body;
    });
    print(Output);
    await usersRef.add({
      "IP": "192.168.1.103",
      "Command": cmd,
      "Output": Output,
      "timestamp": timestamp,
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Your Commands"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Container(
              margin: EdgeInsets.only(left: 50, right: 50, top: 50, bottom: 10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green
              )
              ),
              child: Text("Enter Your Commands Here!",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),),
            ),
            ),
            SizedBox(),
            Center(
              
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                  cursorColor: Colors.yellow,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.purple
                  ),
                  onChanged: (value){
                    Cmd = value;
                  },
                  onSubmitted: (value){
                    CommandOutput(value);
                  },
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 2
                    ),
                  borderRadius: BorderRadius.circular(5.0)
                ),
              ),
            ),
            SizedBox(),
            Center(child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.green
                  )
              ),
              child: Text("Output!",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            ),
            SizedBox(),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                padding: EdgeInsets.only(left: 20,right: 20, top: 20, bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                  )
                ),
                  child: SingleChildScrollView(
                    child: Text(Output),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}