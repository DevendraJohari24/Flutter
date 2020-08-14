import 'package:DOCKER_APP/pages/Fourth_Page.dart';
import 'package:DOCKER_APP/ui/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:DOCKER_APP/pages/Second_page.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.ip_address}) : super(key: key);
  final String ip_address;

  @override
  FirstPageState createState() => FirstPageState();
}

String OS_image = 'centos:7';

class FirstPageState extends State<FirstPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Image Type!"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 35, right: 30),
        child: Container(
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        OS_image = 'ubuntu:14.04';
                        print(OS_image);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondPage(
                                    OS_image: OS_image,
                                    ip_address: ip_address,
                                  )),
                        );
                      },
                      child: Text(
                        "Ubuntu",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(
                        width: 3.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Text(
                        "Ubuntu",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Text(
                        "Ubuntu",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3.5,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.185),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Text(
                        "Ubuntu",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Text(
                        "Ubuntu",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      color: Colors.indigoAccent[400],
                      onPressed: () {
                        OS_image = 'centos:7';
                        print(OS_image);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondPage(
                                  OS_image: OS_image, ip_address: ip_address)),
                        );
                      },
                      child: Text(
                        "CentOS 7",
                        style: TextStyle(
                            color: Colors.lightBlueAccent[100],
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3.5,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 70, top: 20),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondPage(
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
            ],
          ),
        ),
      ),
    );
  }
}
