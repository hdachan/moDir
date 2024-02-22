import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(SecondPage());
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 740),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(52.0),
              child: AppBar(
                title: Text('모디랑'),
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  Container(//아이디 입력
                    width: 312.w,
                    height: 48.h,
                    margin: EdgeInsets.fromLTRB(24, 116, 24, 0),
                    padding: EdgeInsets.fromLTRB(46, 18, 0, 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFF8C8C8C),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '아이디',
                        border: InputBorder.none, // Underline 제거
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
                  Container( // 비밀번호 입력
                    width: 312.w,
                    height: 48.h,
                    margin: EdgeInsets.fromLTRB(24, 12, 24, 0),
                    padding: EdgeInsets.fromLTRB(46, 18, 0, 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFF8C8C8C),
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '비밀번호',
                        border: InputBorder.none, // Underline 제거
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
                  Container( // 로그인 버튼
                    width: 312.w,
                    height: 48.h,
                    margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                    padding: EdgeInsets.fromLTRB(135, 16, 135, 16),
                    decoration: BoxDecoration(
                      color: Color(0xFFE85884),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Color(0xFFE85884),
                      ),
                    ),
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
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}




