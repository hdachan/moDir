import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              width: 426,
              height: 309,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
                    width: 146,
                    height: 29,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/logo_10.png')
                      )
                    ),
                  ),
                  SizedBox(height: 48),
                  Column(
                    children: [
                      Container(
                        height: 48,
                        width: 428,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
                          controller: _textController,
                          onChanged: (text){
                            setState(() {
                            });
                          },
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
                            contentPadding: EdgeInsets.only(bottom: 10),
                            hintText: '이메일',
                            hintStyle: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.28,
                              letterSpacing: -0.35,
                            ),
                            suffixIcon: _textController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: (){
                                    _textController.clear();
                                    setState(() {});
                                  },
                                  padding: EdgeInsets.only(bottom: 10, left: 60),
                                  icon: Icon(Icons.cancel, color: Color(0xFF888888))) : null
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 48,
                        width: 428,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
                          controller: _textController2,
                          onChanged: (text){
                            setState(() {
                            });
                          },
                          obscureText: _isObscured,
                          obscuringCharacter: '●',
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscured
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xFF888888),
                              ),
                              padding: EdgeInsets.only(left: 60),//이게 들어 가서 왜 위 아래가 잡히는 지 몰겠네
                              onPressed: () {
                                setState(() {
                                  _isObscured = !_isObscured;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        height: 48,
                        width: 428,
                        child: MaterialButton(
                          onPressed: () {

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
                            height: 24,
                            child: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 24,
                                  child: TextButton(
                                    onPressed: (){

                                    },
                                    style: OutlinedButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.only(
                                        top: 3,
                                        bottom: 3
                                      )
                                    ),
                                    child: Text(
                                      "회원가입",
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
                                  height: 24,
                                  child: TextButton(
                                    onPressed: (){

                                    },
                                    style: OutlinedButton.styleFrom(
                                        minimumSize: Size.zero,
                                        padding: EdgeInsets.only(
                                            top: 3,
                                            bottom: 3
                                        )
                                    ),
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
