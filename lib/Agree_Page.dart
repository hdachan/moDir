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
  runApp(AgreePage());
}

class AgreePage extends StatelessWidget {
  const AgreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
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
                      Container(
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
              Container(
                width: double.infinity,
                height: 586,
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 48, bottom: 124, right: 24, left: 24),
                  child: Container(
                    height: 114,
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '모디랑\n이용약관 동의',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 28,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            letterSpacing: -0.70,
                          ),
                        ),
                        Container(height: 10),
                        Text(
                          '모디랑 서비스 시작 및 가입을 위해\n정보 제공에 동의해 주세요!',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                            letterSpacing: -0.35,
                          ),
                        ),
                        Container(height: 48),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 48),
                child: Container(
                  height: 52,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {

                    },
                    color: Color(0xFF4B0FFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      '다음',
                      style: TextStyle(
                        color: Colors.white,
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
