import 'package:flutter/material.dart';
import 'package:showroom_maqueta/config/router/app_router.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  static const String name = 'video_screen';

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late List<String> _mediaUrls;
  late int _currentIndex;

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _mediaUrls = [
      'https://integralfotos.sap.com.uy/nyp/Video-2024-1.mp4',
      '',////
      'https://integralfotos.sap.com.uy/nyp/Video-2024-2.mp4',
      '',////
      'https://integralfotos.sap.com.uy/nyp/Video-2024-3.mp4',
      '',////
      'https://integralfotos.sap.com.uy/nyp/Video-2024-4.mp4',
      '',////
    ];
    _initializeVideo();
  }

  void _initializeVideo() {
    _controller = VideoPlayerController.network(_mediaUrls[_currentIndex])
      ..initialize().then((_) {

        setState(() {});
        
        _controller.setLooping(false);
        _controller.play();
        _controller.addListener(_videoListener);
      });
  }

  void _disposeVideo() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
  }

  void _videoListener() async {
    if (_controller.value.position == _controller.value.duration) {
      _currentIndex++;
      await Future.delayed(const Duration(milliseconds: 500));
        //print('index actual $_currentIndex');
        
        //print('index post ++ $_currentIndex');
        if (_currentIndex >= _mediaUrls.length) {
          _currentIndex = 0;
        }

      setState(() {
        _disposeVideo();
        _initializeVideo();
      });
        
    }
  }

  @override
  void dispose() {
    _disposeVideo();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(

        onTap: () {
          appRouter.pop(context);
        },
        child: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : SizedBox(),
        ),
      ),
    );
  }
}