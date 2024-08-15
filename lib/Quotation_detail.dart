import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: QuotationPage(),
  ));
}

class QuotationPage extends StatefulWidget {
  @override
  _QuotationPageState createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // 탭의 개수 설정
  }

  @override
  void dispose() {
    _tabController.dispose(); // 리소스 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              '스타일링 내역',
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
                    icon: Icon(Icons.home_outlined),
                    iconSize: 24),
              )
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: 360,
                      height: 120,
                      child: Column(
                        children: [
                          Container(
                            width: 360,
                            height: 44,
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: TabBar(
                              controller: _tabController,
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
                              tabs: [
                                Tab(
                                  child: Text(
                                    '진행중',
                                    textAlign: TextAlign.center,
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
                                Tab(
                                  child: Text(
                                    '지난내역',
                                    textAlign: TextAlign.center,
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
                              ],
                              indicatorColor: Color(0xFF3D3D3D),
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorPadding:
                                  EdgeInsets.only(top: 12, bottom: 0),
                              labelPadding: EdgeInsets.only(left: 6, right: 6),
                            ),
                          ),
                          Divider(
                            color: Color(0xFFF6F6F6),
                            height: 2.0,
                            thickness: 2.0,
                          ),
                          Container(
                            width: 360,
                            height: 66,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Center(
                              // 자식 컨테이너를 중앙 정렬
                              child: Container(
                                width: 328,
                                height: 42,
                                color: Color(0xFFF6F6F6),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 18,
                                      height: 18,
                                      child: Icon(
                                        Icons.search,
                                        size: 18, // 아이콘 크기 설정
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Container(
                                      width: 274,
                                      height: 18,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: '제목 및 디자이너, 스타일로 검색해 보세요',
                                          hintStyle: TextStyle(
                                            color: Color(0xFF888888),
                                            // 힌트 텍스트
                                            fontSize: 14,
                                            // 글자 크기
                                            fontFamily: 'Pretendard',
                                            // 폰트 패밀리
                                            fontWeight: FontWeight.w400,
                                            // 글자 두께
                                            height: 1.2,
                                            // 줄 높이
                                            letterSpacing: -0.35, // 글자 사이 간격
                                          ),
                                          border: InputBorder.none, // 밑줄 없애기
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 360,
                            height: 8,
                            color: Color(0xFFF6F6F6),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 여기 아래에 TabBarView를 추가하여 탭에 따른 내용을 표시할 수 있습니다.
                  Container(
                    height: 540, // 적절한 높이 설정

                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        TabContent1(),
                        TabContent2(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 첫 번째 탭 내용
class TabContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: buildDesignerAnalysisContainer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDesignerAnalysisContainer() {
    return Container(
      // 중간 패널
      width: 360,
      height: 276,
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
      child: Column(
        children: [
          Container(
            width: 328,
            height: 22,
            child: Row(
              children: [
                Container(
                  width: 260,
                  height: 22,
                  child: Text(
                    '2024. 08. 09',
                    style: TextStyle(
                      color: Color(0xFF3D3D3D),
                      // 텍스트 색상
                      fontSize: 16,
                      // 글자 크기
                      fontFamily: 'Pretendard',
                      // 폰트 패밀리
                      fontWeight: FontWeight.w500,
                      // 글자 두께
                      height: 1.4,
                      // 줄 높이
                      letterSpacing: -0.40, // 글자 사이 간격
                    ),
                  ),
                ),
                Container(
                  width: 68,
                  height: 22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬
                    children: [
                      Text(
                        '상세내역',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          // 텍스트 색상
                          fontSize: 14,
                          // 글자 크기
                          fontFamily: 'Pretendard',
                          // 폰트 패밀리
                          fontWeight: FontWeight.w400,
                          // 글자 두께
                          height: 1.2,
                          // 줄 높이
                          letterSpacing: -0.35, // 글자 사이 간격
                        ),
                      ),
                      SizedBox(width: 2), // 텍스트와 아이콘 사이에 2의 간격 추가
                      Icon(
                        Icons.arrow_forward, // 아이콘 설정
                        size: 18, // 아이콘 크기
                        color: Color(0xFF888888), // 아이콘 색상 (원하는 경우 조정 가능)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 8), // 두 컨테이너 사이의 간격을 조정
          Container(
            width: 328,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), // 둥근 모서리 설정
              border: Border.all(
                color: Color(0xFFE7E7E7),
                width: 1, // 테두리 두께
              ),
            ),
            padding: EdgeInsets.only(top: 11, bottom: 11, left: 15, right: 15),
            child: Column(
              children: [
                Container(
                  width: 296,
                  height: 22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // 요소 정렬
                    children: [
                      Container(
                        width: 41,
                        height: 22,
                        child: Text(
                          '분석중',
                          style: TextStyle(
                            color: Color(0xFF3D3D3D),
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                            letterSpacing: -0.40,
                          ),
                        ),
                      ),

                      SizedBox(width: 8), // 사이의 간격을 위한 SizedBox
                      Container(
                        width: 2,
                        height: 2,
                        color: Colors.green, // 사이즈 박스 2x2 색상
                      ),
                      SizedBox(width: 8), // 사이의 간격을 위한 SizedBox
                      Container(
                        width: 237,
                        height: 22,
                        child: Text(
                          'D-3',
                          style: TextStyle(
                            color: Color(0xFFEA186D),
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.4,
                            letterSpacing: -0.40,
                          ),
                          textAlign: TextAlign.left, // 기본 왼쪽 정렬
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: 296,
                  height: 98,
                  child: Row(
                    children: [
                      Container(
                        width: 98,
                        height: 98,
                        child: Image.asset(
                          'assets/image/1111.png',
                          fit: BoxFit.cover, // 이미지 크기 조정 방식 (필요에 따라 조정 가능)
                        ),
                      ),
                      SizedBox(width: 16), // 컨테이너 사이의 간격
                      Container(
                        width: 182,
                        height: 98,
                        child: Column(
                          children: [
                            Container(
                              width: 182,
                              height: 20,
                              child: Text(
                                '코디 맛있게 해드려요!',
                                style: TextStyle(
                                  color: Color(0xFF3D3D3D),
                                  // 텍스트 색상
                                  fontSize: 14,
                                  // 글자 크기
                                  fontFamily: 'Pretendard',
                                  // 폰트 패밀리
                                  fontWeight: FontWeight.w600,
                                  // 글자 두께
                                  height: 1.4,
                                  // 줄 높이
                                  letterSpacing: -0.35, // 글자 사이 간격
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: 182,
                              height: 17,
                              child: Text(
                                '인혜엄',
                                style: TextStyle(
                                  color: Color(0xFF3D3D3D),
                                  // 텍스트 색상
                                  fontSize: 14,
                                  // 글자 크기
                                  fontFamily: 'Pretendard',
                                  // 폰트 패밀리
                                  fontWeight: FontWeight.w400,
                                  // 글자 두께
                                  height: 1.2,
                                  // 줄 높이
                                  letterSpacing: -0.35, // 글자 사이 간격
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: 182,
                              height: 17,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // 요소 정렬
                                children: [
                                  Container(
                                    width: 48,
                                    height: 17,
                                    child: Text(
                                      '아메카지',
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.2,
                                        letterSpacing: -0.35,
                                      ),
                                      textAlign: TextAlign.left, // 기본 왼쪽 정렬
                                    ),
                                  ),
                                  SizedBox(width: 4), // 사이의 간격을 위한 SizedBox
                                  Container(
                                    width: 2,
                                    height: 2,
                                    color: Colors.black, // 세 번째 내부 컨테이너 색상
                                  ),
                                  SizedBox(width: 4), // 사이의 간격을 위한 SizedBox
                                  Container(
                                    width: 124,
                                    height: 17,
                                    child: Text(
                                      '아우터 외2',
                                      style: TextStyle(
                                        color: Color(0xFF888888),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.2,
                                        letterSpacing: -0.35,
                                      ),
                                      textAlign: TextAlign.left, // 기본 왼쪽 정렬
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: 182,
                              height: 20,
                              child: Text(
                                '20,000원',
                                style: TextStyle(
                                  color: Color(0xFF3D3D3D),
                                  // 텍스트 색상
                                  fontSize: 14,
                                  // 글자 크기
                                  fontFamily: 'Pretendard',
                                  // 폰트 패밀리
                                  fontWeight: FontWeight.w600,
                                  // 글자 두께
                                  height: 1.4,
                                  // 줄 높이
                                  letterSpacing: -0.35, // 글자 사이 간격
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: 296,
                  height: 42,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4), // 둥근 모서리 설정
                    border: Border.all(
                      color: Color(0xFFE7E7E7), // 테두리 색상 설정
                      width: 1, // 테두리 두께
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '분석취소',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF3D3D3D),
                        // 텍스트 색상
                        fontSize: 14,
                        // 글자 크기
                        fontFamily: 'Pretendard',
                        // 폰트 패밀리
                        fontWeight: FontWeight.w500,
                        // 글자 두께
                        height: 1.4,
                        // 줄 높이
                        letterSpacing: -0.35, // 글자 사이 간격
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } // 분석중
}

Widget buildDesignerAnalysisContainer2() {
  return Container(
    // 중간 패널
    width: 360,
    height: 276,
    padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
    child: Column(
      children: [
        Container(
          width: 328,
          height: 22,
          child: Row(
            children: [
              Container(
                width: 260,
                height: 22,
                child: Text(
                  '2024. 08. 09',
                  style: TextStyle(
                    color: Color(0xFF3D3D3D),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    letterSpacing: -0.40, // 글자 사이 간격
                  ),
                ),
              ),
              Container(
                width: 68,
                height: 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // 왼쪽 정렬
                  children: [
                    Text(
                      '상세내역',
                      style: TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        letterSpacing: -0.35,
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(
                      Icons.arrow_forward, // 아이콘 설정
                      size: 18, // 아이콘 크기
                      color: Color(0xFF888888), // 아이콘 색상 (원하는 경우 조정 가능)
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 8), // 두 컨테이너 사이의 간격을 조정
        Container(
          width: 328,
          height: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), // 둥근 모서리 설정
            border: Border.all(
              color: Color(0xFFE7E7E7),
              width: 1, // 테두리 두께
            ),
          ),
          padding: EdgeInsets.only(top: 11, bottom: 11, left: 15, right: 15),
          child: Column(
            children: [
              Container(
                width: 296,
                height: 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // 요소 정렬
                  children: [
                    Container(
                      width: 55,
                      height: 22,
                      child: Text(
                        '수락대기',
                        style: TextStyle(
                          color: Color(0xFF3D3D3D),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 1.4,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),

                    SizedBox(width: 8), // 사이의 간격을 위한 SizedBox
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: 296,
                height: 98,
                child: Row(
                  children: [
                    Container(
                      width: 98,
                      height: 98,
                      child: Image.asset(
                        'assets/image/1111.png',
                        fit: BoxFit.cover, // 이미지 크기 조정 방식 (필요에 따라 조정 가능)
                      ),
                    ),
                    SizedBox(width: 16), // 컨테이너 사이의 간격
                    Container(
                      width: 182,
                      height: 98,
                      child: Column(
                        children: [
                          Container(
                            width: 182,
                            height: 20,
                            child: Text(
                              '코디 맛있게 해드려요!',
                              style: TextStyle(
                                color: Color(0xFF3D3D3D),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                                letterSpacing: -0.35, // 글자 사이 간격
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 182,
                            height: 17,
                            child: Text(
                              '줏댔어',
                              style: TextStyle(
                                color: Color(0xFF3D3D3D),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                                letterSpacing: -0.35, // 글자 사이 간격
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 182,
                            height: 17,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // 요소 정렬
                              children: [
                                Container(
                                  width: 48,
                                  height: 17,
                                  child: Text(
                                    '아메카지',
                                    style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.2,
                                      letterSpacing: -0.35,
                                    ),
                                    textAlign: TextAlign.left, // 기본 왼쪽 정렬
                                  ),
                                ),
                                SizedBox(width: 4), // 사이의 간격을 위한 SizedBox
                                Container(
                                  width: 2,
                                  height: 2,
                                  color: Colors.black, // 세 번째 내부 컨테이너 색상
                                ),
                                SizedBox(width: 4), // 사이의 간격을 위한 SizedBox
                                Container(
                                  width: 124,
                                  height: 17,
                                  child: Text(
                                    '아우터 외2',
                                    style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.2,
                                      letterSpacing: -0.35,
                                    ),
                                    textAlign: TextAlign.left, // 기본 왼쪽 정렬
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 182,
                            height: 20,
                            child: Text(
                              '20,000원',
                              style: TextStyle(
                                color: Color(0xFF3D3D3D),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                                letterSpacing: -0.35, // 글자 사이 간격
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: 296,
                height: 42,
                child: Row(
                  children: [
                    Container(
                      width: 138,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4), // 둥근 모서리 설정
                        border: Border.all(
                          color: Color(0xFFE7E7E7), // 테두리 색상 설정
                          width: 1, // 테두리 두께
                        ),
                      ),
                      child: Center( // 텍스트를 중앙에 배치하기 위해 Center 위젯 사용
                        child: Text(
                          '분석취소',
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
                    SizedBox(width: 20), // 사이의 간격을 위한 SizedBox
                    Container(
                      width: 138,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4), // 둥근 모서리 설정
                        border: Border.all(
                          color: Color(0xFFE7E7E7), // 테두리 색상 설정
                          width: 1, // 테두리 두께
                        ),
                      ),
                      child: Center( // 텍스트를 중앙에 배치하기 위해 Center 위젯 사용
                        child: Text(
                          '분석취소',
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
                  ],
                ),
              )

            ],
          ),
        ),
      ],
    ),
  );
} // 수락대기화면

// 두 번째 탭 내용
class TabContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column( // 여러 자식을 담기 위해 Column 사용
                children: [
                  buildDesignerAnalysisContainer2(),
                  TabContent1().buildDesignerAnalysisContainer(),
                  TabContent1().buildDesignerAnalysisContainer(),
                  TabContent1().buildDesignerAnalysisContainer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

