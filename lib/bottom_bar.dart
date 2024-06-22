import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_qwe/Login.dart';
import 'Change_Password.dart';


class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

// HomePage의 상태 관리 클래스
class _BottomBarState  extends State<BottomBar> {
  int _currentIndex = 0; // 현재 선택된 인덱스
  final List<Widget> _pages = [
    HomeScreen(),
    FeatureScreen(),
    BookmarkScreen(),
    MyPageScreen(),
  ]; // 각 페이지 위젯들

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // 현재 선택된 페이지를 표시
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // 현재 선택된 인덱스
        onTap: (index) {
          setState(() {
            _currentIndex = index; // 인덱스 변경 시 상태 갱신
          });
        },
        selectedItemColor: Colors.blue, // 선택된 아이템 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 색상
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blue), // 홈 아이콘
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.featured_play_list, color: Colors.blue), // 기능 아이콘
            label: '기능',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, color: Colors.blue), // 북마크 아이콘
            label: '북마크',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.blue), // 마이페이지 아이콘
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}

// 홈 화면 위젯
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // 탭의 수
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: '메인'),
              Tab(text: '커뮤니티'),
              Tab(text: '매거진'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('메인 화면 내용')),
            Stack(
              children: [
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('posts')
                      .orderBy('timestamp', descending: true) // 타임스탬프 기준으로 정렬
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView(
                      children: snapshot.data!.docs.map((document) {
                        return ListTile(
                          title: Text(document['title']),
                          subtitle: Text(document['content']),
                        );
                      }).toList(),
                    );
                  },
                ),
                Positioned(
                  bottom: 16.0,
                  right: 16.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            // 화살표 버튼 클릭 시 동작
                          },
                          borderRadius: BorderRadius.circular(50.0),
                          child: Container(
                            width: 56.0,
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: Color(0x80000000), // #0000004D
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.arrow_upward, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Material(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                TextEditingController titleController = TextEditingController();
                                TextEditingController contentController = TextEditingController();

                                return AlertDialog(
                                  title: Text('새 글 작성'),
                                  content: Column(
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
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('취소'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance.collection('posts').add({
                                          'title': titleController.text,
                                          'content': contentController.text,
                                          'timestamp': FieldValue.serverTimestamp(), // 타임스탬프 추가
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('저장'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          borderRadius: BorderRadius.circular(50.0),
                          child: Container(
                            width: 56.0,
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF4F4F4F), // #4F4F4F
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(child: Text('매거진 화면 내용')),
          ],
        ),
      ),
    );
  }
}




// 기능 화면 위젯
class FeatureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('기능 화면'), // 기능 화면 텍스트
    );
  }
}

// 북마크 화면 위젯
class BookmarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('북마크 화면'), // 북마크 화면 텍스트
    );
  }
}

// 마이페이지 화면 위젯
class MyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onPressed: (){
                      },
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
                                    image: AssetImage('assets/image/next_line_S.png')
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChangePassword()),
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
                                    image: AssetImage('assets/image/next_line_S.png')
                                )
                            ),
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
                          MaterialPageRoute(builder: (context) => Login()), // BottomBar로 이동
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
                                image: AssetImage('assets/image/logout_line_S.png'),
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
                      onPressed: (){
                      },
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
                                    image: AssetImage('assets/image/next_line_S.png')
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: (){
                      },
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
                                    image: AssetImage('assets/image/next_line_S.png')
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: (){
                      },
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
                                    image: AssetImage('assets/image/next_line_S.png')
                                )
                            ),
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
                                    image: AssetImage('assets/image/next_line_S.png')
                                )
                            ),
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
                              MaterialPageRoute(builder: (context) => Login()), // BottomBar로 이동
                            );;
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
