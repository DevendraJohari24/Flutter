import 'package:DOCKER_APP/pages/First_Page.dart';
import 'package:DOCKER_APP/ui/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:DOCKER_APP/pages/Third_Page.dart';
import 'package:http/http.dart' as http;

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.OS_image, this.ip_address}) : super(key: key);
  final String OS_image;
  final String ip_address;
  @override
  SecondPageState createState() => SecondPageState();
}

String DockerOSName;

class SecondPageState extends State<SecondPage> {
  DockerCommand(String OS_image, String DockerOSName) async {
    String cmd = "run";
    var url = "http://${IP}/cgi-bin/docker.py?x=docker ${cmd} " +
        " --name ${DockerOSName} ${OS_image}";
    print(url);
    var r = await http.get(url);
    Output = r.body;
    print(Output);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Image Name!"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(50),
                child: TextField(
                  autofocus: true,
                  cursorColor: Colors.yellow,
                  style: TextStyle(height: 1.5),
                  decoration: InputDecoration(
                    hintText: "Enter Name",
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    DockerOSName = value;
                  },
                ),
              ),
              Container(
                child: FloatingActionButton(
                  onPressed: () {
                    print(DockerOSName);
                    DockerCommand(OS_image, DockerOSName);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ThirdPage(
                                DockerOSName: DockerOSName,
                                OS_image: OS_image,
                                ip_address: ip_address,
                              )),
                    );
                  },
                  child: Icon(Icons.navigate_next),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
