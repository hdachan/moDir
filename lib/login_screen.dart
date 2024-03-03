import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_qwe/user_agreement_screen.dart';

import 'main2.dart';
import 'password_screen.dart';



class login_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  List<String> imageList = ['assets/image/bad.png', 'assets/image/fox.png', 'assets/image/tog.png'];


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 740),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(52.h),
              child: AppBar(
                title: Text(
                  '로그인',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                centerTitle: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(1.0),
                  child: Container(
                    color: Color(0xFFE5E6E8),
                    height: 1.0,
                  ),
                ),
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  Container(
                    width: 158.w,
                    height: 36.h,
                    margin: EdgeInsets.fromLTRB(101, 40, 101, 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/logo.png'),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(4, 6, 4, 6), // 각 방향에 다른 패딩 값 설정
                    ),
                  ),
                  Container(
                    //아이디 입력
                    width: 312.w,
                    height: 48.h,
                    margin: EdgeInsets.fromLTRB(24, 40, 24, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFF8C8C8C),
                      ),
                    ),
                    child: TextField(
                      controller: emailController, // 이메일 컨트롤
                      decoration: InputDecoration(
                        hintText: '아이디',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(46, 18, 0, 18), // TextField 내부에 패딩 추가
                      ),
                      style: TextStyle(
                        color: Color(0xFF767676),
                        fontSize: 12.0,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.28,
                      ),
                    ),
                  ),

                  Container(
                    // 비밀번호 입력
                    width: 312.w,
                    height: 48.h,
                    margin: EdgeInsets.fromLTRB(24, 12, 24, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFF8C8C8C),
                      ),
                    ),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: '비밀번호',
                        border: InputBorder.none, // Underline 제거
                        contentPadding: EdgeInsets.fromLTRB(46, 18, 0, 18),
                      ),
                      style: TextStyle(
                        color: Color(0xFF767676),
                        fontSize: 12.0,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.28,
                      ),
                    ),
                  ),
                  Container(
                    // 로그인 버튼
                    width: 312.w,
                    height: 48.h,
                    margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFFE85884),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFFE85884),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        UserCredential? user = await signInWithEmailAndPassword(
                            emailController.text, passwordController.text);
                        if (user != null) {
                          print("Login Successful");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Main2()),
                          );
                        } else {
                          print("Login Failed");
                        }
                      },
                      child: Text(
                        '로그인',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.28,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 320.w,
                    height: 28.h,
                    margin: EdgeInsets.fromLTRB(24, 110, 24, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
                            child: Divider(color: Colors.black.withOpacity(0.44999998807907104)), // 선 그리기
                          ),
                        ),
                        Text(
                          "다른 방법 로그인",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.44999998807907104),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
                            child: Divider(color: Colors.black.withOpacity(0.44999998807907104)), // 선 그리기
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 312.w,
                    height: 48.h,
                    margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE812), // 배경색을 0xFFFFE812로 설정
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFFFFE812),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '카카오 로그인',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 312.w,
                    height: 48.h,
                    margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFC7C7C7)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Center( // Center 위젯 추가
                      child: Text(
                        'Google 로그인',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                  ),


                  Container(
                    // 회원가입 버튼
                    width: 312.w,
                    height: 48.h,
                    margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Color(0xFFE85884),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => user_agreement_screen()),
                        );
                      },
                      child: Text(
                        '회원가입',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFE85884),
                          fontSize: 16.0,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.28,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // 비밀번호 찾기 버튼
                    width: 312.w,
                    height: 48.h,
                    margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Color(0xFFE85884),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => password_screen()),
                        );
                      },
                      child: Text(
                        '비밀번호 찾기',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFE85884),
                          fontSize: 16.0,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.28,
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          );
        });
  }
}
