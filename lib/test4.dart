import 'package:flutter/material.dart';
import 'package:test_qwe/test3.dart';
import 'package:test_qwe/test5.dart';

void main() {
  runApp(Test4()); // Test3 위젯을 홈으로 설정
}

class Test4 extends StatefulWidget {
  // Test3을 StatefulWidget으로 정의
  @override
  _Test4State createState() => _Test4State(); // 상태 클래스를 생성
}

class _Test4State extends State<Test4> {
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
                          padding: const EdgeInsets.only(
                              top: 32, left: 16, right: 16),
                          child: Column(
                            // 텍스트 부분에 Column 추가
                            children: [
                              Container(
                                width: 328,
                                height: 28,
                                child: Text(
                                  '희망하시는 계절감을 골라주세요',
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
                        height: 56,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 24, left: 16, right: 16),
                          child: Row(
                            // 텍스트 부분에 Column 추가
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: 37,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Color(0xFFE7E7E7)),
                                    // 테두리 색상
                                    borderRadius:
                                        BorderRadius.circular(100), // 둥글게 만들기
                                  ),
                                  alignment: Alignment.center,
                                  // 텍스트 중앙 정렬
                                  child: Text(
                                    '봄',
                                    style: TextStyle(
                                      color: Color(0xFF5D5D5D),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.14,
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
                                    border: Border.all(
                                        width: 1, color: Color(0xFFE7E7E7)),
                                    // 테두리 색상
                                    borderRadius:
                                        BorderRadius.circular(100), // 둥글게 만들기
                                  ),
                                  alignment: Alignment.center,
                                  // 텍스트 중앙 정렬
                                  child: Text(
                                    '여름',
                                    style: TextStyle(
                                      color: Color(0xFF5D5D5D),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.14,
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
                                    border: Border.all(
                                        width: 1, color: Color(0xFFE7E7E7)),
                                    // 테두리 색상
                                    borderRadius:
                                        BorderRadius.circular(100), // 둥글게 만들기
                                  ),
                                  alignment: Alignment.center,
                                  // 텍스트 중앙 정렬
                                  child: Text(
                                    '가을',
                                    style: TextStyle(
                                      color: Color(0xFF5D5D5D),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.14,
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
                                    border: Border.all(
                                        width: 1, color: Color(0xFFE7E7E7)),
                                    // 테두리 색상
                                    borderRadius:
                                        BorderRadius.circular(100), // 둥글게 만들기
                                  ),
                                  alignment: Alignment.center,
                                  // 텍스트 중앙 정렬
                                  child: Text(
                                    '겨울',
                                    style: TextStyle(
                                      color: Color(0xFF5D5D5D),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.14,
                                      letterSpacing: -0.35,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                                  '희망하시는 금액을 골라주세요',
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
                                  '너무 낮은 금액은 분석 거절 사유가 될 수도 있어요',
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
                        height: 66,
                        color: Colors.black,
                        padding:
                            const EdgeInsets.only(top: 24, left: 16, right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // 세로 중앙 정렬
                          children: [
                            Container(
                              width: 328,
                              height: 42,
                              color: Colors.blue, // 배경 색상 예시
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
                                  '소화 가능한 패션 레벨을 알려주세요',
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
                                  '레벨에 따라서 패션 아이템의 디테일이 달라져요', // 원하는 텍스트로 변경 가능
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
                        width: 328,
                        height: 312,
                        padding:
                            const EdgeInsets.only(top: 24, left: 16, right: 16),
                        child: Column(
                          children: [
                            Container(
                              width: 328,
                              height: 60,
                              // 첫 번째 박스 색상
                              padding: EdgeInsets.only(top: 11, bottom: 11, left: 16, right: 16),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1, color: Color(0xFFE7E7E7)),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 296,
                                    height: 16,
                                    child: Text(
                                      '무난',
                                      style: TextStyle(
                                        color: Color(0xFF3D3D3D),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1.0,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 8),
                                  Container(
                                    width: 296,
                                    height: 12,
                                    child: Text(
                                      '기본 아이템을 활용한 간단한 조합',
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1.0,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 16), // 사이즈 박스
                            Container(
                              width: 328,
                              height: 60,
                              // 첫 번째 박스 색상
                              padding: EdgeInsets.only(top: 11, bottom: 11, left: 16, right: 16),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1, color: Color(0xFFE7E7E7)),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 296,
                                    height: 16,
                                    child: Text(
                                      '뽀인트',
                                      style: TextStyle(
                                        color: Color(0xFF3D3D3D),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1.0,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 8),
                                  Container(
                                    width: 296,
                                    height: 12,
                                    child: Text(
                                      '다양한 스타일의 아이템을 조합하여 개성을 표현',
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1.0,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16), // 사이즈 박스
                            Container(
                              width: 328,
                              height: 60,
                              // 첫 번째 박스 색상
                              padding: EdgeInsets.only(top: 11, bottom: 11, left: 16, right: 16),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1, color: Color(0xFFE7E7E7)),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 296,
                                    height: 16,
                                    child: Text(
                                      '관종',
                                      style: TextStyle(
                                        color: Color(0xFF3D3D3D),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1.0,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 8),
                                  Container(
                                    width: 296,
                                    height: 12,
                                    child: Text(
                                      '트렌드를 반영한 세련된 레이어링과 액세서리 활용',
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1.0,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16), // 사이즈 박스
                            Container(
                              width: 328,
                              height: 60,
                              // 첫 번째 박스 색상
                              padding: EdgeInsets.only(top: 11, bottom: 11, left: 16, right: 16),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1, color: Color(0xFFE7E7E7)),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 296,
                                    height: 16,
                                    child: Text(
                                      '선두자',
                                      style: TextStyle(
                                        color: Color(0xFF3D3D3D),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1.0,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 8),
                                  Container(
                                    width: 296,
                                    height: 12,
                                    child: Text(
                                      '패션의 모든 요소를 활용하여 독창적인 스타일 구축',
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1.0,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                  ),
                                ],
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
                                  '추가로 전달하고 싶은 정보 (선택)',
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
                                  '스타일리스트가 참고할만한 추가 사항이 있을까요?',
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
                        height: 356,
                        padding: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 48),
                        child: Container(
                          width: 328,
                          height: 284, // 내부 컨테이너 크기
                          color: Color(0xFFF6F6F6),
                          padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16), // 패딩 설정
                          child: Container(
                            width: 296,
                            height: 252, // 새로 추가한 컨테이너 크기
                            child: Text(
                              '내용을 입력하세요\n\n금지 행위\n-타인의 권리를 침해하거나 불쾌감을 주는 행위\n-범죄, 불법, 행위 등 법령을 위반하는 행위\n-욕설, 비하, 차별, 혐오, 자살, 폭력 관련 내용을 포함한 내용을 작성하는 행위\n    -음란물, 성적 수치심을 유발하는 행위\n    -스포일러, 공포, 속임, 놀라게 하는 내용\n\n등을 작성하는 분은 영구적으로 회원자격이 해지되며, 관련 법률에 따라 처벌받을 수 있습니다.',
                              style: TextStyle(
                                color: Color(0xFFB0B0B0),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                letterSpacing: -0.35,
                              ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Test3()), // Test3 화면으로 이동
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
                  print("다음없음");
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
