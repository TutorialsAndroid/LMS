import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  final String title;

  const InboxScreen({super.key, required this.title});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox, size: 80.0),
            Text('Inbox is empty...', style: TextStyle(fontSize: 18))
          ],
        ),
      ),
    );
  }
}