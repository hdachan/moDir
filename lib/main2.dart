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
                  Container(
                    width: 312.w,
                    height: 48.h,
                    margin: EdgeInsets.fromLTRB(24, 116, 24, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFF8C8C8C),
                      ),
                    ),
                  ),
                  Container(
                    width: 312.w,
                    height: 48.h,
                    margin: EdgeInsets.fromLTRB(24, 12, 24, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFF8C8C8C),
                      ),
                    ),
                  ),
                  Container(
                    width: 312.w,
                    height: 48.h,
                    margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFFE85884),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Color(0xFFE85884),
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




