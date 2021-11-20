import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;

  @override
  void initState(){
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _controller.value.isInitialized
          ? GestureDetector(
            onTap:  () {
              setState((){
                _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
              });
            },
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              )
            ),
          )
          : Container()
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState((){
      //       _controller.value.isPlaying
      //         ? _controller.pause()
      //         : _controller.play();
      //     });
      //   },
      //   child: Icon(
      //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow
      //   ),
      // )
    );
  }

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }
}