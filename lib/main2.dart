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
          body: Center(
            child: Column(
              children: [
                Container(
                  width: 96.w,
                  height: 24.h,
                  margin: EdgeInsets.fromLTRB(24, 10, 240, 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
