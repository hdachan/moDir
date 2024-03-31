import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// 연습 파일 업데이트
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
          title: Text('Firestore 게시글 목록'),
        ),
        body: PostsPage(),
      ),
    );
  }
}

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  Future<List<Map<String, dynamic>>> _fetchBoardPosts() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('board')
          .orderBy('timestamp', descending: true)
          .get();

      List<Map<String, dynamic>> posts = querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      return posts;
    } catch (e) {
      print("데이터를 불러오는데 실패했습니다. 오류: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _fetchBoardPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("데이터를 불러오는 중 오류가 발생했습니다."));
        } else if (snapshot.data!.isEmpty) {
          return Center(child: Text("게시글이 없습니다."));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> post = snapshot.data![index];
              return ListTile(
                title: Text(post['title'] ?? '제목 없음'),
                subtitle: Text(post['content'] ?? '내용 없음'),
                // 게시글 작성 시간을 표시합니다. timestamp 형태를 적절히 변환하여 표시해야 합니다.
                // 이 예시에서는 변환 과정을 생략했습니다.
              );
            },
          );
        }
      },
    );
  }
}
