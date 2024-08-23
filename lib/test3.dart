import 'package:flutter/material.dart';
import 'package:test_qwe/test5.dart';

import 'test4.dart';

void main() {
  runApp(Test3());
}


class Test3 extends StatefulWidget { // Test3를 StatefulWidget으로 변경
  @override
  _Test3State createState() => _Test3State(); // 상태 클래스를 생성
}

class _Test3State extends State<Test3> {
  String _warningMessage = ''; // 경고 메시지 상태 변수

  void _showSlimFitWarning() {
    setState(() {
      _warningMessage = '몸에 딱 맞는 핏으로 세련된 느낌을 강조'; // 슬림핏 클릭 시 메시지 설정
    });
  }

  void _showRegularFitWarning() {
    setState(() {
      _warningMessage = '기본적인 핏으로 몸에 적당히 맞아 깔끔한 인상'; // 레귤러핏 클릭 시 메시지 설정
    });
  }

  void _showWarning3() {
    setState(() {
      _warningMessage = '오버핏보다 조금 더 슬림한 여유를 가진 핏'; // 레귤러핏 클릭 시 메시지 설정
    });
  }

  void _showWarning4() {
    setState(() {
      _warningMessage = '여유있는 실루엣으로 편안하고 캐주얼한 느낌'; // 레귤러핏 클릭 시 메시지 설정
    });
  }

  void _showWarning5() {
    setState(() {
      _warningMessage = '허리선 위로 잘린 형태로, 다리 길이를 강조'; // 레귤러핏 클릭 시 메시지 설정
    });
  }

  void _showWarning6() {
    setState(() {
      _warningMessage = '엉덩이 아래까지 오는 기장으로 길고 여유있는 실루엣'; // 레귤러핏 클릭 시 메시지 설정
    });
  }
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
                        color: Color(0xFF4F4F4F),
                      ),
                      Container(
                        width: 360,
                        height: 85,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
                          child: Column( // 텍스트 부분에 Column 추가
                            children: [
                              Container(
                                width: 328,
                                height: 28,
                                child: Text(
                                  '희망하시는 핏을 골라주세요',
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
                                  '고객님이 선택하신 핏에 맞게 아이템을 추천해드릴게요', // 원하는 텍스트로 변경 가능
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
                        height: 186,
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 24), // 패딩 추가
                        child: Column(
                          children: [
                            Container(
                              width: 328,
                              height: 16,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬
                                children: [
                                  Text(
                                    '아우터',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 1.0,
                                      letterSpacing: -0.40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16), // 필요 시 간격 추가
                            Container(
                              width: 328,
                              height: 72, // 필요에 따라 높이 조정
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start, // 상단 왼쪽 정렬
                                    children: [
                                      GestureDetector(
                                        onTap: _showSlimFitWarning,
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '슬림핏',
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
                                        onTap: _showRegularFitWarning,
                                        child: Container(
                                          width: 72,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '레귤러핏',
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
                                        onTap: _showWarning3,
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '루즈핏',
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
                                        onTap: _showWarning4,
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '오버핏',
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
                                        onTap: _showWarning5,
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '크롭핏',
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
                                        onTap: _showWarning6,
                                        child: Container(
                                          width: 48,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '롱핏',
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
                            SizedBox(height: 16), // 필요 시 간격 추가
                            if (_warningMessage.isNotEmpty) WarningContainer(_warningMessage),

                          ],
                        ),
                      ),

                      Container(
                        width: 360,
                        height: 186,
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 24), // 패딩 추가
                        child: Column(
                          children: [
                            Container(
                              width: 328,
                              height: 16,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬
                                children: [
                                  Text(
                                    '상의',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 1.0,
                                      letterSpacing: -0.40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16), // 필요 시 간격 추가
                            Container(
                              width: 328,
                              height: 72, // 필요에 따라 높이 조정
                              child: Column( // Column으로 변경
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start, // 상단 왼쪽 정렬
                                    children: [
                                      GestureDetector(
                                        onTap: _showSlimFitWarning,
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '슬림핏',
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
                                        onTap: _showRegularFitWarning,
                                        child: Container(
                                          width: 72,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '레귤러핏',
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
                                        onTap: _showWarning3,
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '루즈핏',
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
                                        onTap: _showWarning4,
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '오버핏',
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
                                        onTap: _showWarning5,
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '크롭핏',
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
                                        onTap: _showWarning6,
                                        child: Container(
                                          width: 48,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '롱핏',
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
                            SizedBox(height: 16), // 필요 시 간격 추가
                            if (_warningMessage.isNotEmpty) WarningContainer(_warningMessage),

                          ],
                        ),
                      ),
                      Container(
                        width: 360,
                        height: 186,
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 24), // 패딩 추가
                        child: Column(
                          children: [
                            Container(
                              width: 328,
                              height: 16,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬
                                children: [
                                  Text(
                                    '하의',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 1.0,
                                      letterSpacing: -0.40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16), // 필요 시 간격 추가
                            Container(
                              width: 328,
                              height: 72, // 필요에 따라 높이 조정
                              child: Column( // Column으로 변경
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start, // 상단 왼쪽 정렬
                                    children: [
                                      GestureDetector(
                                        onTap: _showSlimFitWarning,
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '슬림핏',
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
                                        onTap: _showRegularFitWarning,
                                        child: Container(
                                          width: 72,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '레귤러핏',
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
                                        onTap: _showWarning3,
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '루즈핏',
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
                                        onTap: _showWarning4,
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '오버핏',
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
                                        onTap: _showWarning5,
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '크롭핏',
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
                                        onTap: _showWarning6,
                                        child: Container(
                                          width: 48,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(width: 1, color: Color(0xFFE7E7E7)), // 테두리 색상
                                            borderRadius: BorderRadius.circular(100), // 둥글게 만들기
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '롱핏',
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
                            SizedBox(height: 16), // 필요 시 간격 추가
                            if (_warningMessage.isNotEmpty) WarningContainer(_warningMessage),

                          ],
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Test5()), // Test3 화면으로 이동
                  );
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
                    MaterialPageRoute(builder: (context) => Test4()), // Test3 화면으로 이동
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
Widget WarningContainer(String message) {
  return Container(
    width: 328,
    height: 42,
    color: Color(0xFFF1F0FF),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    child: Row(
      children: [
        Container(
          width: 18,
          height: 18,
          alignment: Alignment.center,
          child: Icon(
            Icons.error_outline, // 공백 제거
            size: 18,
          ),
        ),
        SizedBox(width: 8),
        Container(
          width: 270,
          height: 18,
          child: Text(
            message, // 매개변수로 받은 메시지 사용
            style: TextStyle(
              color: Color(0xFF5D5D5D),
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.5,
              letterSpacing: -0.30,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
