import 'package:DOCKER_APP/pages/First_Page.dart';
import 'package:DOCKER_APP/ui/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:DOCKER_APP/pages/Third_Page.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.OS_image, this.ip_address}) : super(key: key);
  final String OS_image;
  final String ip_address;
  @override
  SecondPageState createState() => SecondPageState();
}

String DockerOSName;

class SecondPageState extends State<SecondPage> {
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
