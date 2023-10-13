import 'package:flutter/material.dart';
import 'package:lms/sign_up_screen.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'LMS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Email Id...',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Password...',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: _isObscured,
              ),
            ),

            OutlinedButton(
              onPressed: () {
                login();
              },
              child: const Text('Login IN'),
            ),

            OutlinedButton(
              onPressed: () {
                signUP();
              },
              child: const Text('New here? Register first..'),
            ),

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void login() {
    //Handle login logic
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen(title: 'Home',)),
    );
  }

  void signUP() {
    //Handle signUp logic
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen(title: 'Register',)),
    );
  }
}
