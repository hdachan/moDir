import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:test_qwe/Agree_Page.dart';
import 'New_Password.dart';
import 'main2.dart';
import 'bottom_bar.dart';

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

  String errorMessage = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _textController = TextEditingController();
  final _textController2 = TextEditingController();

  final FocusNode _emailfocusNode = FocusNode();
  Color _emailborderColor = Color(0xFFD1D1D1); // 기본 테두리 색상

  final FocusNode _passwordFocusNode = FocusNode();
  Color _passwordBorderColor = Color(0xFFD1D1D1); // 기본 테두리 색상


  @override
  void initState() {
    super.initState();
    _emailfocusNode.addListener(_onFocusChange);
    _passwordFocusNode.addListener(_onPasswordFocusChange);
  }

  @override
  void dispose() {
    _emailfocusNode.removeListener(_onFocusChange);
    _emailfocusNode.dispose();
    _passwordFocusNode.removeListener(_onPasswordFocusChange);
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _emailborderColor =
      _emailfocusNode.hasFocus ? Color(0xFF4B0FFF) : Color(0xFFD1D1D1);
    });
  }

  void _onPasswordFocusChange() {
    setState(() {
      _passwordBorderColor =
      _passwordFocusNode.hasFocus ? Color(0xFF4B0FFF) : Color(0xFFD1D1D1);
    });
  }


  Future<UserCredential?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),


      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'unknown') {
        if ((e.message ?? '').contains(
            'An unknown error occurred: FirebaseError: Firebase: The email address is badly formatted. (auth/invalid-email)')) {
          errorMessage = '이메일 형식이 상태가 안좋네요';
          _emailborderColor = Color(0xFFFF3333);
          print('이메일 형식이 상태가 안좋네요');
        } else if ((e.message ?? '').contains(
            'An unknown error occurred: FirebaseError: Firebase: A non-empty password must be provided (auth/missing-password).')) {
          errorMessage = '비밀번호 상태가 안좋아요';
          _passwordBorderColor = Color(0xFFFF3333);
          print('비밀번호 상태가 안좋아요');
        } else if ((e.message ?? '').contains(
            'An unknown error occurred: FirebaseError: Firebase: Password should be at least 6 characters (auth/weak-password)')) {
          errorMessage = '암호는 6자 이상이어야 합니다';
          _passwordBorderColor = Color(0xFFFF3333);
          print('암호는 6자 이상이어야 합니다');
        } else if ((e.message ?? '').contains(
            'An unknown error occurred: FirebaseError: Firebase: The supplied auth credential is incorrect, malformed or has expired. (auth/invalid-credential)')) {
          errorMessage = '제공된 인증 자격 증명이 잘못되었거나 형식이 잘못되었습니다';
          _emailborderColor = Color(0xFFFF3333);
          _passwordBorderColor = Color(0xFFFF3333);
          print('제공된 인증 자격 증명이 잘못되었거나 형식이 잘못되었습니다');
        } else if ((e.message ?? '').contains(
            'An unknown error occurred: FirebaseError: Firebase: The user account has been disabled by an administrator. (auth/user-disabled)')) {
          errorMessage = '계정이 비활성화 되었습니다.';
          _emailborderColor = Color(0xFFFF3333);
          print('계정이 비활성화 되었습니다.');
        }
        else {
          print('오류 코드: ${e.code}');
          print('오류 메시지: ${e.message}');
        }
      } else {
        if (e.code == 'user-not-found') {
          errorMessage = '사용자를 찾을 수 없습니다';
          print('사용자를 찾을 수 없습니다');
        } else if (e.code == 'wrong-password') {
          errorMessage = '잘못된 비밀번호입니다';
          print('잘못된 비밀번호입니다');
        } else {
          print('오류 코드: ${e.code}');
          print('오류 메시지: ${e.message}');
        }
      }
      setState(() {}); // 상태를 업데이트하여 UI를 다시 그립니다.
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
                                color: _emailborderColor,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: TextFormField(
                          controller: _textController,
                          focusNode: _emailfocusNode,
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
                              hintText: '이메일입니다.',
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
                                color: _passwordBorderColor,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: TextFormField(
                          controller: _textController2,
                          focusNode: _passwordFocusNode,
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
                      if (errorMessage.isNotEmpty)
                      Container(
                        height: 12,
                        width: 428,
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          errorMessage,
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
                          onPressed: () async {
                            UserCredential? user =
                            await signIn(
                                _textController.text,
                                _textController2.text);
                            if (user != null) {
                              print("Login Successful");
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BottomBar()), // BottomBar로 이동
                              );
                            } else {
                              print("Login Failed");
                            }
                          },
                          // onPressed: () {
                          //   String email = _textController.text;
                          //   String password = _textController2.text;
                          //   signIn(email, password);
                          // },
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
