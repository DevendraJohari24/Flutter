import 'package:DOCKER_APP/pages/First_Page.dart';
import 'package:DOCKER_APP/pages/Second_page.dart';
import 'package:DOCKER_APP/ui/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FourPage extends StatefulWidget {
  FourPage({Key key, this.ip_address}) : super(key: key);
  final String ip_address;
  FourPageState createState() => FourPageState();
}

String Dockeroscmd;
String Output;

class FourPageState extends State<FourPage> {
  DockerCommand(String cmd) async {
    var url = "http://${ip_address}/cgi-bin/docker.py?x=${cmd}";
    print(url);
    var r = await http.get(url);
    Output = r.body;
    print(Output);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter OS Commands"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(50),
              child: TextField(
                onChanged: (value) {
                  Dockeroscmd = value;
                },
                autofocus: true,
                cursorColor: Colors.yellow,
                style: TextStyle(height: 1.5),
                decoration: InputDecoration(
                  hintText: "Enter Ur Command",
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                DockerCommand(Dockeroscmd);
                if (Dockeroscmd == "exit") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                }
              },
              child: Icon(Icons.airline_seat_recline_extra),
            )
          ],
        ),
      ),
    );
  }
}
