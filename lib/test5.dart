import 'package:flutter/material.dart';
import 'package:test_qwe/test3.dart';

void main() {
  runApp(Test5()); // Test3 위젯을 홈으로 설정
}

class Test5 extends StatefulWidget {
  // Test3을 StatefulWidget으로 정의
  @override
  _Test5State createState() => _Test5State(); // 상태 클래스를 생성
}

class _Test5State extends State<Test5> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            '견적서 작성',
            style: TextStyle(
              color: Color(0xFF3D3D3D),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              height: 1.4,
              letterSpacing: -0.45,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh), // 새로고침 아이콘으로 변경
                iconSize: 24,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 360,
                  child: Column(
                    children: [
                      Container(
                        width: 360,
                        height: 56,
                        padding: EdgeInsets.all(16), // 패딩 값 추가
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1, color: Color(0xFF3D3D3D)),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                color: Color(0xFFFF0000), // 내부 컨테이너 색상
                              ),
                            ),
                            Container(
                              width: 128,
                              height: 1,
                              color: Color(0xFFD1D1D1), // 내부 컨테이너 색상 (원하는 색상으로 변경 가능)
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1, color: Color(0xFF3D3D3D)),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                            Container(
                              width: 128,
                              height: 1,
                              color: Color(0xFFD1D1D1), // 내부 컨테이너 색상 (원하는 색상으로 변경 가능)
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1, color: Color(0xFF3D3D3D)),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 360,
                        height: 85,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 32, left: 16, right: 16),
                          child: Column(
                            // 텍스트 부분에 Column 추가
                            children: [
                              Container(
                                width: 328,
                                height: 28,
                                child: Text(
                                  '추천받고 싶은 아이템을 골라주세요',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 1.4,
                                    letterSpacing: -0.50,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8), // 사이즈 박스 추가
                              Container(
                                width: 328,
                                height: 17,
                                child: Text(
                                  '고객님이 선택하신 계절감에 맞게 아이템을 추천해드릴게요',
                                  // 원하는 텍스트로 변경 가능
                                  style: TextStyle(
                                    color: Color(0xFF888888),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 1.4,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 360,
                        height: 176,
                        padding: EdgeInsets.only(top: 24,left: 16, right: 16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '신발',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '긴팔',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '반바지',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '긴바지',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '아우터',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ), //60

                              ],
                            ),
                            SizedBox(height: 8), // 버튼과 다음 Row 사이의 간격
                            Row(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '신발',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ), //48
                                SizedBox(width: 8),
                                GestureDetector(
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '안경',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '팔찌',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '반지',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '목도리',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8), // 버튼과 다음 Row 사이의 간격
                            Row(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '모자',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ), //48
                                SizedBox(width: 8),
                                GestureDetector(
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '목걸이',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '벨트',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '반지',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '목도리',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8), // 버튼과 다음 Row 사이의 간격
                            Row(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '키링',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ), //48
                                SizedBox(width: 8),
                                GestureDetector(
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '치마',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                      borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '원피스',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 360,
                        height: 85,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 32, left: 16, right: 16),
                          child: Column(
                            // 텍스트 부분에 Column 추가
                            children: [
                              Container(
                                width: 328,
                                height: 28,
                                child: Text(
                                  '참고하신 스타일을 보내주세요 (선택)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 1.4,
                                    letterSpacing: -0.50,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8), // 사이즈 박스 추가
                              Container(
                                width: 328,
                                height: 17,
                                child: Text(
                                  '같은 패션 분야라도 사용하는 아이템마다 분위기가 달라져요',
                                  // 원하는 텍스트로 변경 가능
                                  style: TextStyle(
                                    color: Color(0xFF888888),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 1.4,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 360,
                        height: 240,
                        padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                width: 162,
                                height: 216,
                                color: Colors.red, // 원하는 색상으로 변경 가능
                              ),
                              SizedBox(width: 4), // 사이 간격
                              Container(
                                width: 162,
                                height: 216,
                                color: Colors.blue, // 원하는 색상으로 변경 가능
                              ),
                              SizedBox(width: 4), // 사이 간격
                              Container(
                                width: 162,
                                height: 216,
                                color: Colors.brown, // 원하는 색상으로 변경 가능
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 360,
                        height: 68,
                        padding: EdgeInsets.only(top: 24, left: 16, right: 16),
                        child: Center( // 중앙 정렬을 위해 Center 위젯 사용
                          child: Container(
                            width: 328,
                            height: 44,
                            alignment: Alignment.center, // 텍스트를 중앙 정렬
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                              borderRadius: BorderRadius.circular(4), // 둥글게 만들기
                            ),
                            child: Text(
                              '다시 선택하기',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF3D3D3D),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 1.4,
                                letterSpacing: -0.35,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 360,
                        height: 85,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 32, left: 16, right: 16),
                          child: Column(
                            // 텍스트 부분에 Column 추가
                            children: [
                              Container(
                                width: 328,
                                height: 28,
                                child: Text(
                                  '선호하시는 색상 1개를 골라주세요 (선택)',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 1.4,
                                    letterSpacing: -0.50,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8), // 사이즈 박스 추가
                              Container(
                                width: 328,
                                height: 17,
                                child: Text(
                                  '포인트 색상으로 아이템을 추천해줄 수도 있어요',
                                  // 원하는 텍스트로 변경 가능
                                  style: TextStyle(
                                    color: Color(0xFF888888),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 1.4,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 360,
                        height: 316,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 24, left: 16, right: 16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                      child: Container(
                                        width: 60,
                                        height: 61,
                                        padding: EdgeInsets.only(left: 10, right: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: ShapeDecoration(
                                                color: Color(0xFFFF0000), // 빨간색
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 4), // 사이 간격
                                            Container(
                                              width: 60,
                                              height: 17,
                                              alignment: Alignment.center, // 텍스트 중앙 정렬
                                              child: Text(
                                                '빨강',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFFB0B0B0),
                                                  fontSize: 12,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.4,
                                                  letterSpacing: -0.30,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                  ),
                                  SizedBox(width: 7),
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFFFC0CB), // 빨간색
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4), // 사이 간격
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center, // 텍스트 중앙 정렬
                                            child: Text(
                                              '분홍',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ),
                                  SizedBox(width: 7),
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFFFA500), // 빨간색
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4), // 사이 간격
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center, // 텍스트 중앙 정렬
                                            child: Text(
                                              '주황',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ),
                                  SizedBox(width: 7),
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFFFFF00), // 빨간색
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4), // 사이 간격
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center, // 텍스트 중앙 정렬
                                            child: Text(
                                              '노랑',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ),
                                  SizedBox(width: 7),
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF008000), // 빨간색
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4), // 사이 간격
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center, // 텍스트 중앙 정렬
                                            child: Text(
                                              '초록',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF808000), // 올리브
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4), // 사이 간격
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center, // 텍스트 중앙 정렬
                                            child: Text(
                                              '올리브',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF8F784B), // 카키
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4), // 사이 간격
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center, // 텍스트 중앙 정렬
                                            child: Text(
                                              '카키',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFA52A2A), // 갈색
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4), // 사이 간격
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center, // 텍스트 중앙 정렬
                                            child: Text(
                                              '갈색',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF8B00FF), // 보라
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4), // 사이 간격
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center, // 텍스트 중앙 정렬
                                            child: Text(
                                              '보라',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF0067A3), // 파랑
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4), // 사이 간격
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center, // 텍스트 중앙 정렬
                                            child: Text(
                                              '파랑',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16), // 여백
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF87CEEB), // 하늘색
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4), // 사이 간격
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center, // 텍스트 중앙 정렬
                                            child: Text(
                                              '하늘',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFCFFFE5), // 민트색
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4), // 사이 간격
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center, // 텍스트 중앙 정렬
                                            child: Text(
                                              '민트',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF000000), // 검정색
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4), // 사이 간격
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center, // 텍스트 중앙 정렬
                                            child: Text(
                                              '검정',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF0067A3), // 파랑 (기존 파랑색 사용)
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4), // 사이 간격
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center, // 텍스트 중앙 정렬
                                            child: Text(
                                              '파랑',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF808080), // 회색
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12), // 둥근 모서리
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4), // 사이 간격
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center, // 텍스트 중앙 정렬
                                            child: Text(
                                              '회색',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF808080),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16), // 여백
                              Row(
                                children: [
                                  // 기존 색상들...

                                  // 흰색
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFFFFFFF), // 흰색
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center,
                                            child: Text(
                                              '흰색',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),

                                  // 아이보리
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFFFF8E1), // 아이보리
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center,
                                            child: Text(
                                              '아이보리',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),

                                  // 베이지
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFF5F5DC), // 베이지
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center,
                                            child: Text(
                                              '베이지',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),

                                  // 형광
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFBFFF00), // 형광색
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center,
                                            child: Text(
                                              '형광',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),

