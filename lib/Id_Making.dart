import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// 약관동의 화면
void main() {
  runApp(MaterialApp(
    home: IdMaking(),
  ));
}

class IdMaking extends StatefulWidget {
  @override
  _IdMaking createState() => _IdMaking();
}

class _IdMaking extends State<IdMaking> {
  String emailErrorMessage = ''; // 클래스 멤버 변수 이름 변경
  String passwordErrorMessage = ''; // 패스워드 에러 메시지

  Future<void> signUp() async {
    try {
      if (emailController.text.trim().isEmpty) {
        setState(() {
          emailErrorMessage = '이메일을 입력해주세요.';
          passwordErrorMessage = '';
        });
        print('오류: 이메일을 입력해주세요.');
        return;
      }
      if (passwordController.text.trim().isEmpty) {
        setState(() {
          passwordErrorMessage = '비밀번호를 입력해주세요.';
          emailErrorMessage = '';
        });
        print('오류: 비밀번호를 입력해주세요.');
        return;
      }

      final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print('계정 생성 성공: ${userCredential.user}'); // 계정 생성 성공 시 콘솔에 출력

      setState(() {
        emailErrorMessage = '';
        passwordErrorMessage = '';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.message == 'invalid-email') {
          emailErrorMessage = '유효하지 않은 이메일 형식입니다.';
          passwordErrorMessage = '';
          print('오류: 유효하지 않은 이메일 형식입니다.');
        } else if (e.code == 'email-already-in-use') {
          emailErrorMessage = '이미 사용 중인 이메일입니다.';
          passwordErrorMessage = '';
          print('오류: 이미 사용 중인 이메일입니다.');
        } else if (e.code == 'weak-password') {
          passwordErrorMessage = '비밀번호가 너무 약합니다.';
          emailErrorMessage = '';
          print('오류: 비밀번호가 너무 약합니다.');
        } else if (e.code == 'operation-not-allowed') {
          emailErrorMessage = '이메일과 비밀번호로 로그인하는 것이 현재 비활성화되어 있습니다.';
          passwordErrorMessage = '';
          print('오류: 이메일과 비밀번호로 로그인하는 것이 현재 비활성화되어 있습니다.');
        } else if (e.code == 'too-many-requests') {
          emailErrorMessage = '요청이 너무 많습니다. 나중에 다시 시도해주세요.';
          passwordErrorMessage = '';
          print('오류: 요청이 너무 많습니다. 나중에 다시 시도해주세요.');
        } else if (e.code == 'user-disabled') {
          emailErrorMessage = '사용자 계정이 비활성화되었습니다.';
          passwordErrorMessage = '';
          print('오류: 사용자 계정이 비활성화되었습니다.');
        } else {
          emailErrorMessage = '회원가입 실패: ${e.message}';
          passwordErrorMessage = '';
          print('오류: 회원가입 실패: ${e.message}');
        }
      });
    } catch (e) {
      setState(() {
        emailErrorMessage = '회원가입 실패: 알 수 없는 오류가 발생했습니다.';
        passwordErrorMessage = '';
      });
      print('오류: 회원가입 실패: 알 수 없는 오류가 발생했습니다.');
    }
  }


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();

  final FocusNode _focusNode = FocusNode();
  Color _borderColor = Color(0xFFD1D1D1); // 기본 테두리 색상

  final FocusNode _passwordFocusNode = FocusNode();
  Color _passwordBorderColor = Color(0xFFD1D1D1); // 기본 테두리 색상

  final FocusNode _rePasswordFocusNode = FocusNode();
  Color _rePasswordBorderColor = Color(0xFFD1D1D1); // 기본 테두리 색상

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    _passwordFocusNode.addListener(_onPasswordFocusChange);
    _rePasswordFocusNode.addListener(
        _onRePasswordFocusChange); // 비밀번호 재입력 필드의 FocusNode 상태 변화 감지
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _passwordFocusNode.removeListener(_onPasswordFocusChange);
    _passwordFocusNode.dispose();
    _rePasswordFocusNode.removeListener(_onRePasswordFocusChange); // 메서드 제거
    _rePasswordFocusNode.dispose();

    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _borderColor =
      _focusNode.hasFocus ? Color(0xFF4B0FFF) : Color(0xFFD1D1D1);
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
                  height: 54,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Color(0xFFE7E7E7),
                        )),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15, left: 24),
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
                    height: 586,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, top: 48),
                      child: Container(
                        height: 62,
                        width: 428,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '계정을 생성해 볼까요?',
                              style: TextStyle(
                                color: Color(0xFF3D3D3D),
                                fontSize: 28,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                                letterSpacing: -0.70,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '가입회원이 되면 원하는 커뮤니티 정보를 알 수 있어요.',
                              style: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.28,
                                letterSpacing: -0.35,
                              ),
                            ),
                            SizedBox(height: 48),
                            Container(
                              height: 90,
                              width: 428,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Row(
                                      children: const [
                                        Text(
                                          '닉네임',
                                          style: TextStyle(
                                            color: Color(0xFF3D3D3D),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            height: 1.28,
                                            letterSpacing: -0.35,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          '*',
                                          style: TextStyle(
                                            color: Color(0xFFFF3333),
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            height: 1.3,
                                            letterSpacing: -0.30,
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
                                        width: 428,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 12),
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1, color: _borderColor),
                                            // 포커스 상태에 따른 테두리 색상 변경
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: emailController,
                                          focusNode: _focusNode,
                                          // 포커스 노드 사용
                                          style: TextStyle(
                                            color: Color(0xFF3D3D3D),
                                            fontSize: 16,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w600,
                                            height: 1.5,
                                            letterSpacing: -0.40,
                                          ),
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            contentPadding:
                                            EdgeInsets.only(bottom: 10),
                                            hintText: '닉네임 입력',
                                            hintStyle: TextStyle(
                                              color: Color(0xFF888888),
                                              fontSize: 16,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w600,
                                              height: 1.5,
                                              letterSpacing: -0.40,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  if (emailErrorMessage.isNotEmpty)
                                    Container(
                                      height: 16,
                                      width: 428,
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 4),
                                      child: Text(
                                        emailErrorMessage,
                                        // 이전에 정의한 errorMessage 변수 사용
                                        style: TextStyle(
                                          color: Color(0xFFFF3333),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w500,
                                          height: 1.33,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              height: 90,
                              width: 428,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Row(
                                      children: const [
                                        Text(
                                          '생년월일',
                                          style: TextStyle(
                                            color: Color(0xFF3D3D3D),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            height: 1.28,
                                            letterSpacing: -0.35,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          '*',
                                          style: TextStyle(
                                            color: Color(0xFFFF3333),
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            height: 1.3,
                                            letterSpacing: -0.30,
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
                                        width: 428,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 12),
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
                                              focusNode: _passwordFocusNode,
                                              // 포커스 노드 사용
                                              style: TextStyle(
                                                color: Color(0xFF3D3D3D),
                                                fontSize: 16,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w600,
                                                height: 1.5,
                                                letterSpacing: -0.40,
                                              ),
                                              textInputAction:
                                              TextInputAction.next,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                contentPadding:
                                                EdgeInsets.only(bottom: 10),
                                                hintText: '생년월일 입력',
                                                hintStyle: TextStyle(
                                                  color: Color(0xFF888888),
                                                  fontSize: 16,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.5,
                                                  letterSpacing: -0.40,
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  if (passwordErrorMessage.isNotEmpty)
                                    Container(
                                      height: 16,
                                      width: 428,
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 4),
                                      child: Text(
                                        passwordErrorMessage,
                                        style: TextStyle(
                                          color: Color(0xFFF72828),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w500,
                                          height: 1.33,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              height: 90,
                              width: 428,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Row(
                                      children: const [
                                        Text(
                                          '성별',
                                          style: TextStyle(
                                            color: Color(0xFF3D3D3D),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            height: 1.28,
                                            letterSpacing: -0.35,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          '*',
                                          style: TextStyle(
                                            color: Color(0xFFFF3333),
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            height: 1.3,
                                            letterSpacing: -0.30,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Expanded( // 이 Expanded는 가로 방향으로 최대 크기를 차지하기 위해 사용됩니다.
                                    child: Container(
                                      height: 48,
                                      // width: 428, // 가로 방향으로 최대 크기를 차지하기 위해 width 설정을 제거합니다.
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            color: _rePasswordBorderColor,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                '버튼 1',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: Colors.amber,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                '버튼 2',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),



                                  SizedBox(height: 4),
                                  Container(
                                    height: 16,
                                    width: 426,
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      '성별을 선택해 주세요',
                                      style: TextStyle(
                                        color: Color(0xFFB0B0B0),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1.33,
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
                      height: 52,
                      width: 428,
                      child: MaterialButton(
                        onPressed: () {
                          signUp();
                        },
                        color: Color(0xFF4B0FFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          '다음',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.1,
                            letterSpacing: -0.53,
                            fontSize: 21,
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
