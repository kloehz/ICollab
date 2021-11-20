import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({ Key? key }) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {

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
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
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
                        ],
                      )
                    ),
                  )
                  : Container(),
              ),
            ),
            VideoProgressIndicator(_controller, allowScrubbing: true),
          ],
        )
      ),
    );
  }

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }
}