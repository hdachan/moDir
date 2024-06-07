import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ChangePassword(),
  ));
}

bool _isObscured = true;
bool _isObscured2 = true;

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _textController = TextEditingController();
  final _textController2 = TextEditingController();

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
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ),
                          Container(
                            width: 96,
                            height: 18,
                            child: Text(
                              '비밀번호 변경',
                              style: TextStyle(
                                color: Color(0xFF3D3D3D),
                                fontSize: 18,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.0,
                                letterSpacing: -0.45,
                              ),
                            ),
                          ),
                          SizedBox(width: 24)
                        ],
                      )),
                ),
                Center(
                  child: SizedBox(
                    width: 428,
                    height: 592,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, top: 48),
                      child: SizedBox(
                        width: 246,
                        height: 77,
                        child: Column(
                          children: [
                            Text(
                              '비밀번호 변경',
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
                              '비밀번호 변경 후 보안을 위해 로그아웃 됩니다.\n재로그인 해주세요.',
                              textAlign: TextAlign.center,
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
                            SizedBox(
                              height: 82,
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
                                          '현재 비밀번호 입력',
                                          style: TextStyle(
                                            color: Color(0xFF3D3D3D),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.0,
                                            letterSpacing: -0.35,
                                          ),
                                        ),
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
                                            vertical: 12, horizontal: 12),
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFFD1D1D1)),
                                            // 포커스 상태에 따른 테두리 색상 변경
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: TextFormField(
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
                                              hintText: '현재 비밀번호 입력',
                                              hintStyle: TextStyle(
                                                color: Color(0xFF888888),
                                                fontSize: 16,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w500,
                                                height: 1.0,
                                                letterSpacing: -0.40,
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Container(
                                    height: 12,
                                    width: 428,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      '임시 오류 메세지',
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
                            SizedBox(
                              height: 82,
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
                                          '새로운 비밀번호 입력',
                                          style: TextStyle(
                                            color: Color(0xFF3D3D3D),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.0,
                                            letterSpacing: -0.35,
                                          ),
                                        ),
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
                                            vertical: 12, horizontal: 12),
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFFD1D1D1)),
                                            // 포커스 상태에 따른 테두리 색상 변경
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: TextFormField(
                                            controller: _textController,
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
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.only(bottom: 10),
                                              hintText: '새로운 비밀번호 입력',
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
                                                  _isObscured2
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
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Container(
                                    height: 12,
                                    width: 428,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      '비밀번호 규칙',
                                      // 이전에 정의한 errorMessage 변수 사용
                                      style: TextStyle(
                                        color: Color(0xFFB0B0B0),
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
                            SizedBox(
                              height: 82,
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
                                          '새로운 비밀번호 재입력',
                                          style: TextStyle(
                                            color: Color(0xFF3D3D3D),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.0,
                                            letterSpacing: -0.35,
                                          ),
                                        ),
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
                                            vertical: 12, horizontal: 12),
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFFD1D1D1)),
                                            // 포커스 상태에 따른 테두리 색상 변경
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
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
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.only(bottom: 10),
                                              hintText: '새로운 비밀번호 재입력',
                                              hintStyle: TextStyle(
                                                color: Color(0xFF888888),
                                                fontSize: 16,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w500,
                                                height: 1.0,
                                                letterSpacing: -0.40,
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Container(
                                    height: 12,
                                    width: 428,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                    child: Text(
                                      '임시 오류 메세지',
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
                        onPressed: () {},
                        color: Color(0xFF4B0FFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          '비밀번호 변경',
                          style: TextStyle(
                            color: Colors.white,
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
