import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lms/helper/pref.dart';
import 'package:lms/helper/util.dart';
import 'package:lms/screens/attendance_screen.dart';
import 'package:lms/recorded_sessions_screens/ai_ml.dart';
import 'package:lms/recorded_sessions_screens/big_data_analysis.dart';
import 'package:lms/recorded_sessions_screens/defensive_cyber_sec.dart';
import 'package:lms/recorded_sessions_screens/internet_of_things.dart';
import 'package:lms/recorded_sessions_screens/it_project_management.dart';
import 'package:lms/screens/inbox_screen.dart';
import 'package:lms/screens/join_lecture.dart';
import 'package:lms/main.dart';
import 'package:lms/screens/notifications_screen.dart';

import '../my_calendar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.userEmail});

  final String title;
  final String userEmail;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _userName = "";
  String _userEmail = "";

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _openNotificationsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationsScreen(title: 'Notifications',)),
    );
  }

  void _openInboxScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InboxScreen(title: "My Inbox"))
    );
  }

  void _openAttendanceScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AttendanceScreen(title: "Welcome, Tushar"))
    );
  }

  void _logOut() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: "Login")));
  }

  void _openJoinLectureScreen(String t, String ap) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JoinLecture(title: t, avatarPath: ap,))
    );
  }

  Future<void> getUserDataByEmail(String userEmail) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Reference to the "registered_users" collection
    CollectionReference usersCollection = firestore.collection('registered_users');

    try {
      // Query to find the document with the specified email
      QuerySnapshot querySnapshot = await usersCollection.where('userEmail', isEqualTo: userEmail).get();

      // Check if a document was found
      if (querySnapshot.docs.isNotEmpty) {
        // Retrieve the first document (assuming email is unique)
        var userData = querySnapshot.docs.first.data() as Map<String, dynamic>?;

        // Use null-aware operator to handle the possibility of userData being null
        String? storedName = userData?['userName'] as String?;
        String? storedEmail = userData?['userEmail'] as String?;

        setState(() {
          _userName = storedName!;
          _userEmail = storedEmail!;
        });

      } else {
        // Document with the specified email not found
        if (kDebugMode) {
          print('User with email $userEmail not found.');
        }
        Util().showToast('User with email $userEmail not found');
      }
    } catch (error) {
      // Handle any errors that occur during the query
      if (kDebugMode) {
        print('Error retrieving user data: $error');
      }
      Util().showToast('Error retrieving data...');
    }
  }

  @override
  Widget build(BuildContext context) {
    getUserDataByEmail(widget.userEmail);
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color(0xFF004987),//#004987
          leading: IconButton(
            onPressed: () { _openDrawer(); },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ), // This is the menu icon
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  _openNotificationsScreen();
                },
                icon: const Icon(
                  Icons.notifications, color: Colors.white,
                )
            ),
            IconButton(
                onPressed: () {
                  _openInboxScreen();
                },
                icon: const Icon(
                  Icons.inbox, color: Colors.white,
                )
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(_userName),
                accountEmail: Text(_userEmail),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.fiber_manual_record),
                title: const Text('Attendance Records'),
                onTap: () {
                  // Add your navigation logic here
                  _openAttendanceScreen();
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {
                  // Add your navigation logic here
                  await Pref().removePref('remember_me');
                  await Pref().removePref('uid');
                  _logOut();
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(6),
                child: Text(
                  'Master of Computer Applications (Online Mode) JAN, 2022',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),

              Card(
                elevation: 4, // Controls the shadow and depth of the card
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Controls the shape of the card
                color: Colors.white, // Background color of the card
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Image.asset('assets/jain_banner.png')
                    ),
                  ],
                ),
              ),

              Card(
                elevation: 4, // Controls the shadow and depth of the card
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Controls the shape of the card
                color: Colors.white, // Background color of the card
                child: Column(
                  children: <Widget>[
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text('Subjects', style: TextStyle(fontSize: 18),),
                        )
                    ),

                    ListTile(
                      leading: Image.asset('assets/it_project_management.jpg',),
                      title: const Text('4.1 IT Project Management'),
                      subtitle: const Text('21VMT1S401'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ITProjectManagement(title: 'IT Project Management'))
                        );
                      },
                    ),

                    ListTile(
                      leading: Image.asset('assets/ai_ml.jpg',),
                      title: const Text('4.2 Artificial Intelligence and Machine Learning'),
                      subtitle: const Text('21VMT1S402'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const AIML(title: 'Artificial Intelligence and Machine Learning'))
                        );
                      },
                    ),

                    ListTile(
                      leading: Image.asset('assets/dcs.jpg',),
                      title: const Text('4.2 Defensive Cyber Security Technologies'),
                      subtitle: const Text('21VMT7S402'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DefensiveCyberSec(title: 'Defensive Cyber Security Technologies'))
                        );
                      },
                    ),

                    ListTile(
                      leading: Image.asset('assets/bda.jpg',),
                      title: const Text('4.3 Big Data Analytics'),
                      subtitle: const Text('21VMT1S403'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BigDataAnalysis(title: 'Big Data Analytics'))
                        );
                      },
                    ),

                    ListTile(
                      leading: Image.asset('assets/iot.jpg',),
                      title: const Text('4.4 Internet of Things'),
                      subtitle: const Text('21VMT1S404'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const InternetOfThings(title: 'Internet of Things'))
                        );
                      },
                    ),
                  ],
                ),
              ),

              const MyCalendarWidget(),

              Card(
                  elevation: 4, // Controls the shadow and depth of the card
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Controls the shape of the card
                  color: Colors.white, // Background color of the card
                  child: Column(
                    children: <Widget>[
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text('Upcoming', style: TextStyle(fontSize: 18),),
                          )
                      ),

                      ListTile(
                        leading: const Icon(Icons.calendar_month),
                        title: const Text('Big Data Analytics'),
                        subtitle: const Text('4.3 Big Data Analytics'),
                        onTap: () {
                          _openJoinLectureScreen('Big Data Analytics', 'assets/bda.jpg');
                        },
                      ),

                      ListTile(
                        leading: const Icon(Icons.calendar_month),
                        title: const Text('IT Project Management'),
                        subtitle: const Text('4.1 IT Project Management'),
                        onTap: () {
                          _openJoinLectureScreen('IT Project Management', 'assets/it_project_management.jpg');
                        },
                      ),

                      ListTile(
                        leading: const Icon(Icons.calendar_month),
                        title: const Text('Defensive Cyber Security Technologies'),
                        subtitle: const Text('4.2 Defensive Cyber Security Technologies'),
                        onTap: () {
                          _openJoinLectureScreen('Defensive Cyber Security Technologies', 'assets/dcs.jpg');
                        },
                      ),

                      ListTile(
                        leading: const Icon(Icons.calendar_month),
                        title: const Text('Internet of Things'),
                        subtitle: const Text('4.4 Internet of Things'),
                        onTap: () {
                          _openJoinLectureScreen('Internet of Things', 'assets/iot.jpg');
                        },
                      ),
                    ],
                  )
              ),
            ]
          ),
      )
    );
  }
}