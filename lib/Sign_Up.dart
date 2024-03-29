import 'package:flutter/material.dart';

// 약관동의 화면
void main() {
  runApp(MaterialApp(
    home: SignupPage(),
  ));
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>{
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
    _rePasswordFocusNode.addListener(_onRePasswordFocusChange); // 비밀번호 재입력 필드의 FocusNode 상태 변화 감지
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
      _borderColor = _focusNode.hasFocus ? Color(0xFF4B0FFF) : Color(0xFFD1D1D1);
    });
  }

  void _onPasswordFocusChange() {
    setState(() {
      _passwordBorderColor = _passwordFocusNode.hasFocus ? Color(0xFF4B0FFF) : Color(0xFFD1D1D1);
    });
  }

  void _onRePasswordFocusChange() {
    setState(() {
      _rePasswordBorderColor = _rePasswordFocusNode.hasFocus ? Color(0xFF4B0FFF) : Color(0xFFD1D1D1);
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
                Container(// 앱 바 - 완
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Color(0xFFE7E7E7),
                        )
                    ),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15, left: 24),
                      child: Row(
                        children: [
                          Container(// 뒤로가기 버튼 - 완
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/image/back_icon.png')
                                )
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      )
                  ),
                ),
                Center(
                  child: Container(// 중간 패널
                    width: 428,
                    height: 586,
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, top: 48),
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
                                fontSize: 28,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                                letterSpacing: -0.70,
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
                                height: 1.28,
                                letterSpacing: -0.35,
                              ),
                            ),
                            SizedBox(height: 48),
                            Container(
                              height: 90,
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
                                        width: 426,
                                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(width: 1, color: _borderColor), // 포커스 상태에 따른 테두리 색상 변경
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: TextFormField(
                                          focusNode: _focusNode, // 포커스 노드 사용
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
                                            contentPadding: EdgeInsets.only(bottom: 10),
                                            hintText: '이메일 입력',
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
                                  Container(
                                    height: 16,
                                    width: 426,
                                    padding: EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      '이메일이 잘못 입력 됐을 때 경고 문구',
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
                            SizedBox(height: 16),
                            Container(
                              height: 90,
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
                                        width: 426,
                                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                        decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(width: 1, color: _passwordBorderColor), // 포커스 상태에 따른 테두리 색상 변경
                                              borderRadius: BorderRadius.circular(8),
                                            )
                                        ),
                                        child: Container(
                                            color: Colors.white,
                                            child: TextFormField(
                                              obscureText: true,
                                              obscuringCharacter: '●',
                                              focusNode: _passwordFocusNode, // 포커스 노드 사용
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
                                                contentPadding: EdgeInsets.only(bottom: 10),
                                                hintText: '비밀번호 입력',
                                                hintStyle: TextStyle(
                                                  color: Color(0xFF888888),
                                                  fontSize: 16,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.5,
                                                  letterSpacing: -0.40,
                                                ),
                                              ),
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Container(
                                    height: 16,
                                    width: 426,
                                    padding: EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      '비밀번호 입력 규칙 및 잘못 입력 됐을 때 경고 문구',
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
                            SizedBox(height: 16),
                            Container(
                              height: 90,
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
                                        width: 426,
                                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                        decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(width: 1, color: _rePasswordBorderColor), // 포커스 상태에 따른 테두리 색상 변경
                                              borderRadius: BorderRadius.circular(8),
                                            )
                                        ),
                                        child: Container(
                                            color: Colors.white,
                                            child: TextFormField(
                                              obscureText: true,
                                              obscuringCharacter: '●',
                                              focusNode: _rePasswordFocusNode, // 포커스 노드 사용
                                              style: TextStyle(
                                                color: Color(0xFF3D3D3D),
                                                fontSize: 16,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w600,
                                                height: 1.5,
                                                letterSpacing: -0.40,
                                              ),
                                              textInputAction: TextInputAction.done,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(bottom: 10),
                                                hintText: '비밀번호 재입력',
                                                hintStyle: TextStyle(
                                                  color: Color(0xFF888888),
                                                  fontSize: 16,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.5,
                                                  letterSpacing: -0.40,
                                                ),
                                              ),
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Container(
                                    height: 16,
                                    width: 426,
                                    padding: EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      '비밀번호 재입력을 잘못 했을 때 경고 문구',
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



                Padding(// 다음 버튼 - 버튼 기능 추가
                    padding: EdgeInsets.only(left: 24, right: 24, bottom: 48),
                    child: SizedBox(
                      height: 52,
                      width: 428,
                      child: MaterialButton(
                        onPressed: () {

                        },
                        color: Color(0xFFAFA6FF),
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
                            height: 1.1,
                            letterSpacing: -0.53,
                            fontSize: 21,
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}