import 'package:flutter/material.dart';
import 'package:DOCKER_APP/pages/First_Page.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

String ip_address;

class MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Docker",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow[400],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text("     "),
            ),
            Center(
              child: Text(
                "Welcome to Docker",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text("     "),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: TextField(
                autofocus: true,
                cursorColor: Colors.yellow,
                style: TextStyle(height: 1.5),
                decoration: InputDecoration(
                  hintText: "Enter IP of WebServer",
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  ip_address = value;
                },
              ),
            ),
            FloatingActionButton(
              child: Icon(Icons.navigate_next),
              onPressed: () {
                print(ip_address);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context1) => FirstPage(
                            ip_address: ip_address,
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
