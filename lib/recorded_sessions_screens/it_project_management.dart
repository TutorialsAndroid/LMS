import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lms/screens/video_player_screen.dart';

class ITProjectManagement extends StatefulWidget {
  final String title;

  const ITProjectManagement({super.key, required this.title});

  @override
  State<ITProjectManagement> createState() => _ITProjectManagementScreenState();
}

class _ITProjectManagementScreenState extends State<ITProjectManagement> {

  void _startVideoPlayer(String videoName, String videoURL) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VideoPlayerScreen(title: videoName, videoUrl: videoURL,)),
    );
  }

  Future<void> fetchVideoUrlForLecture(String videoName, String course, String lectureNumber) async {
    try {
      CollectionReference lecturesCollection = FirebaseFirestore.instance
          .collection('recorded_lectures/$course/$lectureNumber');
      try {
        QuerySnapshot querySnapshot = await lecturesCollection.get();

        // Iterate through each document snapshot
        for (var doc in querySnapshot.docs) {
          // Access the data of each document
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          // Check if the document contains the 'video_url' field
          if (data.containsKey('video_url')) {
            // Access the 'video_url' value
            String videoUrl = data['video_url'];

            // Do something with the videoUrl, for example, print it
            if (kDebugMode) {
              print('Video URL: $videoUrl');
            }

            //Launch the video player
            _startVideoPlayer(videoName, videoUrl);
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error fetching data: $e');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004987),//#004987
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add more children here using a loop
            // for (int i = 0; i < 4; i++) // Change the loop condition as needed
          Card(
              elevation: 2,
              color: const Color(0xFF3F93EC),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: Image.asset('assets/it_project_managment/lesson2.jpg'),
                  title: const Text(
                    '1. Foundation of IT Project',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: const Text(
                    'Session: 01',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () async {
                    // Add your logic here
                    await fetchVideoUrlForLecture('Foundation of IT Project', 'it_project_management', 'lecture01');
                  },
                ),
              ),
            ),

            Card(
              elevation: 2,
              color: const Color(0xFF005CAB),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: Image.asset('assets/it_project_managment/lesson3.jpg'),
                  title: const Text('2. Introduction to Software Project Management', style: TextStyle(color: Colors.white),),
                  subtitle: const Text('Session: 02', style: TextStyle(color: Colors.white),),
                  onTap: () async {
                    // Add your logic here
                    await fetchVideoUrlForLecture('Introduction to Software Project Management', 'it_project_management', 'lecture01');
                  },
                ),
              ),
            ),

            Card(
              elevation: 2,
              color: const Color(0xFF0077DB),//#0077DB
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: Image.asset('assets/it_project_managment/lesson4.jpg'),
                  title: const Text('3. Project Evaluation', style: TextStyle(color: Colors.white),),
                  subtitle: const Text('Session: 03',style: TextStyle(color: Colors.white),),
                  onTap: () async {
                    // Add your logic here
                    await fetchVideoUrlForLecture('Project Evaluation', 'it_project_management', 'lecture01');
                  },
                ),
              ),
            ),

            Card(
              elevation: 2,
              color: const Color(0xFF008BFF),//#008BFF
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: Image.asset('assets/it_project_managment/lesson5.jpg'),
                  title: const Text('4. Personnel Planning for Project Management',style: TextStyle(color: Colors.white),),
                  subtitle: const Text('Session: 04',style: TextStyle(color: Colors.white),),
                  onTap: () async {
                    // Add your logic here
                    await fetchVideoUrlForLecture('Personnel Planning for Project Management', 'it_project_management', 'lecture01');
                  },
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}