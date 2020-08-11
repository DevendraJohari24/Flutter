import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    //_controller = VideoPlayerController.network("https://youtu.be/T30_04YPQJk");
    _controller = VideoPlayerController.asset("asset/videos/sample_video.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  /* playvideofromfile(path) {
    _controller = VideoPlayerController.file(path);
    //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    setState(() {
      if (path != null) {
        _controller.play();
      } else {
        _controller.pause();
      }
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(35),
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 5,
                  color: Colors.black,
                )),
                child: _controller.value.initialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller),
                            VideoProgressIndicator(_controller,
                                allowScrubbing: true),
                            Stack(
                              children: <Widget>[
                                AnimatedSwitcher(
                                  duration: Duration(milliseconds: 50),
                                  reverseDuration: Duration(milliseconds: 200),
                                  child: _controller.value.isPlaying
                                      ? SizedBox.shrink()
                                      : Container(
                                          color: Colors.black26,
                                          child: Center(
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Colors.white,
                                              size: 100.0,
                                            ),
                                          ),
                                        ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _controller.value.isPlaying
                                          ? _controller.pause()
                                          : _controller.play();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(
                        child: Text(
                          "Wait Video is Loading!!!!!!!!!!!",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 4,
                    color: Colors.black,
                  ),
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.only(left: 35, right: 35, top: 0),
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.only(left: 12),
                      child: Icon(Icons.dock),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Icon(Icons.dock),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Icon(Icons.dock),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Icon(Icons.dock),
                    ),
                  ],
                ),
              ),
              /* Container(
                child: Center(
                  child: RaisedButton(
                    onPressed: () async {
                      var path =
                          await FilePicker.getFilePath(type: FileType.video);
                      playvideofromfile(path);
                    },
                    child: Text(
                      "Local Video File",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
