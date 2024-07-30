import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_qwe/Login.dart';
import 'Change_Password.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'designer_detail_screen.dart';

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
  runApp(MaterialApp(
    home: BottomBar(),
  ));
}

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

// HomePage의 상태 관리 클래스
class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0; // 현재 선택된 인덱스
  final List<Widget> _pages = [
    HomeScreen(),
    DesignerListScreen(),
    BookmarkScreen(),
    MyPageScreen(),
    HelloWorldScreen(),
  ]; // 각 페이지 위젯들

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // 현재 선택된 페이지를 표시
      bottomNavigationBar: Container(
        height: 68, // 높이를 68로 설정
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // 라벨 항상 표시
          currentIndex: _currentIndex,
          // 현재 선택된 인덱스
          onTap: (index) {
            setState(() {
              _currentIndex = index; // 인덱스 변경 시 상태 갱신
            });
          },
          selectedItemColor: Color(0xFF3D3D3D),
          // 선택된 아이템 색상
          unselectedItemColor: Color(0xFF3D3D3D),
          // 선택되지 않은 아이템 색상
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? Icon(Icons.home)
                  : Icon(Icons.home_outlined), // 홈 아이콘 변경
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? Icon(Icons.featured_play_list)
                  : Icon(Icons.featured_play_list_outlined), // 기능 아이콘 변경
              label: '기능',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? Icon(Icons.bookmark)
                  : Icon(Icons.bookmark_outline), // 북마크 아이콘 변경
              label: '북마크',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 3
                  ? Icon(Icons.person)
                  : Icon(Icons.person_outline), // 마이페이지 아이콘 변경
              label: '마이페이지',
            ),
            BottomNavigationBarItem(
              icon: _currentIndex == 4
                  ? Icon(Icons.emoji_emotions)
                  : Icon(Icons.emoji_emotions_outlined), // 헬로월드 아이콘 변경
              label: '헬로월드',
            ),
          ],
        ),
      ),
    );
  }
}

//홈 >> 메인 / 커뮤니티 / 매거진
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(96.0), // AppBar 높이를 96으로 설정 (탭바 높이 포함)
          child: AppBar(
            automaticallyImplyLeading: false, // 기본 leading 아이콘 제거
            flexibleSpace: SizedBox(
              width: 360,
              height: 48,
              child: Stack(
                children: [
                  Positioned(
                    top: 14,
                    left: 12,
                    child: Image.asset(
                      'assets/image/logo_primary.png', // 실제 로고 이미지
                      width: 96,
                      height: 19,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.search,
                            size: 24,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.notifications,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(44), // TabBar 높이
              child: Column(
                children: const [
                  TabBar(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          height: 14,
                          width: 26,
                          child: Text(
                            '메인',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w400,
                                height: 1,
                                letterSpacing: -0.35),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          height: 14,
                          width: 51,
                          child: Text(
                            '커뮤니티',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w400,
                                height: 1,
                                letterSpacing: -0.35),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          height: 14,
                          width: 38,
                          child: Text(
                            '매거진',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w400,
                                height: 1,
                                letterSpacing: -0.35),
                          ),
                        ),
                      ),
                    ],
                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.only(top: 12),
                    labelPadding: EdgeInsets.only(left: 6, right: 6),
                  ),
                  Divider(
                    // 구분선 추가
                    color: Color(0xFFE3E3E3), // 구분선 색상 변경
                    height: 1.0,
                    thickness: 1.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('메인 화면 내용')),
            CommunityTab(),
            Center(child: Text('매거진 화면 내용')),
          ],
        ),
      ),
    );
  }
}

