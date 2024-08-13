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

class _QuotationPageState extends State<QuotationPage> with SingleTickerProviderStateMixin {
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
                child: IconButton(onPressed: () {}, icon: Icon(Icons.home_outlined), iconSize: 24),
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
                      height: 112,
                      child: Column(
                        children: [
                          Container(
                            width: 360,
                            height: 46,
                            color: Colors.tealAccent,
                            //padding: EdgeInsets.only(left: 16, top: 16),
                            child: TabBar(
                              controller: _tabController,
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
                              tabs: [
                                Tab(text: '진행중'),
                                Tab(text: '지난내역'),
                              ],
                              indicatorColor: Color(0xFF3D3D3D),
                              indicatorSize: TabBarIndicatorSize.tab, // 인디케이터 크기 조정
                              indicatorPadding: EdgeInsets.only(top: 12, bottom: 0), // 인디케이터와 텍스트 간의 간격 조정
                              labelPadding: EdgeInsets.only(left: 6, right: 6),
                            ),
                          ),
                          Divider(
                            color: Color(0xFFF6F6F6),
                            height: 2.0,
                            thickness: 2.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 여기 아래에 TabBarView를 추가하여 탭에 따른 내용을 표시할 수 있습니다.
                  Container(
                    height: 300, // 적절한 높이 설정
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Center(child: Text('메인 탭 내용')),
                        Center(child: Text('커뮤니티 탭 내용')),
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