// 기타색
                                  GestureDetector(
                                    child: Container(
                                      width: 60,
                                      height: 61,
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: ShapeDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment(0.00, -1.00),
                                                end: Alignment(0, 1),
                                                colors: [
                                                  Color(0xFFFF0000), // 빨강
                                                  Color(0xFFFFA500), // 주황
                                                  Color(0xFFFFFF00), // 노랑
                                                  Color(0xFF008000), // 초록
                                                  Color(0xFF50BCDF), // 파랑
                                                  Color(0xFF0067A3), // 파랑
                                                  Color(0xFF8B00FF), // 보라
                                                ],
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Container(
                                            width: 60,
                                            height: 17,
                                            alignment: Alignment.center,
                                            child: Text(
                                              '기타',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFFB0B0B0),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                                height: 1.4,
                                                letterSpacing: -0.30,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),


                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 360,
                        height: 194,
                        padding: EdgeInsets.only(top: 32, left: 16, right: 16),
                        child: Container(
                          width: 328,
                          height: 162,

                          padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
                          color: Color(0xFFF6F6F6),
                          child: Text(
                            '해당 컬러에 대해 추가적인 요청사항을 적어주세요.',
                            style: TextStyle(
                              color: Color(0xFFB0B0B0), // 텍스트 색상 조정 (필요에 따라)
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              letterSpacing: -0.35,
                            ),
                          ),
                        ),

                      ),



                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: double.infinity, // 전체 너비 사용
          height: 66,
          padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
            children: [
              TextButton(
                onPressed: () {
                  print("이전d없음"); // 이전 버튼 클릭 시 행동
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white, // 버튼 배경색
                  side: BorderSide(width: 1, color: Color(0xFFE7E7E7)), // 테두리 설정
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  minimumSize: Size(154, 42), // 버튼 크기
                ),
                child: Text(
                  '이전',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF3D3D3D),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    letterSpacing: -0.35,
                  ),
                ),
              ),

              SizedBox(width: 20), // 버튼 사이 간격
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Test3()), // Test3 화면으로 이동
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF3D3D3D), // 버튼 배경색
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  minimumSize: Size(154, 42), // 버튼 크기
                ),
                child: Text(
                  '다음',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFF6F6F6),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    letterSpacing: -0.35,
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
