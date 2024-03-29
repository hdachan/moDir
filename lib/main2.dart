import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


// 성공화면
class Main2 extends StatelessWidget {

  String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  Future<void> _saveDataToFirestore() async {
    // 데이터들을 저장시킴
    String title = _titleController.text;
    String content = _contentController.text;

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // 현재 로그인한 사용자의 UID를 가져옵니다.
    String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

    try {
      // 'board' 컬렉션의 새로운 문서에 데이터를 저장합니다. (문서 ID는 자동으로 생성됩니다.)
      await firestore.collection('board').add({
        'title': title,
        'content': content,
        'authorId': uid, // 사용자 UID 추가
        'timestamp': FieldValue.serverTimestamp(), // 시간 자동으로 불러옴
      });

      // 데이터 저장 후 입력 필드 초기화
      _titleController.clear();
      _contentController.clear();

      // 사용자에게 데이터 저장 성공 알림
      print("데이터가 성공적으로 저장되었습니다."); // 실제 앱에서는 사용자에게 보이는 알림으로 대체
    } catch (e) {
      // 오류 발생 시 사용자에게 알림
      print("데이터 저장에 실패했습니다. 오류: $e"); // 실제 앱에서는 사용자에게 보이는 오류 메시지로 대체
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('글쓰기'),
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
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // 컨텐츠 크기에 맞게 컨테이너 크기 조절
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'title', // 실제 제목 데이터로 대체해야 함
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'content', // 실제 내용 데이터로 대체해야 함
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'uid', // 실제 사용자 UID로 대체해야 함
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 10),
                Text(
                  'time', // 실제 시간 데이터로 대체해야 함
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),




        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                padding: EdgeInsets.all(20),
                height: 300, // 패널의 높이를 조금 더 늘려서 버튼에 공간을 만듭니다.
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Column의 크기를 내용물에 맞게 조절합니다.
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: '필드 1',
                      ),
                    ),
                    TextField(
                      controller: _contentController,
                      decoration: InputDecoration(
                        labelText: '필드 2',
                      ),
                    ),
                    SizedBox(height: 20), // 필드와 버튼 사이의 간격을 추가합니다.
                    Center(
                      child: TextButton(
                        onPressed: () async {
                          await _saveDataToFirestore(); // _saveDataToFirestore 메서드 호출
                          Navigator.pop(context); // 패널을 닫습니다.
                        },
                        child: Text('완료'),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue, // 배경 색상
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Icon(Icons.edit),
        ),




      ),
    );
  }
}
