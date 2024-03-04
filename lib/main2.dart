import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 회원가입 , 로그인 성공시 들어오는 페이지
class Main2 extends StatelessWidget {
  @override
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
                '로그인 성공화면',
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
            child: Text(
              '로그인에 성공했습니다.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        );
      },
    );
  }
}
