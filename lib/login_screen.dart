import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_qwe/user_agreement_screen.dart';

import 'main2.dart';
import 'password_screen.dart';

// 픽셀 오류 뜰건데 이거는 나도 모르겠더라 + 크기 줄여 보면 바텀 값 안줘서 오류나는데 꼭 줘야됨
// 크롬창에서 360 740 해보면 테그스트 부분 다깨짐 그거 한번 봐주셈 그거도 고쳐야됨

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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<UserCredential?> signInWithEmailAndPassword
      (String email, String password) async {
    // 이메일 형식 검사
    String pattern = r'^[^@]+@[^@]+\.[^@]+$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(email)) {
      print('올바른 이메일 형식이 아닙니다.');
      return null;
    }

    String passwordPattern = r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp passwordRegex = RegExp(passwordPattern);
    if (!passwordRegex.hasMatch(password)) {
      print('비밀번호는 최소 한 개의 소문자, 숫자, 특수문자를 포함해야 합니다.');
      return null;
    }

    // 비밀번호 강도 검사
    if (password.length < 8) {
      print('비밀번호는 최소 8자 이상이어야 합니다.');
      return null;
    }



    // 이메일과 비밀번호 빈 문자열 검사
    if (email.isEmpty || password.isEmpty) {
      print('이메일과 비밀번호는 필수 입력 사항입니다.');
      return null;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'unknown') {
        if ((e.message ?? '').contains('user-disabled')) {
          print('해당 사용자 계정은 비활성화 상태입니다.');
        } else if ((e.message ?? '').contains('auth/invalid-credential')) {
          print('제공된 인증 정보가 잘못되었거나 만료되었습니다.');
        } else {
          print('알 수 없는 오류가 발생했습니다: ${e.message}');
        }
      }
      if (e.code == 'auth/weak-password') {
        print('비밀번호가 너무 짧습니다: ${e.message}');
      }

      print('오류 코드: ${e.code}');
      return null;
    } catch (e) {
      print('로그인 도중 예상치 못한 오류가 발생했습니다: $e');
      return null;
    }

  }


  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 740),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Color(0xFFF2F2F2),
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
                  width: 158.30.w,
                  height: 36.h,
                  margin: EdgeInsets.fromLTRB(108.85, 48, 108.85, 0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/logo.png'),
                    ),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.fromLTRB(4, 6, 4, 6), // 각 방향에 다른 패딩 값 설정
                  ),
                ),
                Container(
                  width: 312.w,
                  height: 464.h,
                  margin: EdgeInsets.fromLTRB(24, 48, 24, 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(6, 43, 6, 0),
                        width: 280.w,
                        height: 27.h,
                        child: Text(
                          '로그인',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 21,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0.06,
                            letterSpacing: -0.53,
                          ),
                        ),
                      ),
                      Container(
                        //아이디 입력
                          width: 280.w,
                          height: 44.h,
                          margin: EdgeInsets.fromLTRB(24, 40, 24, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Color(0xFFC4C4C4),
                            ),
                          ),
                          child: Container(
                            width: 248.w,
                            height: 24.h,
                            margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
                            child: TextField(
                              controller: emailController, // 이메일 컨트롤 코드 ( 백엔드 )
                              decoration: InputDecoration(
                                hintText: '이메일',
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                color: Color(0xFFC4C4C4),
                                fontSize: 14.0,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.35,
                              ),
                            ),
                          )),
                      Container(
                        //비밀번호 입력
                          width: 280.w,
                          height: 44.h,
                          margin: EdgeInsets.fromLTRB(24, 8, 24, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Color(0xFFC4C4C4),
                            ),
                          ),
                          child: Container(
                            width: 248.w,
                            height: 24.h,
                            margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
                            // decoration: BoxDecoration(
                            //   border: Border.all(
                            //     color: Color(0xFFFF0000),
                            //   ),
                            // ),
                            child: TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                hintText: '비밀번호 입력',
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                color: Color(0xFFC4C4C4),
                                fontSize: 14.0,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.35,
                              ),
                            ),
                          )),
                      Container(
                        width: 280.w,
                        height: 32.h,
                        margin: EdgeInsets.fromLTRB(24, 8, 24, 0),
                        child: Container(
                          width: 144.w,
                          height: 16.h,
                          margin: EdgeInsets.fromLTRB(140, 8, 0, 8),
                          alignment: Alignment.centerRight,
                          child: Text(
                            '올바른 이메일을 입력해 주세요',
                            style: TextStyle(
                              color: Color(0xFFF72828),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 280.w,
                        height: 44.h,
                        margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                        decoration: BoxDecoration(
                          color: Color(0xFF4C0EFF),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            UserCredential? user = await signInWithEmailAndPassword(emailController.text, passwordController.text);
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
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.35,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 113.w,
                        height: 16.h,
                        margin: EdgeInsets.fromLTRB(109.5, 12, 109.5, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => password_screen()),
                                );
                              },
                              child: Text(
                                '비밀번호 찾기',
                                style: TextStyle(
                                  color: Color(0xFF9D9D9D),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w200,
                                  letterSpacing: -0.30,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => user_agreement_screen()),
                                  );
                                },
                                child: Text(
                                  '회원가입',
                                  style: TextStyle(
                                    color: Color(0xFF4C0EFF),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w200,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )



                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}