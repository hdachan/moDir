import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Id_Making.dart';

void main() {
  runApp(MaterialApp(
    home: SignupPage(),
  ));
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isObscured = true;
  bool isObscured = true; //비전 아이콘 활성화,비활성화
  String emailErrorMessage = '';
  String passwordErrorMessage = '';
  String repasswordErrorMessage = '';

  Future<void> signUp() async {
    try {
      if (emailController.text.trim().isEmpty) {
        setState(() {
          emailErrorMessage = '이메일을 입력해주세요.';
          passwordErrorMessage = '';
          repasswordErrorMessage = '';
          _emailborderColor = Color(0xFFFF3333);
        });
        print('오류: 이메일을 입력해주세요.'); // 여기에 print 추가
        return;
      }
      if (passwordController.text.trim().isEmpty) {
        setState(() {
          passwordErrorMessage = '비밀번호를 입력해주세요.';
          emailErrorMessage = '';
          repasswordErrorMessage = '';
          _passwordBorderColor = Color(0xFFFF3333);
        });
        print('오류: 비밀번호를 입력해주세요.'); // 여기에 print 추가
        return;
      }

      if (repasswordController.text.trim().isEmpty) {
        setState(() {
          repasswordErrorMessage = '비밀번호를 재입력해주세요.';
          passwordErrorMessage = '';
          emailErrorMessage = '';
          _rePasswordBorderColor = Color(0xFFFF3333);
        });
        print('오류: 비밀번호를 재입력해주세요.'); // 여기에 print 추가
        return;
      }

      // 비밀번호와 재입력한 비밀번호가 다를 경우 처리
      if (passwordController.text.trim() != repasswordController.text.trim()) {
        setState(() {
          repasswordErrorMessage = '비밀번호가 똑같지 않습니다.';
          passwordErrorMessage = '';
          emailErrorMessage = '';
          _rePasswordBorderColor =
              Color(0xFFFF3333); // 재입력 비밀번호 필드의 테두리 색을 변경할 수 있습니다.
        });
        print('오류: 비밀번호가 똑같지 않습니다.');
        return;
      }

      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print('계정 생성 성공: ${userCredential.user}'); // 계정 생성 성공 시 콘솔에 출력

      setState(() {
        emailErrorMessage = '';
        passwordErrorMessage = '';
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => IdMaking()));
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'unknown') {
          if ((e.message ?? '').contains(
              'An unknown error occurred: FirebaseError: Firebase: The email address is badly formatted. (auth/invalid-email')) {
            emailErrorMessage = '유효하지 않은 이메일 형식입니다.';
            passwordErrorMessage = '';
            repasswordErrorMessage = '';
            _emailborderColor = Color(0xFFFF3333);
            print('오류: 유효하지 않은 이메일 형식입니다.');
          } else if ((e.message ?? '').contains(
              'An unknown error occurred: FirebaseError: Firebase: Password should be at least 6 characters (auth/weak-password).')) {
            passwordErrorMessage = '비밀번호가 너무 약합니다.';
            emailErrorMessage = '';
            repasswordErrorMessage = '';
            _passwordBorderColor = Color(0xFFFF3333);
            print('오류: 비밀번호가 너무 약합니다.');
          } else if ((e.message ?? '').contains(
              'An unknown error occurred: FirebaseError: Firebase: The email address is already in use by another account. (auth/email-already-in-use)')) {
            emailErrorMessage = '이미 사용 중인 이메일입니다.';
            passwordErrorMessage = '';
            repasswordErrorMessage = '';
            _emailborderColor = Color(0xFFFF3333);
            print('오류: 이미 사용 중인 이메일입니다.');
          } else if ((e.message ?? '').contains('too-many-requests')) {
            emailErrorMessage = '너무 많은 요청이 감지되었습니다. 잠시 후 다시 시도해주세요.';
            passwordErrorMessage = '';
            repasswordErrorMessage = '';
            _emailborderColor = Color(0xFFFF3333);
            print('오류: 너무 많은 요청이 감지되었습니다. 잠시 후 다시 시도해주세요.');
          } else {
            emailErrorMessage = '알 수 없는 오류가 발생했습니다';
            passwordErrorMessage = '알 수 없는 오류가 발생했습니다';
            repasswordErrorMessage = '알 수 없는 오류가 발생했습니다';
            print('알 수 없는 오류가 발생했습니다: ${e.message}');
            print('알 수 없는 오류가 발생했습니다: ${e.code}');
          }
        }
      });
    } catch (e) {
      setState(() {
        emailErrorMessage = '회원가입 실패: 알 수 없는 오류가 발생했습니다.';
        passwordErrorMessage = '';
        repasswordErrorMessage = '알 수 없는 오류가 발생했습니다';
      });
      print('오류: 회원가입 실패: 알 수 없는 오류가 발생했습니다.');
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();

  final FocusNode _emailfocusNode = FocusNode();
  Color _emailborderColor = Color(0xFFD1D1D1); // 기본 테두리 색상

  final FocusNode _passwordFocusNode = FocusNode();
  Color _passwordBorderColor = Color(0xFFD1D1D1); // 기본 테두리 색상

  final FocusNode _rePasswordFocusNode = FocusNode();
  Color _rePasswordBorderColor = Color(0xFFD1D1D1); // 기본 테두리 색상

  @override
  void initState() {
    super.initState();
    _emailfocusNode.addListener(_onFocusChange);
    _passwordFocusNode.addListener(_onPasswordFocusChange);
    _rePasswordFocusNode.addListener(
        _onRePasswordFocusChange); // 비밀번호 재입력 필드의 FocusNode 상태 변화 감지
  }

  @override
  void dispose() {
    _emailfocusNode.removeListener(_onFocusChange);
    _emailfocusNode.dispose();
    _passwordFocusNode.removeListener(_onPasswordFocusChange);
    _passwordFocusNode.dispose();
    _rePasswordFocusNode.removeListener(_onRePasswordFocusChange); // 메서드 제거
    _rePasswordFocusNode.dispose();

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

  void _onRePasswordFocusChange() {
    setState(() {
      _rePasswordBorderColor =
          _rePasswordFocusNode.hasFocus ? Color(0xFF4B0FFF) : Color(0xFFD1D1D1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // 앱 바 - 완
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      width: 1,
                      color: Color(0xFFE7E7E7),
                    )),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12, left: 12),
                      child: Row(
                        children: [
                          Container(
                            // 뒤로가기 버튼 - 완
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image/back_icon.png'))),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      )),
                ),
                Center(
                  child: Container(
                    // 중간 패널
                    width: 428,
                    height: 592,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, top: 55.5),
                      child: Container(
                        height: 62,
                        width: 426,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '이메일 및 비밀번호 입력',
                              style: TextStyle(
                                color: Color(0xFF3D3D3D),
                                fontSize: 24,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 1.3,
                                letterSpacing: -0.60,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '로그인에 사용할 이메일과 비밀번호를 입력해 주세요.',
                              style: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.3,
                                letterSpacing: -0.35,
                              ),
                            ),
                            SizedBox(height: 48),
                            Container(
                              height: 82,
                              width: 426,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Row(
                                      children: const [
                                        Text(
                                          '이메일',
                                          style: TextStyle(
                                            color: Color(0xFF3D3D3D),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.0,
                                            letterSpacing: -0.35,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          '*',
                                          style: TextStyle(
                                            color: Color(0xFFFF3333),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.0,
                                            letterSpacing: -0.35,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Column(
                                    children: [
                                      Container(
                                        height: 48,
                                        width: 426,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 12),
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1,
                                                color: _emailborderColor),
                                            // 포커스 상태에 따른 테두리 색상 변경
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: emailController,
                                          focusNode: _emailfocusNode,
                                          // 포커스 노드 사용
                                          style: TextStyle(
                                            color: Color(0xFF3D3D3D),
                                            fontSize: 16,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            height: 1.0,
                                            letterSpacing: -0.40,
                                          ),
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.only(bottom: 10),
                                              hintText: '이메일 입력',
                                              hintStyle: TextStyle(
                                                color: Color(0xFF888888),
                                                fontSize: 16,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w500,
                                                height: 1.0,
                                                letterSpacing: -0.40,
                                              ),
                                              suffixIcon: emailController
                                                      .text.isNotEmpty
                                                  ? IconButton(
                                                      onPressed: () {
                                                        emailController.clear();
                                                        setState(() {});
                                                      },
                                                      padding: EdgeInsets.only(
                                                          left: 60),
                                                      icon: Icon(Icons.cancel,
                                                          color: Color(
                                                              0xFF888888)))
                                                  : null),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  if (emailErrorMessage.isNotEmpty)
                                    Container(
                                      height: 12,
                                      width: 426,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: Text(
                                        emailErrorMessage,
                                        // 이전에 정의한 errorMessage 변수 사용
                                        style: TextStyle(
                                          color: Color(0xFFFF3333),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                          height: 1.0,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
                            Container(
                              height: 82,
                              width: 426,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Row(
                                      children: const [
                                        Text(
                                          '비밀번호',
                                          style: TextStyle(
                                            color: Color(0xFF3D3D3D),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.0,
                                            letterSpacing: -0.35,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          '*',
                                          style: TextStyle(
                                            color: Color(0xFFFF3333),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.0,
                                            letterSpacing: -0.35,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Column(
                                    children: [
                                      Container(
                                        height: 48,
                                        width: 426,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 12),
                                        decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: _passwordBorderColor),
                                          // 포커스 상태에 따른 테두리 색상 변경
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        )),
                                        child: Container(
                                          color: Colors.white,
                                          child: TextFormField(
                                            controller: passwordController,
                                            obscureText: _isObscured,
                                            // 비밀번호 숨김 여부를 결정하는 변수
                                            obscuringCharacter: '●',
                                            focusNode: _passwordFocusNode,
                                            style: TextStyle(
                                              color: Color(0xFF3D3D3D),
                                              fontSize: 16,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w500,
                                              height: 1.0,
                                              letterSpacing: -0.40,
                                            ),
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.only(bottom: 10),
                                              // 아이콘을 위한 공간 확보
                                              hintText: '비밀번호 입력',
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
                                                padding:
                                                    EdgeInsets.only(left: 60),
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
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  if (passwordErrorMessage.isNotEmpty)
                                    Container(
                                      height: 12,
                                      width: 426,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: Text(
                                        passwordErrorMessage,
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
                                ],
                              ),
                            ),
                            SizedBox(height: 12),
                            Container(
                              height: 82,
                              width: 426,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Row(
                                      children: const [
                                        Text(
                                          '비밀번호 재입력',
                                          style: TextStyle(
                                            color: Color(0xFF3D3D3D),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.0,
                                            letterSpacing: -0.35,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          '*',
                                          style: TextStyle(
                                            color: Color(0xFFFF3333),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.0,
                                            letterSpacing: -0.35,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Column(
                                    children: [
                                      Container(
                                        height: 48,
                                        width: 426,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 12),
                                        decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: _rePasswordBorderColor),
                                          // 포커스 상태에 따른 테두리 색상 변경
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        )),
                                        child: Container(
                                            color: Colors.white,
                                            child: TextFormField(
                                              controller: repasswordController,
                                              obscureText: isObscured,
                                              obscuringCharacter: '●',
                                              focusNode: _rePasswordFocusNode,
                                              // 포커스 노드 사용
                                              style: TextStyle(
                                                color: Color(0xFF3D3D3D),
                                                fontSize: 16,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w500,
                                                height: 1.0,
                                                letterSpacing: -0.40,
                                              ),
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                contentPadding:
                                                    EdgeInsets.only(bottom: 10),
                                                hintText: '비밀번호 재입력',
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
                                                    isObscured
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                    color: Color(0xFF888888),
                                                  ),
                                                  padding:
                                                      EdgeInsets.only(left: 60),
                                                  //이게 들어 가서 왜 위 아래가 잡히는 지 몰겠네
                                                  onPressed: () {
                                                    setState(() {
                                                      isObscured = !isObscured;
                                                    });
                                                  },
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Container(
                                    height: 12,
                                    width: 426,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      repasswordErrorMessage,
                                      style: TextStyle(
                                        color: Color(0xFFFF3333),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.0,
                                        letterSpacing: -0.30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    // 다음 버튼 - 버튼 기능 추가
                    padding: EdgeInsets.only(left: 24, right: 24, bottom: 48),
                    child: SizedBox(
                      height: 48,
                      width: 428,
                      child: MaterialButton(
                        onPressed: () {
                          signUp();
                        },
                        color: Color(0xFF4B0FFF),
                        //파랑 - 0xFF4B0FFF  , 파랑연한거 -0xFFAFA6FF
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          '다음',
                          style: TextStyle(
                            color: Color(0xFFF6F6F6),
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.0,
                            letterSpacing: -0.50,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
