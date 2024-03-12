import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// 데이터 읽기

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firestore 데이터 불러오기 버튼'),
        ),
        body: Center(
          child: FetchButton(),
        ),
      ),
    );
  }
}

class FetchButton extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; //인스턴스

  // user 컬렉션 정보 전체를 불러오는 코드
  void fetchEverything() async {
    DocumentSnapshot documentSnapshot = await _firestore.collection('users').doc('정보').get();
    if (documentSnapshot.exists) {
      // 전체 문서 데이터 출력
      //print(documentSnapshot.data()); // users컬렉션에 정보 문서안에 있는 모든 코드를 불러오는 작업
      // 특정 필드("hello") 데이터 출력
      print(documentSnapshot.get('hello')); // users컬렉션에 정보 문서안에 hello 데이터를 불러오는 작업
    } else {
      print('문서가 존재하지 않습니다.'); // 만약 그 문서가 없다면 불러오지 않음
    }
  }




  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => fetchEverything(),
          child: Text('사용자 정보 불러오기'),
        ),
      ],
    );
  }
}

