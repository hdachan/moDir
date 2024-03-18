import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main2.dart';

class user_data_screen extends StatelessWidget {
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final String? email;

  user_data_screen({Key? key, this.email}) : super(key: key);

  Future<void> registerUser(String email, String nickname, String birthdate) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc('information').set({
        'email': email,  // 이메일 필드 추가
        'nickname': nickname,
        'birthdate': birthdate,
      });
      print('User registered');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main7'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              '별명과 생년월일을 입력해 주세요',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '생년월일은 8자리 숫자로 입력해 주세요!',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: nicknameController,
              decoration: InputDecoration(
                labelText: '별명 입력',
              ),
            ),
            TextField(
              controller: birthdateController,
              decoration: InputDecoration(
                labelText: '생년월일 입력',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // 사용자 등록 로직
                await registerUser(email!, nicknameController.text, birthdateController.text);

                // Main2 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Main2()),
                );
              },
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}
