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
      body: Center(
        child: SingleChildScrollView(

        ),
      )
    );
  }
}