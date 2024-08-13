import 'package:flutter/material.dart';

class Test2Screen extends StatelessWidget {
  final String designerId;
  final String name;
  final String introduction;
  final String classification;
  final double price;
  final String imageUrl;

  // 생성자
  Test2Screen({
    required this.designerId,
    required this.name,
    required this.introduction,
    required this.classification,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          width: 360,
          height: 48,
          child: Stack(
            children: [
              Positioned(
                top: 14,
                left: 12,
                child: Image.asset(
                  'assets/image/logo_modi.png',
                  width: 34,
                  height: 20,
                ),
              ),
              Positioned(
                right: 0,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.search, size: 24),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.notifications, size: 24),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 360,
                  child: Column(
                    children: [
                      Container(
                        height: 476,
                        width: 360,
                        //decoration: BoxDecoration(color: Colors.blue),
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              width: 360,
                              color: Colors.black,
                            ), // 사진
                            Container(
                              // 글씨 넣는 부분
                              height: 158,
                              width: 360,
                              //color: Colors.redAccent,
                              padding:
                                  EdgeInsets.only(top: 52, left: 16, right: 16),
                              // 패딩 설정
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // 텍스트 왼쪽 정렬
                                children: [
                                  Text(
                                    '코디 맛있게 해드려요!',
                                    style: TextStyle(
                                      color: Color(0xFF3D3D3D),
                                      fontSize: 22,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.55,
                                      height: 1.4,
                                    ),
                                  ),
                                  SizedBox(height: 8), // 사이즈 박스 추가
                                  Text(
                                    '인혜엄',
                                    style: TextStyle(
                                      color: Color(0xFF3D3D3D),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.40,
                                      height: 1.2,
                                    ),
                                  ),
                                  SizedBox(height: 8), // 사이즈 박스 추가
                                  Text(
                                    '본인의 개성을 잃지않고 트렌드를 따라갈 수 있게 만들어 드릴게요! 저만 믿고 따라오세용~',
                                    style: TextStyle(
                                      color: Color(0xFF5D5D5D),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.35,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ), // 텍스트 넣는곳
                            Container(
                              height: 32,
                              width: 360,
                              // 배경색을 흰색으로 변경
                              padding:
                                  EdgeInsets.only(top: 12, left: 16, right: 16),
                              // 패딩 설정
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 47,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE6E4FF), // 배경색 설정
                                      borderRadius:
                                          BorderRadius.circular(4), // 라운드 설정
                                    ),
                                    child: Center(
                                      // 텍스트를 정중앙에 배치
                                      child: Text(
                                        '미니멀',
                                        style: TextStyle(
                                          color: Color(0xFF3D3D3D),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                          height: 1.0,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8), // 간격 8 추가
                                  Container(
                                    height: 20,
                                    width: 47,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE6E4FF), // 배경색 설정
                                      borderRadius:
                                          BorderRadius.circular(4), // 라운드 설정
                                    ),
                                    child: Center(
                                      // 텍스트를 정중앙에 배치
                                      child: Text(
                                        '캐주얼',
                                        style: TextStyle(
                                          color: Color(0xFF3D3D3D),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                          height: 1.0,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8), // 간격 8 추가
                                  Container(
                                    height: 20,
                                    width: 47,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE6E4FF), // 배경색 설정
                                      borderRadius:
                                          BorderRadius.circular(4), // 라운드 설정
                                    ),
                                    child: Center(
                                      // 텍스트를 정중앙에 배치
                                      child: Text(
                                        '빈티지',
                                        style: TextStyle(
                                          color: Color(0xFF3D3D3D),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                          height: 1.0,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ), //미니멀/캐주얼/빈티지
                            Container(
                              height: 86,
                              width: 360,
                              //color: Colors.red,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 16, right: 16, top: 24, bottom: 24),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 14,
                                          width: 164,
                                          //color: Colors.blue, // 첫 번째 Container
                                          child: Text(
                                            '스타일대상',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF888888),
                                              fontSize: 12,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w400,
                                              height: 1.2,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 14,
                                          width: 164,
                                          //color: Colors.blue, // 두 번째 Container
                                          child: Text(
                                            '별점',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF888888),
                                              fontSize: 12,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w400,
                                              height: 1.2,
                                              letterSpacing: -0.30,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 164,
                                          child: Center(
                                            // Center 추가
                                            child: Text(
                                              '여성',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.40,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                          width: 164,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                            children: [
                                              Icon(
                                                Icons.star, // 사용할 아이콘
                                                color: Colors.yellow, // 아이콘 색상
                                                size: 20, // 아이콘 크기
                                              ),
                                              SizedBox(width: 4), // 간격 추가
                                              Text(
                                                '4.9',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: -0.40,
                                                ),
                                              ),
                                              SizedBox(width: 2), // 간격 추가
                                              Text(
                                                '(1,053)',
                                                style: TextStyle(
                                                  color: Color(0xFF888888),
                                                  fontSize: 12,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.11,
                                                  letterSpacing: -0.30,
                                                ),
                                              )
                                            ],
                                          ),

                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8), // 사이즈 박스 추가
                      Container(
                        width: 360,
                        height: 1827,
                        //decoration: BoxDecoration(color: Colors.blue),
                        child: Column(
                          children: [
                            Container(
                              height: 40,
                              width: 360,
                              color: Colors.purple,
                            ), //탭바
                            Container(
                              height: 522,
                              width: 360,
                              //color: Colors.yellow,
                              child: Column(
                                children: [
                                  Container( // 디자이너 정보
                                    height: 143,
                                    width: 360,
                                    child: Column(
                                      children: [
                                        Container( //
                                          height: 67,
                                          width: 360,
                                          padding: EdgeInsets.only(top: 36, bottom: 12, left: 16, right: 16), // 패딩 설정
                                          child: Text(
                                            '디자이너 정보',
                                            style: TextStyle(
                                              color: Color(0xFF3D3D3D),
                                              fontSize: 16,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w600,
                                              height: 1.2,
                                              letterSpacing: -0.40,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 76,
                                          width: 360,
                                          padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16), // 패딩 설정
                                          child: Column( // Column으로 변경하여 여러 텍스트를 추가할 수 있게 함
                                            crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬 설정
                                            children: [
                                              Text(
                                                '견적 비용 : 20,000원',
                                                style: TextStyle(
                                                  color: Color(0xFF5D5D5D),
                                                  fontSize: 14,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.3,
                                                  letterSpacing: -0.35,
                                                ),
                                              ),
                                              SizedBox(height: 12), // 사이즈박스 추가
                                              Text(
                                                '견적 소요 시간 : 평균 2~3일',
                                                style: TextStyle(
                                                  color: Color(0xFF5D5D5D),
                                                  fontSize: 14,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.3,
                                                  letterSpacing: -0.35,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )

                                        ,
                                      ],
                                    ),
                                  ),


                                  Container(
                                    height: 271,
                                    width: 360,
                                    color: Colors.blueAccent,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test2 Screen Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Test2Screen(
        designerId: '1',
        name: '디자이너 이름',
        introduction: '디자이너 소개',
        classification: '디자이너 분류',
        price: 100.0,
        imageUrl: 'assets/image/sample_image.png', // 실제 이미지 경로로 수정
      ),
    );
  }
}