// 홈 >> 커뮤니티
class CommunityTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!.docs.map((document) {
              var data = document.data() as Map<String, dynamic>?;
              String imageUrl = (data != null && data['imageUrl'] != null)
                  ? data['imageUrl'] as String
                  : '';

              return FutureBuilder(
                future: Future.wait([
                  document.reference.collection('likes').get(),
                  document.reference.collection('comments').get(),
                ]),
                builder: (context,
                    AsyncSnapshot<List<QuerySnapshot>> countsSnapshot) {
                  if (!countsSnapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  int likesCount = countsSnapshot.data![0].docs.length;
                  int commentsCount = countsSnapshot.data![1].docs.length;

                  return ListTile(
                    title: Text(data?['title'] ?? '제목 없음'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data?['content'] ?? '내용 없음'),
                        if (imageUrl.isNotEmpty)
                          Image.network(
                            imageUrl,
                            width: 100, // 원하는 너비 지정
                            height: 100, // 원하는 높이 지정
                            fit: BoxFit.cover, // 이미지 비율 유지하며 크기 조절
                          ),
                        Text(
                          DateFormat('yyyy-MM-dd – kk:mm').format(
                            (data?['timestamp'] as Timestamp).toDate(),
                          ),
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.red, size: 16),
                            SizedBox(width: 4),
                            Text('$likesCount'),
                            SizedBox(width: 16),
                            Icon(Icons.comment, color: Colors.grey, size: 16),
                            SizedBox(width: 4),
                            Text('$commentsCount'),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetail(post: document),
                        ),
                      );
                    },
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

//글쓰기 버튼을 눌렀을때 나오는 탭
class NewPostDialog extends StatefulWidget {
  @override
  _NewPostDialogState createState() => _NewPostDialogState();
}

class _NewPostDialogState extends State<NewPostDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  File? _image;
  bool _isUploading = false;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadImage(File image) async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('posts/${DateTime.now().millisecondsSinceEpoch}.jpg');
      final uploadTask = storageRef.putFile(image);
      final snapshot = await uploadTask;

      if (snapshot.state == TaskState.success) {
        final downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> _savePost() async {
    setState(() {
      _isUploading = true;
    });

    String? imageUrl;
    if (_image != null) {
      imageUrl = await _uploadImage(_image!);
    }

    if (imageUrl != null || _image == null) {
      await FirebaseFirestore.instance.collection('posts').add({
        'title': titleController.text,
        'content': contentController.text,
        'imageUrl': imageUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }

    setState(() {
      _isUploading = false;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('새 글 작성'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: '제목'),
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: '내용'),
            ),
            SizedBox(height: 10),
            _image == null ? Text('이미지가 선택되지 않았습니다.') : Image.file(_image!),
            TextButton(
              onPressed: _pickImage,
              child: Text('갤러리에서 사진 선택'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('취소'),
        ),
        TextButton(
          onPressed: _isUploading ? null : _savePost,
          child: _isUploading ? CircularProgressIndicator() : Text('저장'),
        ),
      ],
    );
  }
}

//포스터를 눌렀을때 나오는 화면
class PostDetail extends StatefulWidget {
  final DocumentSnapshot post;

  PostDetail({required this.post});

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  late Map<String, dynamic> data;
  String imageUrl = '';
  bool isLiked = false;
  int likesCount = 0;
  User? currentUser;
  List<String> likedEmails = [];
  List<Map<String, dynamic>> comments = [];
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    data = widget.post.data() as Map<String, dynamic>;
    imageUrl = data['imageUrl'] ?? '';
    likesCount = data['likesCount'] ?? 0;
    currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      checkIfLiked();
      fetchLikedEmails();
    }
    fetchComments();
  }

  void checkIfLiked() async {
    DocumentSnapshot userLikeDoc = await widget.post.reference
        .collection('likes')
        .doc(currentUser!.uid)
        .get();

    setState(() {
      isLiked = userLikeDoc.exists;
    });
  }

  void fetchLikedEmails() async {
    QuerySnapshot likesSnapshot =
        await widget.post.reference.collection('likes').get();

    setState(() {
      likedEmails =
          likesSnapshot.docs.map((doc) => doc['email'] as String).toList();
    });
  }

  void fetchComments() async {
    QuerySnapshot commentsSnapshot = await widget.post.reference
        .collection('comments')
        .orderBy('timestamp', descending: true)
        .get();

    setState(() {
      comments = commentsSnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  void addComment() async {
    if (currentUser == null || commentController.text.isEmpty) return;

    DocumentReference commentRef =
        widget.post.reference.collection('comments').doc();

    await commentRef.set({
      'content': commentController.text,
      'author': currentUser!.email,
      'timestamp': FieldValue.serverTimestamp(),
    });

    commentController.clear();
    fetchComments();
  }

  void toggleLike() async {
    if (currentUser == null) return;

    DocumentReference likeRef =
        widget.post.reference.collection('likes').doc(currentUser!.uid);

    if (isLiked) {
      await likeRef.delete();
      setState(() {
        isLiked = false;
        likesCount--;
        likedEmails.remove(currentUser!.email);
      });
    } else {
      await likeRef.set({
        'likedAt': FieldValue.serverTimestamp(),
        'email': currentUser!.email,
      });
      setState(() {
        isLiked = true;
        likesCount++;
        likedEmails.add(currentUser!.email!);
      });
    }

    widget.post.reference.update({'likesCount': likesCount});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title'] ?? '제목 없음'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['title'] ?? '제목 없음',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              DateFormat('yyyy-MM-dd – kk:mm').format(
                (data['timestamp'] as Timestamp).toDate(),
              ),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 8),
            if (imageUrl.isNotEmpty)
              Image.network(
                imageUrl,
                width: 300, // 원하는 너비 설정
                height: 300, // 원하는 높이 설정
                fit: BoxFit.cover, // 이미지가 지정된 크기에 맞게 조정되도록 설정
              ),
            SizedBox(height: 8),
            Text(data['content'] ?? '내용 없음'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: toggleLike,
                    ),
                    Text('좋아요: $likesCount'),
                  ],
                ),
                Text('댓글: ${comments.length}'),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return ListTile(
                    title: Text(comment['content']),
                    subtitle: Text(comment['author']),
                    trailing: Text(
                      DateFormat('yyyy-MM-dd – kk:mm').format(
                        (comment['timestamp'] as Timestamp).toDate(),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextField(
              controller: commentController,
              decoration: InputDecoration(
                labelText: '댓글 입력',
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: addComment,
              child: Text('댓글 달기'),
            ),
          ],
        ),
      ),
    );
  }
}

// 글을 클릭했을때 나오는 위젯
class PostClick extends StatefulWidget {
  final DocumentSnapshot post;

  PostClick({required this.post});

  @override
  _PostClickState createState() => _PostClickState();
}

class _PostClickState extends State<PostClick> {
  late Map<String, dynamic> data;
  String imageUrl = '';
  bool isLiked = false;
  int likesCount = 0;
  User? currentUser;

  @override
  void initState() {
    super.initState();
    data = widget.post.data() as Map<String, dynamic>;
    imageUrl = data['imageUrl'] ?? '';
    likesCount = data['likesCount'] ?? 0;
    currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      checkIfLiked();
    }
  }

  void checkIfLiked() async {
    DocumentSnapshot userLikeDoc = await widget.post.reference
        .collection('likes')
        .doc(currentUser!.uid)
        .get();

    setState(() {
      isLiked = userLikeDoc.exists;
    });
  }

  void toggleLike() async {
    if (currentUser == null) return;

    DocumentReference likeRef =
        widget.post.reference.collection('likes').doc(currentUser!.uid);

    if (isLiked) {
      await likeRef.delete();
      setState(() {
        isLiked = false;
        likesCount--;
      });
    } else {
      await likeRef.set({
        'likedAt': FieldValue.serverTimestamp(),
        'email': currentUser!.email,
        'postId': widget.post.id,
      });
      setState(() {
        isLiked = true;
        likesCount++;
      });
    }

    widget.post.reference.update({'likesCount': likesCount});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title'] ?? '제목 없음'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['title'] ?? '제목 없음',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              DateFormat('yyyy-MM-dd – kk:mm').format(
                (data['timestamp'] as Timestamp).toDate(),
              ),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 8),
            if (imageUrl.isNotEmpty) Image.network(imageUrl),
            SizedBox(height: 8),
            Text(data['content'] ?? '내용 없음'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: toggleLike,
                    ),
                    Text('좋아요: $likesCount'),
                  ],
                ),
                Text('댓글: ${data['commentsCount'] ?? 0}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 이거는 기능만들어놓은거니까 원담이 이거 만지면안된데이 이거 가만히 나두고 북마크에 해야됨
class DesignerListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 기본 leading 아이콘 제거
        flexibleSpace: Container(
          width: 360,
          height: 48,
          child: Stack(
            children: [
              Positioned(
                top: 14,
                left: 12,
                child: Image.asset(
                  'assets/image/logo_primary.png', // 실제 로고 이미지
                  width: 95,
                  height: 19,
                ),
              ),
              Positioned(
                right: 0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.search,
                        size: 24,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.notifications,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 헬로 월드(홈화면) 옮기기 전
class HelloWorldScreen extends StatelessWidget {
  int _selectedIndex = 0;
  int _selectedIndex2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          width: 360,
          height: 48,
          child: Stack(
            children: [
              Positioned(
                top: 14,
                left: 12,
                child: Image.asset(
                  'assets/image/logo_modi.png',
                  width: 34,
                  height: 20,
                ),
              ),
              Positioned(
                right: 0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.search, size: 24),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.notifications, size: 24),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  // 중간 패널
                  width: 360,
                  //decoration: BoxDecoration(color: Colors.red),
                  child: Column(
                    // 빨간색 박스 안에 Column 추가
                    children: [
                      Container(
                        // 포스터 화면 제일 후 순위(패키지 쓸 것)
                        height: 420,
                        width: 360,
                        //decoration: BoxDecoration(color: Colors.blue),
                        child: Image.asset(
                          'assets/image/carousel_home.png', // 실제 이미지 경로로 수정
                          fit: BoxFit.cover, // 이미지를 컨테이너에 맞게 조정
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        // 왼쪽, 오른쪽 16, 위아래 12 패딩
                        height: 42,
                        width: 360,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Align(
                          // 텍스트를 왼쪽에 정렬
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '첫 디자이너 상담은 무료!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                              letterSpacing: -0.35,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 240,
                        width: 360,
                        decoration: BoxDecoration(color: Colors.white),
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 16,
                          right: 16,
                          bottom: 24,
                        ),
                        child: Center(
                          // 내부 컨테이너들을 중앙에 배치
                          child: Column(
                            // Column 사용
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 94,
                                width: 328,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Row(
                                  // 수평으로 배치하기 위해 Row 사용
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 94,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.transparent,
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFB4B4B4),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            Container(
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: Colors.white)),
                                            Container(
                                              width: 70,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Text('디자이너 찾기',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF3D3D3D),
                                                    fontSize: 12,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3,
                                                    letterSpacing: -0.3,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    SizedBox(
                                      width: 70,
                                      height: 94,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.transparent,
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFB4B4B4),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            Container(
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: Colors.white)),
                                            Container(
                                              width: 70,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Text('찜 목록',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF3D3D3D),
                                                    fontSize: 12,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3,
                                                    letterSpacing: -0.3,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Container(
                                      width: 70,
                                      height: 94,
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.transparent,
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFB4B4B4),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            Container(
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: Colors.white)),
                                            Container(
                                              width: 70,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Text('매거진',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF3D3D3D),
                                                    fontSize: 12,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3,
                                                    letterSpacing: -0.3,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    SizedBox(
                                      width: 70,
                                      height: 94,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.transparent,
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFB4B4B4),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            Container(
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: Colors.white)),
                                            Container(
                                              width: 70,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Text('커뮤니티',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF3D3D3D),
                                                    fontSize: 12,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3,
                                                    letterSpacing: -0.3,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    // 마지막 박스는 패딩 없이 추가
                                  ],
                                ),
                              ),

                              SizedBox(height: 12), // 두 컨테이너 사이의 간격
                              Container(
                                height: 94,
                                width: 328,
                                decoration: BoxDecoration(color: Colors.white),
                                // 두 번째 내부 컨테이너 색상
                                child: Row(
                                  // 수평으로 배치하기 위해 Row 사용
                                  children: [
                                    SizedBox(
                                      width: 70,
                                      height: 94,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.transparent,
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFB4B4B4),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            Container(
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: Colors.white)),
                                            Container(
                                              width: 70,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Text('견적서 보기',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF3D3D3D),
                                                    fontSize: 12,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3,
                                                    letterSpacing: -0.3,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    SizedBox(
                                      width: 70,
                                      height: 94,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.transparent,
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFB4B4B4),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            Container(
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: Colors.white)),
                                            Container(
                                              width: 70,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Text('프로필 작성',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF3D3D3D),
                                                    fontSize: 12,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3,
                                                    letterSpacing: -0.3,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    SizedBox(
                                      width: 70,
                                      height: 94,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.transparent,
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFB4B4B4),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            Container(
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: Colors.white)),
                                            Container(
                                              width: 70,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Text('이벤트',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF3D3D3D),
                                                    fontSize: 12,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3,
                                                    letterSpacing: -0.3,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    SizedBox(
                                      width: 70,
                                      height: 94,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.transparent,
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFB4B4B4),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            Container(
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: Colors.white)),
                                            Container(
                                              width: 70,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Text('쿠폰',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF3D3D3D),
                                                    fontSize: 12,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3,
                                                    letterSpacing: -0.3,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    // 마지막 박스는 패딩 없이 추가
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 60,
                        width: 360,
                        decoration: BoxDecoration(color: Colors.white),
                        padding: EdgeInsets.only(
                            top: 24, bottom: 12, left: 12, right: 12),
                        child: Row(
                          // 수평으로 배치하기 위해 Row 사용
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // 양쪽 끝으로 배치
                          children: [
                            Text(
                              '많이 찾는 디자이너',
                              style: TextStyle(
                                color: Color(0xFF3D3D3D),
                                fontSize: 20,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                                letterSpacing: -0.50, // 기존 글자 간격
                              ),
                            ),
                            SizedBox(
                              width: 54,
                              height: 24,
                              child: MaterialButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                child: Row(
                                  children: [
                                    Text(
                                      '더보기',
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                        letterSpacing: -0.35, // 글자 간격 변경
                                      ),
                                    ),
                                    SizedBox(width: 2), // 텍스트와 화살표 사이의 간격
                                    Container(
                                      width: 16,
                                      height: 16,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage(
                                            'assets/image/arrow_forward.png'),
                                        fit: BoxFit.cover,
                                      )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 46,
                        width: 360,
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        decoration: BoxDecoration(color: Colors.white),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildButton(0, '전체'),
                              SizedBox(width: 8),
                              _buildButton(1, '빈티지'),
                              SizedBox(width: 8),
                              _buildButton(2, '포멀'),
                              SizedBox(width: 8),
                              _buildButton(3, '캐주얼'),
                              SizedBox(width: 8),
                              _buildButton(4, '댄디'),
                              SizedBox(width: 8),
                              _buildButton(5, '스트릿'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 295,
                        width: 360,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        height: 82,
                        width: 360,
                        decoration: BoxDecoration(color: Colors.white),
                        padding: EdgeInsets.only(
                            top: 24, bottom: 12, left: 12, right: 12),
                        child: Column(
                          children: [
                            Row(
                              // 수평으로 배치하기 위해 Row 사용
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // 양쪽 끝으로 배치
                              children: [
                                Text(
                                  '계절 별 코디',
                                  style: TextStyle(
                                    color: Color(0xFF3D3D3D),
                                    fontSize: 20,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 1.2,
                                    letterSpacing: -0.50, // 기존 글자 간격
                                  ),
                                ),
                                SizedBox(
                                  width: 54,
                                  height: 24,
                                  child: MaterialButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    child: Row(
                                      children: [
                                        Text(
                                          '더보기',
                                          style: TextStyle(
                                            color: Color(0xFF888888),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.3,
                                            letterSpacing: -0.35, // 글자 간격 변경
                                          ),
                                        ),
                                        SizedBox(width: 2), // 텍스트와 화살표 사이의 간격
                                        Container(
                                          width: 16,
                                          height: 16,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 4),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/image/arrow_forward.png'),
                                            fit: BoxFit.cover,
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '회원님의 마음에 맞는 사진을 골라보세요',
                                style: TextStyle(
                                  color: Color(0xFF888888),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 46,
                        width: 360,
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        decoration: BoxDecoration(color: Colors.white),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildButton2(0, '전체'),
                              SizedBox(width: 8),
                              _buildButton2(1, '빈티지'),
                              SizedBox(width: 8),
                              _buildButton2(2, '포멀'),
                              SizedBox(width: 8),
                              _buildButton2(3, '캐주얼'),
                              SizedBox(width: 8),
                              _buildButton2(4, '댄디'),
                              SizedBox(width: 8),
                              _buildButton2(5, '스트릿'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 336,
                        width: 360,
                        decoration: BoxDecoration(color: Colors.black),
                      ),
                      Container(
                        height: 82,
                        width: 360,
                        decoration: BoxDecoration(color: Colors.white),
                        padding: EdgeInsets.only(
                            top: 24, bottom: 12, left: 12, right: 12),
                        child: Column(
                          children: [
                            Row(
                              // 수평으로 배치하기 위해 Row 사용
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // 양쪽 끝으로 배치
                              children: [
                                Text(
                                  "디자이너's 코디",
                                  style: TextStyle(
                                    color: Color(0xFF3D3D3D),
                                    fontSize: 20,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 1.2,
                                    letterSpacing: -0.50, // 기존 글자 간격
                                  ),
                                ),
                                SizedBox(
                                  width: 54,
                                  height: 24,
                                  child: MaterialButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    child: Row(
                                      children: [
                                        Text(
                                          '더보기',
                                          style: TextStyle(
                                            color: Color(0xFF888888),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.3,
                                            letterSpacing: -0.35, // 글자 간격 변경
                                          ),
                                        ),
                                        SizedBox(width: 2), // 텍스트와 화살표 사이의 간격
                                        Container(
                                          width: 16,
                                          height: 16,
                                          padding:
                                              EdgeInsets.symmetric(vertical: 4),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/image/arrow_forward.png'),
                                            fit: BoxFit.cover,
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '디자이너가 코디한 옷들을 살펴보세요',
                                style: TextStyle(
                                  color: Color(0xFF888888),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 424,
                        width: 360,
                        decoration: BoxDecoration(color: Colors.lightGreen),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: 360,
                        padding: const EdgeInsets.only(
                          top: 24,
                          left: 16,
                          right: 16,
                          bottom: 48,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 28,
                                  height: 16,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/logo_modi.png'),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '(주)모디랑',
                                  style: TextStyle(
                                    color: Color(0xFF3D3D3D),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 1.3,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Container(
                              width: 328,
                              height: 178,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: Color(0xFFE7E7E7), width: 1)),
                              child: Column(
                                children: const [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '대표이사  :  황대찬  |  사업자등록번호  :  123-45-67891',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 11,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                        letterSpacing: -0.28,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '주소  :  경북 경산시 하양읍 문화로4길 18-15 샹그릴라A 306호',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 11,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                        letterSpacing: -0.28,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '전화번호  :  010-3009-5596',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 11,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                        letterSpacing: -0.28,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '이메일 주소  :  holyhabits915@gmail.com',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 11,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                        letterSpacing: -0.28,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '호스팅서비스제공자  :  (주)모디랑',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 11,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                        letterSpacing: -0.28,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '통신판매업신고  :  2024-대구경북-00336호',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 11,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                        letterSpacing: -0.28,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero),
                                  child: Text(
                                    "사업자정보확인",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF5D5D5D),
                                      fontSize: 11,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                      letterSpacing: -0.28,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  width: 1,
                                  height: 11,
                                  decoration:
                                      BoxDecoration(color: Color(0xFF5D5D5D)),
                                ),
                                SizedBox(width: 4),
                                TextButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero),
                                  child: Text(
                                    "전자금융거래이용약관",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF5D5D5D),
                                      fontSize: 11,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                      letterSpacing: -0.28,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  width: 1,
                                  height: 11,
                                  decoration:
                                      BoxDecoration(color: Color(0xFF5D5D5D)),
                                ),
                                SizedBox(width: 4),
                                TextButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero),
                                  child: Text(
                                    "전자금융거래이용약관",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF5114FF),
                                      fontSize: 11,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                      letterSpacing: -0.28,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero),
                                  child: Text(
                                    "리뷰운영정책",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF5D5D5D),
                                      fontSize: 11,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                      letterSpacing: -0.28,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  width: 1,
                                  height: 11,
                                  decoration:
                                      BoxDecoration(color: Color(0xFF5D5D5D)),
                                ),
                                SizedBox(width: 4),
                                TextButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero),
                                  child: Text(
                                    "데이터제공정책",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF5D5D5D),
                                      fontSize: 11,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                      letterSpacing: -0.28,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  width: 1,
                                  height: 11,
                                  decoration:
                                      BoxDecoration(color: Color(0xFF5D5D5D)),
                                ),
                                SizedBox(width: 4),
                                TextButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero),
                                  child: Text(
                                    "소비자분쟁해결기준",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF5D5D5D),
                                      fontSize: 11,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                      letterSpacing: -0.28,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Container(
                                  width: 164,
                                  height: 84,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(4),
                                          topLeft: Radius.circular(4)),
                                      border: Border.all(
                                          color: Color(0xFFE7E7E7), width: 1)),
                                  child: Column(
                                    children: const [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '고객센터(대표)',
                                          style: TextStyle(
                                            color: Color(0xFF5D5D5D),
                                            fontSize: 11,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.3,
                                            letterSpacing: -0.28,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '010-3009-5596',
                                          style: TextStyle(
                                            color: Color(0xFF5D5D5D),
                                            fontSize: 11,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.3,
                                            letterSpacing: -0.28,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '24시간 운영, 연중무휴',
                                          style: TextStyle(
                                            color: Color(0xFF5D5D5D),
                                            fontSize: 11,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.3,
                                            letterSpacing: -0.28,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 164,
                                  height: 84,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(4),
                                          topRight: Radius.circular(4)),
                                      border: Border(
                                          top: BorderSide(
                                              color: Color(0xFFE7E7E7),
                                              width: 1),
                                          bottom: BorderSide(
                                              color: Color(0xFFE7E7E7),
                                              width: 1),
                                          right: BorderSide(
                                              color: Color(0xFFE7E7E7),
                                              width: 1))),
                                  child: Column(
                                    children: const [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '고객센터',
                                          style: TextStyle(
                                            color: Color(0xFF5D5D5D),
                                            fontSize: 11,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.3,
                                            letterSpacing: -0.28,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '010-4172-4515',
                                          style: TextStyle(
                                            color: Color(0xFF5D5D5D),
                                            fontSize: 11,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.3,
                                            letterSpacing: -0.28,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '오전 09:00 ~ 익일 18:00',
                                          style: TextStyle(
                                            color: Color(0xFF5D5D5D),
                                            fontSize: 11,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.3,
                                            letterSpacing: -0.28,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '(주)모디랑은 통신판매중개자로 거래 당사자가 아니므로, 판매자가 등록한 \n상품정보 및 거래 등에 대해 책임을 지지 않습니다. \n단, (주)모디랑이 판매자로 등록 판매한 상품은 판매자로서 책임을 부담합니다.',
                                style: TextStyle(
                                  color: Color(0xFF5D5D5D),
                                  fontSize: 11,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  letterSpacing: -0.28,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(int index, String text) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () { // 1번 satstate 추가 할 곳 - 대차이 여기 임(아래랑 비교 해보쇼)
        _selectedIndex = index;
        print('$text 버튼 클릭됨!');
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3D3D3D) : Colors.transparent,
          border: isSelected
              ? null
              : Border.all(width: 1, color: Color(0xFFE7E7E7)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: SizedBox(
          height: 14,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 1,
                letterSpacing: -0.35,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton2(int index2, String text2) {
    bool isSelected2 = _selectedIndex2 == index2;
    return InkWell(
      onTap: () { // 2번 satstate 추가 할 곳 - 대차이 여기 임(아래랑 비교 해보쇼)
        _selectedIndex2 = index2;
        print('$text2 버튼 클릭됨!');
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected2 ? Color(0xFF3D3D3D) : Colors.transparent,
          border: isSelected2
              ? null
              : Border.all(width: 1, color: Color(0xFFE7E7E7)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: SizedBox(
          height: 14,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text2,
              style: TextStyle(
                color: isSelected2 ? Colors.white : Colors.black,
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 1,
                letterSpacing: -0.35,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 북마크 화면 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<여기가 디자이너 화면만드는중
class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            width: 360,
            height: 48,
            child: Stack(
              children: [
                Positioned(
                  top: 14,
                  left: 12,
                  child: Image.asset(
                    'assets/image/logo_modi.png',
                    width: 34,
                    height: 20,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.search, size: 24),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.notifications, size: 24),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 428,
                    child: Column(
                      children: [
                        Container(
                          height: 56,
                          width: 428,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 12, bottom: 12),
                            child: Row(
                              children: [
                                _buildButton(0, '전체', 48),
                                SizedBox(width: 8),
                                _buildButton(1, '인기순', 78),
                                SizedBox(width: 8),
                                _buildButton(2, '분야', 66),
                                SizedBox(width: 8),
                                _buildButton(3, '성별', 66),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 428,
                          child: _buildListView(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(int index, String text, double width) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print('$text 버튼 클릭됨!');
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        width: width,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3D3D3D) : Colors.transparent,
          border: isSelected
              ? null
              : Border.all(width: 1, color: Color(0xFFE7E7E7)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1,
                  letterSpacing: -0.35,
                ),
              ),
              if (index > 0) ...[
                SizedBox(width: 2),
                Icon(
                  Icons.arrow_drop_down,
                  color: isSelected ? Colors.white : Colors.black,
                  size: 16,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> _names = [];
  List<String> _introductions = []; // introduction 리스트 추가
  List<String> classification = []; // classification 리스트 추가
  List<String> _prices = []; // 가격 리스트 추가
  List<String> _imageUrls = []; // imageUrl 리스트 추가
  List<String> _designerIds = [];

  @override
  void initState() {
    super.initState();
    _fetchDesignerData(); // 함수 이름 변경
  }

  Future<void> _fetchDesignerData() async {
    QuerySnapshot snapshot = await _firestore.collection('designer').get();
    setState(() {
      _designerIds = snapshot.docs.map((doc) => doc.id).toList(); // 새로 추가된 부분
      _names = snapshot.docs.map((doc) => doc['name'] as String).toList();
      _introductions =
          snapshot.docs.map((doc) => doc['introduction'] as String).toList();
      classification =
          snapshot.docs.map((doc) => doc['classification'] as String).toList();
      _prices = snapshot.docs.map((doc) => doc['price'].toString()).toList();
      _imageUrls =
          snapshot.docs.map((doc) => doc['imageUrl'] as String).toList();
    });
  }

  Widget _buildListView() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xFFE7E7E7),
          ),
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: _names.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            // 클릭 이벤트 추가
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DesignerDetailScreen(
                    designerId: _designerIds[index],
                    // 새로 추가된 부분
                    name: _names[index],
                    introduction: _introductions[index],
                    classification: classification[index],
                    price: _prices[index],
                    imageUrl: _imageUrls[index],
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.zero,
              ),
              height: 128,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    margin: EdgeInsets.only(right: 16.0, left: 16.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(_imageUrls[index]), // imageUrl 사용
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _names[index], // Firestore에서 가져온 이름
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            letterSpacing: -0.35,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${_introductions[index]}', // introduction 필드를 사용
                          style: TextStyle(
                            color: Color(0xFF5D5D5D),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            letterSpacing: -0.30,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, size: 14, color: Colors.yellow),
                            SizedBox(width: 4),
                            Text(
                              '4.9',
                              style: TextStyle(
                                color: Color(0xFF5D5D5D),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                                letterSpacing: -0.30,
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              '(99+)',
                              style: TextStyle(
                                color: Color(0xFF5D5D5D),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                                letterSpacing: -0.30,
                              ),
                            ),
                            SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: 12,
                              decoration:
                                  BoxDecoration(color: Color(0xFF888888)),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '${classification[index]}',
                              // classification 필드를 사용
                              style: TextStyle(
                                color: Color(0xFF5D5D5D),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '${_prices[index]}', // 가격을 표시
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                                height: 1.3,
                                letterSpacing: -0.35,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '원',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                                letterSpacing: -0.35,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// 마이페이지 화면 위젯
class MyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          width: 360,
          height: 48,
          child: Stack(
            children: [
              Positioned(
                top: 14,
                left: 12,
                child: Image.asset(
                  'assets/image/logo_primary.png', // 실제 로고 이미지
                  width: 95,
                  height: 19,
                ),
              ),
              Positioned(
                right: 0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.search,
                        size: 24,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.notifications,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0xFFE7E7E7),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/image/back_icon.png'),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '설정',
                        style: TextStyle(
                          color: Color(0xFF3D3D3D),
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                          letterSpacing: -0.45,
                        ),
                      ),
                      SizedBox(width: 24), // Placeholder to balance the row
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 48,
                      padding: EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFFF6F6F6),
                      ),
                      child: Text(
                        '계정',
                        style: TextStyle(
                          color: Color(0xFF3D3D3D),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.0,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      height: 48,
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '내 정보 변경',
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.0,
                              letterSpacing: -0.40,
                            ),
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/next_line_S.png'))),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePassword()),
                        );
                      },
                      height: 48,
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '비밀번호 변경',
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.0,
                              letterSpacing: -0.40,
                            ),
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/next_line_S.png'))),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '알림 푸시 설정',
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.0,
                              letterSpacing: -0.40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        // 로그아웃 후 이동할 화면
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()), // BottomBar로 이동
                        );
                      },
                      height: 48,
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '로그아웃',
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.0,
                              letterSpacing: -0.40,
                            ),
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/image/logout_line_S.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 48,
                      padding: EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFFF6F6F6),
                      ),
                      child: Text(
                        '고객센터',
                        style: TextStyle(
                          color: Color(0xFF3D3D3D),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1.0,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      height: 48,
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1:1 문의',
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.0,
                              letterSpacing: -0.40,
                            ),
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/next_line_S.png'))),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      height: 48,
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'FAQ',
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.0,
                              letterSpacing: -0.40,
                            ),
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/next_line_S.png'))),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      height: 48,
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '약관확인',
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.0,
                              letterSpacing: -0.40,
                            ),
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/next_line_S.png'))),
                          )
                        ],
                      ),
                    ),
                    Container(height: 24, color: Color(0xFFF6F6F6)),
                    Container(
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '앱버전',
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.0,
                              letterSpacing: -0.40,
                            ),
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/next_line_S.png'))),
                          )
                        ],
                      ),
                    ),
                    Container(height: 24, color: Color(0xFFF6F6F6)),
                    MaterialButton(
                      onPressed: () async {
                        User? user = FirebaseAuth.instance.currentUser;

                        if (user != null) {
                          try {
                            await user.delete();
                            // 회원 탈퇴 후 이동할 화면이 있다면 여기에 추가
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Login()), // BottomBar로 이동
                            );
                            ;
                          } catch (e) {
                            // 오류 처리
                            print('회원 탈퇴 오류: $e');
                          }
                        }
                      },
                      height: 48,
                      padding: EdgeInsets.zero,
                      child: Row(
                        children: const [
                          Text(
                            '회원탈퇴',
                            style: TextStyle(
                              color: Color(0xFFED1515),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.0,
                              letterSpacing: -0.40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
