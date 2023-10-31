import 'package:flutter/material.dart';

class LectureJoining extends StatefulWidget {
  final String title;
  const LectureJoining({super.key, required this.title});

  @override
  State<LectureJoining> createState() => _LectureJoiningScreenState();
}

class _LectureJoiningScreenState extends State<LectureJoining> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
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
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_2_outlined,
                color: Colors.grey,
                size: 120.0,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.mic_off),
            label: 'Unmute',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam_off_rounded),
            label: 'Start Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Participants',
          ),
        ],
        backgroundColor: Colors.black12,
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.white70,

      ),
    );
  }
}