import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main2.dart';
import 'main.dart';

class Main5 extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main5'),
        automaticallyImplyLeading: false,
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

                    // 이메일 인증 메일 보내기
                    if (user != null) {
                      await user.sendEmailVerification();
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
                onPressed: () async {
                  try {
                    User? user = FirebaseAuth.instance.currentUser;

                    if (user != null) {
                      // User 상태 업데이트
                      await user.reload();
                      if (user.emailVerified) {
                        // 이메일 인증이 완료되었으면 메인 페이지로 이동
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                      } else {
                        print('Email is not verified');
                      }
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text('다음'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
