import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void mine() {
  runApp(newscreen());
}

class newscreen extends StatelessWidget {
  const newscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: Scaffold(
        
        appBar: AppBar(
          title: Center(child: Text("Product Page")),
        ),
        body: VideoApp(),
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : CircularProgressIndicator(),
    );
  }
}