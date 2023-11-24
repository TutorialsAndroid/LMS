import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lms/helper/pref.dart';
import 'package:lms/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.title});

  final String title;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  final TextEditingController _name = TextEditingController();
  final TextEditingController _emailID = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF004987),//#004987
          title: Text(widget.title, style: const TextStyle(color: Colors.white),),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0))
                        ),
                        hintText: 'Enter Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _emailID,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0))
                        ),
                        hintText: 'Enter Email Id...',
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _password,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0))
                        ),
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
                      //Get the name, email and password from input field
                      String name = _name.text;
                      String email = _emailID.text;
                      String password = _password.text;

                      //now proceed to save the data to database
                      saveUserData(name, email, password);
                      // register();
                    },
                    child: const Text('Register'),
                  ),
                ]
            )
        )
    );
  }

  void register(String userEmail) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen(title: 'Master of Computer Applications', userEmail: userEmail,)),
    );
  }

  void saveUserData(String name, String userEmail, String password) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Generate a random UID
    String randomUid = generateRandomUid();

    // Reference to the "registered_users" collection and the random UID
    CollectionReference usersCollection = firestore.collection('registered_users');
    DocumentReference userDoc = usersCollection.doc(randomUid);

    // Save user data to the random UID document
    await userDoc.set({
      'userName': name,
      'userEmail': userEmail,
      'password': password,
    }).then((value) async {
      // This code will be executed if the data is saved successfully
      if (kDebugMode) {
        print('User data saved successfully!');
      }
      await Pref().saveBooleanValue("remember_me", true);
      await Pref().saveStringValue("uid", randomUid);
      await Pref().saveStringValue("userEmail", userEmail);
      register(userEmail);
    }).catchError((error) {
      // This code will be executed if there is an error during the save operation
      if (kDebugMode) {
        print('Error saving user data: $error');
      }
    });

    if (kDebugMode) {
      print('User data saved successfully!');
    }
  }

  String generateRandomUid() {
    // Generate a random UID using the current timestamp and a random number
    Random random = Random();
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    int randomNumber = random.nextInt(999999);
    return '$timestamp$randomNumber';
  }
}