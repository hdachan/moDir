import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:test_qwe/Agree_Page.dart';
import 'New_Password.dart';
import 'User_Setting.dart';
import 'main2.dart';

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
    home: Login(),
  ));
}


bool _isObscured = true;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _textController = TextEditingController();
  final _textController2 = TextEditingController();

  String errorMessage = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    // 이메일 형식 검사
    String pattern = r'^[^@]+@[^@]+\.[^@]+$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(email)) {
      print('올바른 이메일 형식이 아닙니다.');
      return null;
    }

    String passwordPattern =
        r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
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
      errorMessage = '이메일과 비밀번호는 필수 입력 사항입니다.';
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
        if ((e.message ?? '').contains('auth/user-disabled')) {
          errorMessage = '해당 사용자 계정은 비활성화 상태입니다.';
          print('해당 사용자 계정은 비활성화 상태입니다.');
        } else if ((e.message ?? '').contains('auth/invalid-credential')) {
          errorMessage = '이메일 또는 비밀번호 정보가 잘못되었습니다.';
          print('이메일 또는 비밀번호 정보가 잘못되었습니다.');
        } else if ((e.message ?? '').contains('auth/auth/too-many-requests')) {
          errorMessage = '너무 많은 요청이 발생하였습니다.';
          print('너무 많은 요청이 발생하였습니다.');
        } else if ((e.message ?? '').contains('auth/network-request-failed')) {
          errorMessage = '네트워크 오류가 발생하였습니다.';
          print('네트워크 오류가 발생하였습니다.');
        } else {
          print('알 수 없는 오류가 발생했습니다: ${e.message}');
        }
        setState(() {}); // 상태를 업데이트하여 UI를 다시 그립니다.
      }
      print('오류 코드: ${e.code}');
      print('오류 메시지: ${e.message}');
      return null;
    } catch (e) {
      print('로그인 도중 예상치 못한 오류가 발생했습니다: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              width: 428,
              height: 299,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
                    width: 146,
                    height: 29,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/logo_10.png'))),
                  ),
                  SizedBox(height: 48),
                  Column(
                    children: [
                      Container(
                        height: 48,
                        width: 428,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Color(0xFFD1D1D1),
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: TextFormField(
                          controller: _textController,
                          onChanged: (text) {
                            setState(() {});
                          },
                          style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.0,
                            letterSpacing: -0.4,
                          ),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(bottom: 10),
                              hintText: '이메일',
                              hintStyle: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.0,
                                letterSpacing: -0.4,
                              ),
                              suffixIcon: _textController.text.isNotEmpty
                                  ? IconButton(
                                      onPressed: () {
                                        _textController.clear();
                                        setState(() {});
                                      },
                                      padding:
                                          EdgeInsets.only(bottom: 10, left: 60),
                                      icon: Icon(Icons.cancel,
                                          color: Color(0xFF888888)))
                                  : null),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 48,
                        width: 428,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Color(0xFFD1D1D1),
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: TextFormField(
                          controller: _textController2,
                          onChanged: (text) {
                            setState(() {});
                          },
                          obscureText: _isObscured,
                          obscuringCharacter: '●',
                          style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.0,
                            letterSpacing: -0.40,
                          ),
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 10),
                            hintText: '비밀번호',
                            hintStyle: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.0,
                              letterSpacing: -0.40,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscured
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xFF888888),
                              ),
                              padding: EdgeInsets.only(left: 60),
                              //이게 들어 가서 왜 위 아래가 잡히는 지 몰겠네
                              onPressed: () {
                                setState(() {
                                  _isObscured = !_isObscured;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        height: 12,
                        width: 428,
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          '임시 오류 메세지',
                          style: TextStyle(
                            color: Color(0xFFF72828),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 1.0,
                            letterSpacing: -0.30,
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Container(
                        height: 48,
                        width: 428,
                        child: MaterialButton(
                          onPressed: () {
                            //여기에 유저 아이디 받는? 코드 들어감
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UserSetting()),
                            );
                          },
                          color: Color(0xFF4B0FFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            width: 51,
                            height: 20,
                            child: Text(
                              textAlign: TextAlign.center,
                              '로그인',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 1.0,
                                letterSpacing: -0.5,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 135,
                            height: 14,
                            child: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 24,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AgreePage()),
                                      );
                                    },
                                    style: OutlinedButton.styleFrom(
                                        minimumSize: Size.zero,
                                        padding:
                                            EdgeInsets.only(top: 3, bottom: 3)),
                                    child: Text(
                                      "회원가입",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.0,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Container(
                                  width: 75,
                                  height: 24,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewPassword()),
                                      );
                                    },
                                    style: OutlinedButton.styleFrom(
                                        minimumSize: Size.zero,
                                        padding:
                                            EdgeInsets.only(top: 3, bottom: 3)),
                                    child: Text(
                                      '비밀번호 찾기',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.0,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
