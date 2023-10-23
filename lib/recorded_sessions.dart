import 'package:flutter/material.dart';

class RecordedSessions extends StatefulWidget {
  final String title;

  const RecordedSessions({super.key, required this.title});

  @override
  State<RecordedSessions> createState() => _RecordedSessionsScreenState();
}

class _RecordedSessionsScreenState extends State<RecordedSessions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
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
            for (int i = 0; i < 4; i++) // Change the loop condition as needed
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListTile(
                      leading: Image.asset('assets/video_player.png'),
                      title: Text(widget.title),
                      subtitle: Text('Session: $i'),
                      onTap: () {
                        // Add your logic here
                      },
                    ),
                  ),
                ),
              ),
          ],

        ),
      )
    );
  }
}