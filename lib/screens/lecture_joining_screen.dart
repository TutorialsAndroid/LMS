import 'package:flutter/material.dart';

class LectureJoining extends StatefulWidget {
  final String title;
  const LectureJoining({super.key, required this.title});

  @override
  State<LectureJoining> createState() => _LectureJoiningScreenState();
}

class _LectureJoiningScreenState extends State<LectureJoining> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showBottomSheet() {
    _scaffoldKey.currentState?.showBottomSheet( (context) {
        return Container(
          height: 200,
          child: const Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/profile_photo/t.png'), // Provide the path to your image
                            radius: 50, // Set the radius of the circle
                          ),
                        ),

                        SizedBox(width: 10,),

                        Text('Tushar')
                      ],
                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/profile_photo/a.png'), // Provide the path to your image
                            radius: 50, // Set the radius of the circle
                          ),
                        ),

                        SizedBox(width: 10,),

                        Text('Akshay')
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/profile_photo/j.png'), // Provide the path to your image
                            radius: 50, // Set the radius of the circle
                          ),
                        ),

                        SizedBox(width: 10,),

                        Text('Jaydeep')
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/profile_photo/s.png'), // Provide the path to your image
                            radius: 50, // Set the radius of the circle
                          ),
                        ),

                        SizedBox(width: 10,),

                        Text('Surabh')
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/profile_photo/s.png'), // Provide the path to your image
                            radius: 50, // Set the radius of the circle
                          ),
                        ),

                        SizedBox(width: 10,),

                        Text('Sushant')
                      ],
                    ),
                  ),
                ],
              ),
            )
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        items: const [
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
            label: 'Participants 5',
          ),
        ],
        backgroundColor: Colors.black12,
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          if (index == 2) {
            // Show the bottom sheet when the "More" tab is clicked
            _showBottomSheet();
          } else {}
        }
      ),
    );
  }
}