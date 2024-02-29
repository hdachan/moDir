import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Main3 extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print('Password Reset Email Sent');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아이디 찾기'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: '이메일 주소 입력',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                sendPasswordResetEmail(emailController.text);
              },
              child: Text('비밀번호 재설정 이메일 보내기'),
            ),
          ],
        ),
      ),
    );
  }
}
