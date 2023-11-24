import 'dart:typed_data';
import 'dart:ui';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String title;
  final String videoUrl;
  const VideoPlayerScreen({super.key, required this.title, required this.videoUrl});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  late Uint8List? _thumbnailBytes;

  Future<void> _generateThumbnail() async {
    final uint8list = await VideoThumbnail.thumbnailData(
      video: widget.videoUrl,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128, // Adjust the maxWidth as needed
      quality: 25, // Adjust the quality as needed
    );
    setState(() {
      _thumbnailBytes = uint8list;
    });
  }

  @override
  void initState() {
    // Generate video thumbnail
    // _generateThumbnail();

    // Initialize the controller and load the video
    _controller = VideoPlayerController.network(
      widget.videoUrl,
    );

    // Initialize ChewieController
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
      autoPlay: true,
      looping: true,
      showControls: true
      // You can customize other ChewieController parameters here
    );

    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Chewie(controller: _chewieController),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Play or pause the video when the FloatingActionButton is pressed
      //     setState(() {
      //       if (_controller.value.isPlaying) {
      //         _controller.pause();
      //       } else {
      //         _controller.play();
      //       }
      //     });
      //   },
      //   // Display the correct icon depending on the state of the player
      //   child: Icon(
      //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),
    );
  }
}

class BlurredVideoThumbnail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://firebasestorage.googleapis.com/v0/b/learning-b6db0.appspot.com/o/file_example_MP4_480_1_5MG.mp4?alt=media&token=067caa52-a550-418d-bbf1-8022a4b1a602',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }
}