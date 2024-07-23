import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_qwe/Login.dart';
import 'Change_Password.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'designer_detail_screen.dart';

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

//기능화면
class Designer {
  final String name;
  final String imageUrl;
  final double rating;
  final String specialty;
  final double price;
  final String description; // 새로운 속성 추가

  Designer({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.specialty,
    required this.price,
    required this.description, // 새로운 속성 초기화
  });

  factory Designer.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Designer(
      name: data['name'] ?? '',
      rating: data['rating'] ?? 0.0,
      specialty: data['specialty'] ?? '',
      price: data['price'] ?? 0.0,
      imageUrl: data['imageUrl'] ?? '',
      // 이미지 URL 초기화
      description: data['description'] ?? '', // description 초기화
    );
  }
}

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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('designer').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('오류 발생: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('데이터가 없습니다.'));
          }

          var designers = snapshot.data!.docs
              .map((doc) => Designer.fromFirestore(doc))
              .toList();

          return ListView.builder(
            itemCount: designers.length,
            itemBuilder: (context, index) {
              var designer = designers[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DesignerDetailScreen(designer: designer),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  padding: EdgeInsets.all(16.0),
                  height: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: designer.imageUrl.isNotEmpty
                            ? Image.network(
                                designer.imageUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/image/m_logo.png',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  );
                                },
                              )
                            : Image.asset(
                                'assets/image/m_logo.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              designer.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 16.0),
                                SizedBox(width: 4.0),
                                Text(
                                  '평점: ${designer.rating}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '분야: ${designer.specialty}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '가격: \$${designer.price}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// 5번째 위젯
class HelloWorldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('헬로월드 내용'),
    );
  }
}

// 북마크 화면
class BookmarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                    'assets/image/logo_modi.png', // 실제 로고 이미지
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
              children: [ // children 속성을 추가
                Center(
                  child: Container(
                    // 중간 패널
                    width: 428,
                    height: 624,
                    decoration: BoxDecoration(color: Colors.red),
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, top: 10),
                      child: Container(
                        height: 96,
                        width: 428,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text(
                              '추천 받을 디자이너를 선택해주세요',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                                height: 1.3,
                                letterSpacing: -0.60,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '원하는 패션 분야의 디자이너를 선택하면 취향에 맞는 옷을 추천 받을 수 있어요',
                              style: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                                letterSpacing: -0.3,
                              ),
                            ),
                            SizedBox(height: 20),
                        Container(
                          height: 132,
                          width: 428,
                          decoration: BoxDecoration(color: Colors.redAccent),
                        ),
                          ]
                        ),
                        decoration: BoxDecoration(color: Colors.white),
                      ),
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
}


// 마이페이지 화면 위젯
class MyPageScreen extends StatelessWidget {
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
