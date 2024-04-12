import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}

bool _isCheck = false;

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              width: 426,
              height: 321,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
                    width: 146,
                    height: 29,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/eng_logo.png')
                      )
                    ),
                  ),
                  SizedBox(height: 48),
                  Column(
                    children: [
                      Container(
                        height: 42,
                        width: 428,
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1,
                                color: Color(0xFFD1D1D1),
                            ),
                            borderRadius: BorderRadius.circular(8)
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.28,
                            letterSpacing: -0.35,
                          ),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding:
                            EdgeInsets.only(bottom: 10),
                            hintText: '이메일',
                            hintStyle: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.28,
                              letterSpacing: -0.35,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        height: 42,
                        width: 428,
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Color(0xFFD1D1D1),
                              ),
                              borderRadius: BorderRadius.circular(8)
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.28,
                            letterSpacing: -0.35,
                          ),
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding:
                            EdgeInsets.only(bottom: 10),
                            hintText: '비밀번호',
                            hintStyle: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.28,
                              letterSpacing: -0.35,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        height: 24,
                        width: 428,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Checkbox(
                                value: _isCheck,
                                onChanged: (value) {
                                  setState(() {
                                    _isCheck = value!;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)
                                ),
                                side: BorderSide(
                                  color: Color(0xFF888888),
                                  width: 1
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              height: 24,
                              width: 70,
                              padding: EdgeInsets.symmetric(vertical: 3),
                              child: Column(
                                children: const [
                                  Text(
                                    '자동로그인',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 1.28,
                                    )
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        height: 52,
                        width: 428,
                        child: MaterialButton(
                          onPressed: () {

                          },
                          color: Color(0xFF4B0FFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            '로그인',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              letterSpacing: -0.4,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 135,
                            height: 24,
                            padding: EdgeInsets.symmetric(vertical: 3),
                            child: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 18,
                                  child: TextButton(
                                    onPressed: (){

                                    },
                                    child: Text(
                                      '회원가입',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.28,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Container(
                                  width: 75,
                                  height: 18,
                                  child: TextButton(
                                    onPressed: (){

                                    },
                                    child: Text(
                                      '비밀번호 찾기',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.28,
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
