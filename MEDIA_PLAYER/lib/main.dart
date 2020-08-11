import 'package:flutter/material.dart';
import 'audio_player.dart';

main() {
  runApp(Music());
}

class Music extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: Icon(Icons.music_note),
          title: Text("AudioFY"),
          actions: <Widget>[
            Icon(Icons.new_releases),
          ],
        ),
        body: MyAudioPlayer(),
        backgroundColor: Colors.amberAccent[100],
      ),
    );
  }
}
