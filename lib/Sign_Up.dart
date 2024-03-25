import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
  runApp(SignupPage());
}


class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
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
    );
  }
}