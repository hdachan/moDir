import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_data_screen.dart';

//이메일 인증화면
class email_verification_screen extends StatefulWidget {
  @override
  _Main6State createState() => _Main6State();
}

class _Main6State extends State<email_verification_screen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isEmailSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main6'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이메일 입력',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '비밀번호 입력',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text
                    );

                    User? user = userCredential.user;

                    if (user != null) {
                      await user.sendEmailVerification();
                      setState(() {
                        isEmailSent = true;
                      });
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text('인증 메일 보내기'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: isEmailSent ? () async {
                  try {
                    User? user = FirebaseAuth.instance.currentUser;

                    if (user != null) {
                      await user.reload();
                      if (user.emailVerified) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => user_data_screen(email: user.email)));
                      } else {
                        print('Email is not verified');
                      }
                    }
                  } catch (e) {
                    print(e);
                  }
                } : null,
                child: Text('다음'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
