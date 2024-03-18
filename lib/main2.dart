import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Main2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Auth 예제'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('사용자 이름 또는 이메일'),
                accountEmail: Text(FirebaseAuth.instance.currentUser?.email ?? 'UID 없음'),
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.account_circle),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('프로필'),
                onTap: () {
                  // 프로필 버튼을 누르면 발생할 상황 적는 곳
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text('로그인 성공 화면'),
        ),
      ),
    );
  }
}
