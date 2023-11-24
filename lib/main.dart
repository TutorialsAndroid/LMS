import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lms/helper/util.dart';
import 'package:lms/screens/home_screen.dart';
import 'package:lms/screens/sign_up_screen.dart';

import 'firebase_options.dart';
import 'helper/pref.dart';

void main() async {
  // Disable SSL verification for debug builds only
  if (const bool.fromEnvironment('dart.vm.product')) {
    HttpOverrides.global = MyHttpOverrides();
  }
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // Check the "remember_me" value
    bool? rememberMe = await Pref().getBooleanValue('remember_me') ?? false;
    String? userEmail = await Pref().getStringValue('userEmail') ?? "";
    runApp(MyApp(initialRoute: rememberMe == true ? '/home' : '/login', userEmail: userEmail,));
    // runApp(const MyApp());
  } catch (e) {
    if (kDebugMode) {
      print('Error initializing Firebase: $e');
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  final String userEmail;
  const MyApp({Key? key, required this.initialRoute, required this.userEmail}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Management System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF004987)),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      routes: {
        '/home': (context) => HomeScreen(title: 'Master of Computer Applications', userEmail: userEmail,),
        '/login': (context) => const MyHomePage(title: 'LMS'),
      },
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

  final TextEditingController _emailID = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void login(String userEmail) {
    //Handle login logic
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen(title: 'Master of Computer Applications', userEmail: userEmail,)),
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

  Future<void> getUserDataByEmail(String userEmail, String userPassword) async {
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
        String? storedPassword = userData?['password'] as String?;

        // Now you can use storedPassword and other data as needed
        if (storedPassword != null) {
          if (kDebugMode) {
            print('Email: $userEmail, Password: $storedPassword');
          }
          //Check if user password and stored password in database is correct
          if (storedPassword == userPassword) {
            //add remember me to shared pref so that user doesn't have to login next time
            await Pref().saveBooleanValue("remember_me", true);
            await Pref().saveStringValue('userEmail', userEmail);
            //Password matches
            login(userEmail);
          } else {
            //Password doesn't matches
            Util().showToast('Password was incorrect...');
          }
        } else {
          if (kDebugMode) {
            print('Password is null for user with email $userEmail');
          }
        }
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004987),//#004987
        title: Text(widget.title, style: const TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      'assets/elearning.png',
                      height: 130,
                      width: 130,
                    ),
                  ),

                  const Text(
                    'E-Learning at your\nfingertips...',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
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
                onPressed: () async {
                  //Get the email and password from the input field
                  String email = _emailID.text;
                  String password = _password.text;

                  //Search the email in database and fetch the details
                  getUserDataByEmail(email, password);
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
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
