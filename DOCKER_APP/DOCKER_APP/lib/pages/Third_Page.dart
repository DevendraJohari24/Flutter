import 'package:DOCKER_APP/pages/First_Page.dart';
import 'package:DOCKER_APP/pages/Second_page.dart';
import 'package:DOCKER_APP/ui/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:DOCKER_APP/pages/Fourth_Page.dart';

import 'package:http/http.dart' as http;

class ThirdPage extends StatefulWidget {
  ThirdPage({Key key, this.DockerOSName, this.OS_image, this.ip_address})
      : super(key: key);
  final String DockerOSName;
  final String OS_image;
  final String ip_address;

  ThirdPageState createState() => ThirdPageState();
}

String IP = ip_address;
String Dockercmd;
String Output;

class ThirdPageState extends State<ThirdPage> {
  DockerCommand(String cmd) async {
    var url;
    if (cmd == "run") {
      url = "http://${IP}/cgi-bin/docker.py?x=docker ${cmd} -i" +
          " --name ${DockerOSName} ${OS_image}";
      print(url);
    } else {
      url = "http://${IP}/cgi-bin/docker.py?x=docker ${cmd}";
      print(url);
    }
    var r = await http.get(url);
    Output = r.body;
    print(Output);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Docker Commands"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(50),
              child: TextField(
                onChanged: (value) {
                  Dockercmd = value;
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
                DockerCommand(Dockercmd);
                if (Dockercmd == "exit") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FourPage(ip_address: ip_address)),
                  );
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
