import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'login_screen.dart';

// 이거는 걍 나도 모르겠음 해줘 원담 ㅎㅎㅎ
// 온보딩 화면
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDogzalL_f-tEOiqOrBSfN8Amzc64l_nLw',
      appId: '1:531305378076:android:31a98cc7b8d92f337b4ad9',
      messagingSenderId: '531305378076',
      projectId: 'modir-d8182',
      storageBucket: 'modir-d8182.appspot.com',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '모디랑',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  List<String> imageList = ['assets/image/bad.png', 'assets/image/fox.png', 'assets/image/tog.png'];


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
                    width: 360.w,
                    height: 54.h,
                    margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    //clipBehavior: Clip.antiAlias,
                    //decoration: BoxDecoration(color: Colors.redAccent),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '타이포그래피 좋은 거 추천좀\n온보딩 텍스트는 무조건 두 줄',
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 21,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.53,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 312.w,
                    height: 400.h,
                    margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                    //decoration: BoxDecoration(color: Colors.cyan),
                    child: Stack(
                        children: [
                          CarouselSlider(
                            carouselController: _controller,
                            options: CarouselOptions(
                                autoPlay: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }
                            ),
                            items: imageList.map((item) => Image.asset(item)).toList(),
                          ),
                          Positioned(
                            bottom: 10.0,
                            left: 0.0,
                            right: 0.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imageList.map((url) {
                                int index = imageList.indexOf(url);
                                return Container(
                                  width: 14.0.w,
                                  height: 14.0.h,
                                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _current == index
                                          ? Color(0xFF5B14FF)
                                          : Color(0xFFD9D9D9)
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ]
                    ),
                  ),

                  Container(
                    width: 312.w,
                    height: 54.h,
                    margin: EdgeInsets.fromLTRB(24, 90, 24, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFF4C0EFF),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0xFF4C0EFF),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => login_screen()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                        child: Text(
                          '시작하기',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.45,
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          );
        });
  }
}
