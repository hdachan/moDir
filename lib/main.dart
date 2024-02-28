import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main2.dart';

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
      title: 'Flutter Demo',
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 740),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Scaffold(
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
                    //아이디 입력
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
                      controller: emailController, // 이메일 컨트롤
                      decoration: InputDecoration(
                        hintText: '아이디',
                        border: InputBorder.none,
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
                  Container(
                    // 비밀번호 입력
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
                      controller: passwordController,
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
                  Container(
                    // 로그인 버튼
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
                    child: TextButton(
                      onPressed: () async {
                        UserCredential? user = await signInWithEmailAndPassword(
                            emailController.text, passwordController.text);
                        if (user != null) {
                          print("Login Successful");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Main2()),
                          );
                        } else {
                          print("Login Failed");
                        }
                      },
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
                    ),
                  ),

                ],
              ),
            ),
          );
        });
  }
}
