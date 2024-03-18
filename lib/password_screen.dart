import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//비밀번호 찾기 화면
class password_screen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print('Password Reset Email Sent');
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-email') {
          print('입력하신 이메일 주소가 유효하지 않습니다.');
        } else if (e.code == 'user-not-found') {
          print('해당 이메일 주소를 가진 사용자를 찾을 수 없습니다.');
        } else {
          print('비밀번호 재설정 이메일 전송에 실패하였습니다.');
        }
      } else {
        print('알 수 없는 오류가 발생했습니다: ${e.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 찾기'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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