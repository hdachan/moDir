import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';


// 데이터 쓰기 + 수정

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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Write Example',
      home: FirestoreWriteExample(),
    );
  }
}

class FirestoreWriteExample extends StatefulWidget {
  @override
  _FirestoreWriteExampleState createState() => _FirestoreWriteExampleState();
}

class _FirestoreWriteExampleState extends State<FirestoreWriteExample> {
  // 제목과 내용의 데이터들을 받을 수있는 컨트롤러
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  Future<void> _saveDataToFirestore() async {
    // 데이터들을 저장시킴
    String title = _titleController.text;
    String content = _contentController.text;

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // 'board' 컬렉션의 'abc' 문서에 데이터를 저장합니다.
    await firestore.collection('board').doc('abc').set({
      'title': title, // title 데이터 이름이 없을경우 자동으로 생성됨
      'content': content,
      'timestamp': FieldValue.serverTimestamp(), // 시간 자동으로 불러옴
    });

    // 데이터 저장 후 입력 필드 초기화
    _titleController.clear();
    _contentController.clear();
  }

  Future<void> _loadDataFromFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    DocumentSnapshot documentSnapshot =
        await firestore.collection('board').doc('abc').get();

    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      _titleController.text = data['title'];
      _contentController.text = data['content'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Write Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 제목 입력 필드
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: '제목'),
            ),
            SizedBox(height: 8.0),
            // 내용 입력 필드
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: '내용'),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
            // 저장 버튼
            ElevatedButton(
              onPressed: _saveDataToFirestore,
              child: Text('저장하기'),
            ),
            SizedBox(width: 8.0), // 버튼 간격 조정
            // 수정하기 버튼
            ElevatedButton(
              onPressed: _loadDataFromFirestore,
              child: Text('수정하기'),
            ),
          ],
        ),
      ),
    );
  }
}
