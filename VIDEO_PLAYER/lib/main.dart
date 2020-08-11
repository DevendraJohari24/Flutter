import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'video_player.dart';

void main() {
  runApp(Video());
}

class Video extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          leading: Icon(
            Icons.music_note,
            color: Colors.black,
          ),
          title: Text(
            "Video Player",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            Icon(Icons.new_releases),
          ],
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/images/image.jpg'),
                  fit: BoxFit.cover)),
          child: Container(
            color: Colors.transparent,
            margin: EdgeInsets.only(top: 50),
            child: VideoApp(),
          ),
        ),
      ),
    );
  }
}
