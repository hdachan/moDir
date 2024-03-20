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


//                                            동의 2번 부분에 적어 놓겠음.(메서드)


class AgreePage extends StatelessWidget {
  const AgreePage({super.key});

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
                          Text(// 제목 - 완
                            '모디랑\n이용약관 동의',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 28,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                              letterSpacing: -0.7,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(// 설명 - 완
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
                          SizedBox(height: 48),
                          Container(// 전체 동의 부분 - 버튼 기능 추가
                            width: 428,
                            height: 48,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.5,color: Color(0xFF8773FF)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                              child: Row(
                                children: [
                                  Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/image/check_icon.png')
                                      )
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    height: 28,
                                    padding: EdgeInsets.symmetric(vertical: 3),
                                    child: Row(
                                      children: const [
                                        Text(
                                          '전체 약관동의',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF888888),
                                            fontSize: 16,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w600,
                                            height: 1.375,
                                            letterSpacing: -0.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 12),

                          Row(// 동의 1번 부분 - 아이콘, 텍스트 메서드로 변경 / 버튼 기능 추가
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                  height: 48,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage('assets/image/check_icon.png')
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 3),
                                        child: Row(
                                          children: const [
                                            Text(
                                              '(필수) 이용 약관 동의',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF888888),
                                                fontSize: 14,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w500,
                                                height: 1.3,
                                                letterSpacing: -0.35,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(// 약관 더보기 부분 - 메서드 / 버튼 기능 추가
                                width: 31,
                                height: 28,
                                margin: EdgeInsets.only(right: 12),
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  '더보기',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFB0B0B0),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFB0B0B0),
                                    height: 1.3,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),



//-------------------------------------------여기서 부터는 같은 코드 3개 + 다음 버튼--------------------------------------------------------------
//                                            동의 2번 부분에 적어 놓겠음.(메서드)
//           온보딩 처럼 콘텐츠 만들고 불러 오는 식으로 하면 좋을 듯 함 생각하니까 메서드는 아래꺼 그대로 만들고 콘텐츠에서 텍스트만 불러오면 될 듯?
//                                                       필요하면 부르셈


                          Row(// 동의 2번 부분 - 아이콘, 텍스트 메서드로 변경 / 버튼 기능 추가
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                  height: 48,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage('assets/image/check_icon.png')
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 3),
                                        child: Row(
                                          children: const [
                                            Text(
                                              '(필수) 개인정보 수집 동의',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF888888),
                                                fontSize: 14,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w500,
                                                height: 1.3,
                                                letterSpacing: -0.35,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(// 약관 더보기 부분 - 메서드 / 버튼 기능 추가
                                width: 31,
                                height: 28,
                                margin: EdgeInsets.only(right: 12),
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  '더보기',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFB0B0B0),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFB0B0B0),
                                    height: 1.3,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Row(// 동의 3번 부분 - 아이콘, 텍스트 메서드로 변경 / 버튼 기능 추가
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                  height: 48,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage('assets/image/check_icon.png')
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 3),
                                        child: Row(
                                          children: const [
                                            Text(
                                              '(필수) 전금 금융 거래 이용 약관 동의',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF888888),
                                                fontSize: 14,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w500,
                                                height: 1.3,
                                                letterSpacing: -0.35,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(// 약관 더보기 부분 - 메서드 / 버튼 기능 추가
                                width: 31,
                                height: 28,
                                margin: EdgeInsets.only(right: 12),
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  '더보기',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFB0B0B0),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFB0B0B0),
                                    height: 1.3,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Row(// 동의 4번 부분 - 아이콘, 텍스트 메서드로 변경 / 버튼 기능 추가
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                  height: 48,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage('assets/image/check_icon.png')
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 3),
                                        child: Row(
                                          children: const [
                                            Text(
                                              '(선택) 이벤트 및 마케팅 이용 약관 동의',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF888888),
                                                fontSize: 14,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w500,
                                                height: 1.3,
                                                letterSpacing: -0.35,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(// 약관 더보기 부분 - 메서드 / 버튼 기능 추가
                                width: 31,
                                height: 28,
                                margin: EdgeInsets.only(right: 12),
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  '더보기',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFB0B0B0),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFB0B0B0),
                                    height: 1.3,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(// 다음 버튼 - 버튼 기능 추가(필수 항목 체크 완료 시 활성화)
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
