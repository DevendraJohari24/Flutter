import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'Network_gif.dart';
import 'audio_provider.dart';

class MyAudioPlayer extends StatefulWidget {
  @override
  MyAudioPlayerState createState() => MyAudioPlayerState();
}

class MyAudioPlayerState extends State<MyAudioPlayer> {
  static String url =
      'https://codingwithjoe.com/wp-content/uploads/2018/03/applause.mp3';
  bool _isPlaying = false;
  AudioPlayer audioPlayer = AudioPlayer();
  AudioProvider audioProvider = AudioProvider(url);

  playAudioFromLocalPath(path) async {
    int response = await audioPlayer.play(path, isLocal: true);
    if (response == 1) {
    } else {
      String localUrl = await audioProvider.load();
      audioPlayer.play(localUrl, isLocal: true);
      print("ERROR IN PLAYING AUDIO");
    }
  }

  pauseaudio() async {
    int response = await audioPlayer.pause();
    if (response == 1) {
    } else {
      print("ERROR IN PAUSING AUDIO");
    }
  }

  stopaudio() async {
    int response = await audioPlayer.stop();
    if (response == 1) {
    } else {
      print("ERROR IN STOPPING AUDIO");
    }
  }

  resumeaudio() async {
    int response = await audioPlayer.resume();
    if (response == 1) {
    } else {
      print("ERROR IN RESUMING AUDIO");
    }
  }

  Widget build(BuildContext context) {
    String networkimg =
        'https://assets2.ello.co/uploads/asset/attachment/8177198/ello-optimized-06421799.gif';
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: Colors.white,
          ),
          color: Colors.pink[100],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 5,
                      color: Colors.white,
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://www.pinclipart.com/picdir/big/167-1677960_ace-of-spades-card-png-clipart.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                margin: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Center(
                        child: NetworkGiffyDialog(
                          image: Image.network(
                            networkimg,
                            fit: BoxFit.cover,
                          ),
                          title: Text("hello"),
                        ),
                      ),
                      height: 350,
                      width: 350,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            if (_isPlaying == true) {
                              pauseaudio();
                              setState(() {
                                _isPlaying = false;
                              });
                            } else {
                              resumeaudio();
                              setState(() {
                                _isPlaying = true;
                              });
                            }
                          },
                          child:
                              Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                          color:
                              _isPlaying ? Colors.red[100] : Colors.yellow[200],
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                        ),
                        RaisedButton(
                          onPressed: () {
                            stopaudio();
                            setState(() {
                              _isPlaying = false;
                            });
                          },
                          child: Icon(Icons.stop),
                          color: Colors.cyan[100],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.green[100],
                    border: Border.all(
                      width: 4,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () async {
                        var path =
                            await FilePicker.getFilePath(type: FileType.audio);
                        setState(() {
                          if (path != null) {
                            _isPlaying = true;
                          } else {
                            _isPlaying = false;
                          }
                        });
                        playAudioFromLocalPath(path);
                      },
                      child: Text(
                        "Local Audio File",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.lightBlueAccent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
