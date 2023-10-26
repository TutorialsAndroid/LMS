import 'dart:math';

import 'package:flutter/material.dart';

class JoinLecture extends StatefulWidget {
  final String title;
  final String avatarPath;

  const JoinLecture({super.key, required this.title, required this.avatarPath});

  @override
  State<JoinLecture> createState() => _JoinLectureScreenState();
}

class _JoinLectureScreenState extends State<JoinLecture> {

  Random random = Random();

  bool isMicEnabled = true; // Initial state
  bool isCameraEnabled = true; //Initial state

  void toggleMic() {
    setState(() {
      isMicEnabled = !isMicEnabled;
    });
  }

  void toggleCamera() {
    setState(() {
      isCameraEnabled = !isCameraEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool randomBool = random.nextBool();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          widget.title,
          style: const TextStyle(
              color: Colors.white
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white, // Change the color here
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.avatarPath), // Provide the path to your image
                radius: 50, // Set the radius of the circle
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                'Class is started join now...',
                style: TextStyle(
                    fontSize: 18
                ),
              ),

              const Text('Total attendance: 65'),

              const SizedBox(
                height: 10,
              ),

              OutlinedButton(
                  onPressed: () {},
                  child: const Text('Join Lecture')
              ),

              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MicButton(
                    onPressed: toggleMic,
                    isMicEnabled: isMicEnabled,
                  ),

                  CameraButton(
                      onPressed: toggleCamera,
                      isCameraEnabled: isCameraEnabled
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MicButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isMicEnabled;

  const MicButton({super.key, required this.onPressed, required this.isMicEnabled});

  @override
  // ignore: library_private_types_in_public_api
  _MicButtonState createState() => _MicButtonState();
}

class _MicButtonState extends State<MicButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: widget.onPressed,
      icon: widget.isMicEnabled ? const Icon(Icons.mic) : const Icon(Icons.mic_off),
    );
  }
}

class CameraButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isCameraEnabled;

  const CameraButton({super.key, required this.onPressed, required this.isCameraEnabled});

  @override
  // ignore: library_private_types_in_public_api
  _CameraButtonState createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: widget.onPressed,
      icon: widget.isCameraEnabled ? const Icon(Icons.videocam) : const Icon(Icons.videocam_off),
    );
  }
}