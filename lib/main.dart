import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDogzalL_f-tEOiqOrBSfN8Amzc64l_nLw',
      appId: '1:531305378076:android:31a98cc7b8d92f337b4ad9',
      messagingSenderId: '531305378076',
      projectId: 'modir-d8182',
      storageBucket: 'modir-d8182.appspot.com',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  Future<void> signupEmail() async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> loginEmail() async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(title: Text('My App')),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.network('https://i.ibb.co/vXK0dK7/1.png'),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: signupEmail,
                child: Text('Sign up'),
              ),
              ElevatedButton(
                onPressed: loginEmail,
                child: Text('Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
