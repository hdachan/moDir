import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Quotation_img_select.dart';

class DesignerDetailScreen extends StatefulWidget {

  final String designerId;
  final String name;
  final String introduction;
  final String classification;
  final String price;
  final String imageUrl;
  final int reviewCount;
  final String gender;

  DesignerDetailScreen({
    required this.designerId,
    required this.name,
    required this.introduction,
    required this.classification,
    required this.price,
    required this.imageUrl,
    required this.reviewCount,
    required this.gender,
  });
  @override
  _MyTabScrollAppState createState() => _MyTabScrollAppState();
}

class _MyTabScrollAppState extends State<DesignerDetailScreen> with SingleTickerProviderStateMixin {
  // 탭바,실버바 컨트롤러 등
  late TabController _tabController;
  final GlobalKey _content1Key = GlobalKey();
  final GlobalKey _content2Key = GlobalKey();
  final GlobalKey _content3Key = GlobalKey();

  //서버 내용
  List<Widget> tags = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0;
  List<Map<String, dynamic>> _reviews = [];
  int _reviewCount = 0;
  double _averageRating = 0;



  @override
  void initState() {
    super.initState();
    _fetchReviews();
    _tabController = TabController(length: 3, vsync: this); // 탭 수를 3으로 변경

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _scrollToContent(_tabController.index);
      }
    });
  }

  Future<void> _fetchReviews() async {
    QuerySnapshot reviewsSnapshot = await _firestore
        .collection('designer')
        .doc(widget.designerId)
        .collection('reviews')
        .orderBy('timestamp', descending: true) // 최신 리뷰부터 가져오기
        .get();

    // 리뷰 리스트를 초기화하고 비동기 작업을 통해 리뷰를 가져옵니다.
    List<Map<String, dynamic>> reviewsList = [];

    await Future.wait(reviewsSnapshot.docs.map((doc) async {
      final data = doc.data() as Map<String, dynamic>;
      final userId = data['userId'];

      // users 컬렉션에서 nickname 가져오기
      DocumentSnapshot userSnapshot =
      await _firestore.collection('users').doc(userId).get();
      String nickname = userSnapshot.exists
          ? (userSnapshot.data() as Map<String, dynamic>)['nickname'] ?? '익명'
          : '익명';

      reviewsList.add({
        'review': data['review'],
        'rating': data['rating'],
        'userId': userId,
        'userName': nickname, // nickname으로 변경
        'timestamp': data['timestamp'],
      });
    }));

    // setState를 호출하여 UI를 업데이트합니다.
    setState(() {
      _reviews = reviewsList; // 리뷰 리스트 업데이트
      _reviewCount = _reviews.length; // 리뷰 개수 업데이트
      _averageRating = _reviews.isEmpty
          ? 0
          : _reviews.map((r) => r['rating'] as num).reduce((a, b) => a + b) /
          _reviews.length; // 평균 평점 계산
    });
  }

  Future<void> _submitReview() async {
    if (_reviewController.text.isEmpty || _rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('리뷰 내용과 평점을 모두 입력해주세요.')),
      );
      return;
    }

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('리뷰를 작성하려면 로그인이 필요합니다.')),
      );
      return;
    }

    // 기존 리뷰 확인
    QuerySnapshot existingReviewsSnapshot = await _firestore
        .collection('designer')
        .doc(widget.designerId)
        .collection('reviews')
        .where('userId', isEqualTo: user.uid)
        .get();

    if (existingReviewsSnapshot.docs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('이미 리뷰를 작성하셨습니다.')),
      );
      return;
    }

    // 리뷰 추가
    await _firestore
        .collection('designer')
        .doc(widget.designerId)
        .collection('reviews')
        .add({
      'review': _reviewController.text,
      'rating': _rating,
      'userId': user.uid,
      'userName': user.displayName ?? user.uid, // 이름이 없을 경우 userId로 대체
      'timestamp': FieldValue.serverTimestamp(),
    });

    // 리뷰 개수 업데이트
    await _firestore.collection('designer').doc(widget.designerId).update({
      'reviewCount': FieldValue.increment(1),
    });

    // 입력 필드 초기화 및 UI 업데이트
    _reviewController.clear();
    setState(() {
      _rating = 0;
    });

    // 리뷰 목록 새로 고침
    await _fetchReviews();
  }

  void _scrollToContent(int index) {
    if (index == 0) {
      // '진행중 내용 1' 탭을 눌렀을 때
      Scrollable.ensureVisible(
        _content1Key.currentContext!,
        duration: Duration(milliseconds: 476),
        curve: Curves.easeInOut,
      );
    } else if (index == 1) {
      // '진행중 내용 2' 탭을 눌렀을 때
      Scrollable.ensureVisible(
        _content2Key.currentContext!,
        duration: Duration(milliseconds: 271),
        curve: Curves.easeInOut,
      );
    } else {
      // '진행중 내용 3' 탭을 눌렀을 때
      Scrollable.ensureVisible(
        _content3Key.currentContext!,
        duration: Duration(milliseconds: 360),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 600, // SliverAppBar가 확장될 때의 최대 높이
              flexibleSpace: FlexibleSpaceBar(
                background: Stack( // Stack 위젯을 사용하여 여러 위젯을 겹쳐서 배치
                  children: [
                    Center(
                      child: Container(
                        width: 360,
                        height: 476,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              width: 360,
                              decoration: BoxDecoration(
                                color: Colors.black, // 배경 색상 (이미지가 로드되지 않을 경우)
                                image: DecorationImage(
                                  image: NetworkImage(widget.imageUrl),
                                  // imageUrl을 네트워크에서 불러옴
                                  fit: BoxFit.cover, // 이미지가 컨테이너를 채우도록 설정
                                ),
                              ),
                            ),
// 사진
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
                                    '${widget.name}',
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
                                    '${widget.introduction}',
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
                                  if (widget.classification != null) ...[
                                    if (widget.classification!.contains('아메카지'))
                                      buildTagContainer('아메카지'),
                                    if (widget.classification!.contains('미니멀'))
                                      buildTagContainer('미니멀'),
                                    if (widget.classification!.contains('캐주얼'))
                                      buildTagContainer('캐주얼'),
                                    if (widget.classification!.contains('시티보이'))
                                      buildTagContainer('시티보이'),
                                    if (widget.classification!.contains('빈티지'))
                                      buildTagContainer('빈티지'),
                                    if (widget.classification!.contains('스트릿'))
                                      buildTagContainer('스트릿'),
                                    if (widget.classification!.contains('놈코어'))
                                      buildTagContainer('놈코어'),
                                    if (widget.classification!.contains('스포티'))
                                      buildTagContainer('스포티'),
                                    if (widget.classification!.contains('댄디'))
                                      buildTagContainer('댄디'),
                                    if (widget.classification!.contains('클래식'))
                                      buildTagContainer('클래식'),
                                    if (widget.classification!.contains('워크웨어'))
                                      buildTagContainer('워크웨어'),
                                    if (widget.classification!.contains('올드스쿨'))
                                      buildTagContainer('올드스쿨'),
                                    if (widget.classification!.contains('보헤미안'))
                                      buildTagContainer('보헤미안'),
                                    if (widget.classification!.contains('테크웨어'))
                                      buildTagContainer('테크웨어'),
                                    if (widget.classification!.contains('그런지'))
                                      buildTagContainer('그런지'),
                                    if (widget.classification!.contains('포멀'))
                                      buildTagContainer('포멀'),
                                    if (widget.classification!.contains('레트로'))
                                      buildTagContainer('레트로'),
                                    SizedBox(width: 8), // 마지막 태그 뒤에 간격 추가
                                  ],
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
                                              widget.gender,
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
                                            mainAxisAlignment: MainAxisAlignment
                                                .center, // 중앙 정렬
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
                                                '(${widget.reviewCount})',
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
                    ),
                  ],
                ),
              ),
              pinned: true, // SliverAppBar를 스크롤할 때 상단에 고정되도록 설정
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50.0), // 탭바의 높이 설정
                child: Container(
                  height: 46,
                  width: 360,
                  padding: EdgeInsets.only(top: 12, left: 16, right: 16),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: [
                      Tab(
                        child: Text(
                          '디자이너정보',
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
                          '스타일',
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
                          '리뷰',
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
                    indicatorPadding: EdgeInsets.only(top: 12, bottom: 0),
                    labelPadding: EdgeInsets.only(left: 6, right: 6),
                  ),
                ),
              ),
            ),



            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // 디자이너 정보
                  Container(
                    key: _content1Key,
                    height: 522,
                    width: 360,
                    child: Column(
                      children: [
                        Container(
                          // 디자이너 정보
                          height: 143,
                          width: 360,
                          child: Column(
                            children: [
                              Container(
                                //
                                height: 67,
                                width: 360,
                                padding: EdgeInsets.only(
                                    top: 36,
                                    bottom: 12,
                                    left: 16,
                                    right: 16), // 패딩 설정
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
                                padding: EdgeInsets.only(
                                    top: 12,
                                    bottom: 12,
                                    left: 16,
                                    right: 16), // 패딩 설정
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start, // 왼쪽 정렬 설정
                                  children: [
                                    Text(
                                      '견적 비용 : ${widget.price}원',
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
                              ),
                            ],
                          ),
                        ),

                        Container(
                          height: 228,
                          width: 360,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start, // 왼쪽 정렬 설정
                            children: [
                              Container(
                                height: 67,
                                width: 360,
                                padding: EdgeInsets.only(
                                    top: 36,
                                    bottom: 12,
                                    left: 16,
                                    right: 16), // 패딩 설정
                                child: Text(
                                  '디자이너 상세 설명',
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
                                height: 129,
                                width: 360,
                                padding: EdgeInsets.only(
                                    top: 12,
                                    bottom: 12,
                                    left: 16,
                                    right: 16), // 패딩 설정
                                child: Text(
                                  '안녕하세요~!\n미니멀이면 미니멀, 캐주얼이면 캐주얼, 빈티지면 빈티지 등등\n원하시는 스타일은 최대한 맞춰 드릴게요!\n현재 300분 이상 저에게 코디 받으시고 만족들 하셨으니, 고객\n님도 충분히 만족시켜 드릴 수 있다고 확신합니다! 그럼 견적...',
                                  style: TextStyle(
                                    color: Color(0xFF5D5D5D),
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                    letterSpacing: -0.35,
                                  ),
                                ),
                              ),
                              Container(
                                height: 32,
                                width: 360,
                                padding: EdgeInsets.only(
                                    left: 16, right: 16), // 패딩 설정
                                child: Center(
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      // 배경색을 투명으로 설정
                                      border: Border.all(
                                        color: Color(0xFFE7E7E7),
                                        // 테두리 색상
                                        width: 1, // 테두리 두께
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(
                                          100), // 둥글게 만들기
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "더보기",
                                          style: TextStyle(
                                            color: Color(0xFF5D5D5D),
                                            fontSize: 14,
                                            fontFamily: 'Pretendard',
                                            fontWeight:
                                            FontWeight.w400,
                                            letterSpacing: -0.35,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        // 텍스트와 아이콘 사이의 간격
                                        Icon(
                                          Icons.arrow_drop_down,
                                          // 아래로 향하는 화살표
                                          color: Colors.black,
                                          // 화살표 색상 변경
                                          size: 14, // 화살표 크기
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ), //디자이너 설명

                        Container(
                          width: 360,
                          height: 151,
                          child: Column(
                            children: [
                              Container(
                                height: 67,
                                width: 360,
                                padding: EdgeInsets.only(
                                    top: 36,
                                    bottom: 12,
                                    left: 16,
                                    right: 16), // 패딩 설정
                                child: Text(
                                  '디자이너 제공 분야',
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
                                height: 84,
                                width: 360,
                                padding: EdgeInsets.only(
                                    top: 12,
                                    bottom: 40,
                                    left: 16,
                                    right: 16), // 패딩 설정
                                child: Row(
                                  children: [
                                    if (widget.classification !=
                                        null) ...[
                                      if (widget.classification!
                                          .contains('아메카지'))
                                        buildMinimalContainer('아메카지'),
                                      if (widget.classification!
                                          .contains('미니멀'))
                                        buildMinimalContainer('미니멀'),
                                      if (widget.classification!
                                          .contains('캐주얼'))
                                        buildMinimalContainer('캐주얼'),
                                      if (widget.classification!
                                          .contains('시티보이'))
                                        buildMinimalContainer('시티보이'),
                                      if (widget.classification!
                                          .contains('빈티지'))
                                        buildMinimalContainer('빈티지'),
                                      if (widget.classification!
                                          .contains('스트릿'))
                                        buildMinimalContainer('스트릿'),
                                      if (widget.classification!
                                          .contains('놈코어'))
                                        buildMinimalContainer('놈코어'),
                                      if (widget.classification!
                                          .contains('스포티'))
                                        buildMinimalContainer('스포티'),
                                      if (widget.classification!
                                          .contains('댄디'))
                                        buildMinimalContainer('댄디'),
                                      if (widget.classification!
                                          .contains('클래식'))
                                        buildMinimalContainer('클래식'),
                                      if (widget.classification!
                                          .contains('워크웨어'))
                                        buildMinimalContainer('워크웨어'),
                                      if (widget.classification!
                                          .contains('올드스쿨'))
                                        buildMinimalContainer('올드스쿨'),
                                      if (widget.classification!
                                          .contains('보헤미안'))
                                        buildMinimalContainer('보헤미안'),
                                      if (widget.classification!
                                          .contains('테크웨어'))
                                        buildMinimalContainer('테크웨어'),
                                      if (widget.classification!
                                          .contains('그런지'))
                                        buildMinimalContainer('그런지'),
                                      if (widget.classification!
                                          .contains('포멀'))
                                        buildMinimalContainer('포멀'),
                                      if (widget.classification!
                                          .contains('레트로'))
                                        buildMinimalContainer('레트로'),
                                      SizedBox(width: 8),
                                      // 마지막 태그 뒤에 간격 추가
                                    ],
                                  ],
                                ),
                              )
                            ],
                          ),
                        ) //디자이너 제공분야
                      ],
                    ),
                  ),
                  // 스타일
                  Container(
                    key: _content2Key,
                    width: 360,
                    height: 271,
                    child: Column(
                      children: [
                        Container(
                          width: 360,
                          height: 67,
                          padding: EdgeInsets.only(
                              top: 36,
                              bottom: 12,
                              left: 16,
                              right: 16), // 패딩 설정
                          child: Text(
                            '디자이너 스타일',
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
                          width: 360,
                          height: 56,
                          padding: EdgeInsets.only(
                              top: 12,
                              bottom: 12,
                              left: 16,
                              right: 16), // 패딩 설정
                          child: Row(
                            children: [
                              if (widget.classification != null) ...[
                                if (widget.classification!
                                    .contains('아메카지'))
                                  buildLabelContainer('아메카지'),
                                if (widget.classification!
                                    .contains('미니멀'))
                                  buildLabelContainer('미니멀'),
                                if (widget.classification!
                                    .contains('캐주얼'))
                                  buildLabelContainer('캐주얼'),
                                if (widget.classification!
                                    .contains('시티보이'))
                                  buildLabelContainer('시티보이'),
                                if (widget.classification!
                                    .contains('빈티지'))
                                  buildLabelContainer('빈티지'),
                                if (widget.classification!
                                    .contains('스트릿'))
                                  buildLabelContainer('스트릿'),
                                if (widget.classification!
                                    .contains('놈코어'))
                                  buildLabelContainer('놈코어'),
                                if (widget.classification!
                                    .contains('스포티'))
                                  buildLabelContainer('스포티'),
                                if (widget.classification!
                                    .contains('댄디'))
                                  buildLabelContainer('댄디'),
                                if (widget.classification!
                                    .contains('클래식'))
                                  buildLabelContainer('클래식'),
                                if (widget.classification!
                                    .contains('워크웨어'))
                                  buildLabelContainer('워크웨어'),
                                if (widget.classification!
                                    .contains('올드스쿨'))
                                  buildLabelContainer('올드스쿨'),
                                if (widget.classification!
                                    .contains('보헤미안'))
                                  buildLabelContainer('보헤미안'),
                                if (widget.classification!
                                    .contains('테크웨어'))
                                  buildLabelContainer('테크웨어'),
                                if (widget.classification!
                                    .contains('그런지'))
                                  buildLabelContainer('그런지'),
                                if (widget.classification!
                                    .contains('포멀'))
                                  buildLabelContainer('포멀'),
                                if (widget.classification!
                                    .contains('레트로'))
                                  buildLabelContainer('레트로'),
                                SizedBox(width: 8),
                                // 마지막 태그 뒤에 간격 추가
                              ],
                            ],
                          ),
                        ),
                        Container(
                          width: 360,
                          height: 148,
                          padding: EdgeInsets.only(
                              top: 12,
                              bottom: 40,
                              left: 16,
                              right: 16), // 패딩 설정
                          child: Row(
                            children: [
                              Container(
                                width: 96,
                                height: 96,
                                color: Colors.teal,
                              ),
                              SizedBox(width: 8), // 사이즈 박스 추가
                              Container(
                                width: 96,
                                height: 96,
                                color: Colors.teal,
                              ),
                              SizedBox(width: 8), // 사이즈 박스 추가
                              Container(
                                width: 96,
                                height: 96,
                                color: Colors.teal,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 리뷰
                  Container(
                    key: _content3Key,
                    width: 360,
                    child: Column(
                      children: [
                        Container(
                          width: 360,
                          height: 67,
                          padding: EdgeInsets.only(
                              top: 36,
                              bottom: 12,
                              left: 16,
                              right: 16), // 패딩 설정
                          child: Text(
                            '리뷰',
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                              letterSpacing: -0.40,
                            ),
                          ),
                        ), // 리뷰
                        Container(
                          width: 360,
                          height: 181,
                          padding: EdgeInsets.only(
                              top: 12,
                              bottom: 12,
                              left: 16,
                              right: 16), // 패딩 설정
                          child: Column(
                            children: [
                              Container(
                                width: 328,
                                height: 32,
                                child: Center(
                                  // 텍스트를 가운데 정렬
                                  child: Text(
                                    '4.9',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 32,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 1.0,
                                      letterSpacing: -0.80,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 8), // 사이즈 박스 추가
                              Container(
                                width: 328,
                                height: 24,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // 가운데 정렬
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 24, // 아이콘 크기
                                      color: Colors
                                          .yellow, // 원하는 색으로 변경 가능
                                    ),
                                    SizedBox(width: 4), // 별과 별 사이의 간격
                                    Icon(
                                      Icons.star,
                                      size: 24,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.star,
                                      size: 24,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.star,
                                      size: 24,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.star,
                                      size: 24,
                                      color: Colors.yellow,
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 8), // 사이즈 박스 추가
                              Container(
                                width: 328,
                                height: 17,
                                alignment: Alignment.center,
                                // 정중앙에 배치
                                child: Text(
                                  '${widget.reviewCount} 리뷰',
                                  // 원하는 텍스트로 변경
                                  style: TextStyle(
                                    color: Color(0xFF888888),
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                    letterSpacing: -0.35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),


                        // 네 번째 박스
                        Container(
                          width: 360,
                          height: 48,
                          padding: EdgeInsets.only(
                              top: 12,
                              bottom: 12,
                              left: 16,
                              right: 16), // 패딩 설정
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // 텍스트와 컨테이너 간의 간격 조정
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '전체 리뷰 ',
                                    style: TextStyle(
                                      color: Color(0xFF3D3D3D),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.2,
                                      letterSpacing: -0.35,
                                    ),
                                  ),
                                  SizedBox(width: 2), // 사이즈 박스 추가
                                  Text(
                                    '${widget.reviewCount}',
                                    style: TextStyle(
                                      color: Color(0xFF3D3D3D),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 1.2,
                                      letterSpacing: -0.35,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 89,
                                height: 24,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .end, // 맨 오른쪽 정렬
                                  children: const [
                                    Text(
                                      '최신순',
                                      style: TextStyle(
                                        color: Color(0xFF5D5D5D),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.0,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                    SizedBox(width: 2), // 사이즈 박스 추가
                                    Icon(
                                      Icons.arrow_drop_down,
                                      // 아래로 보는 화살표 아이콘
                                      size: 24,
                                      color: Colors.black, // 아이콘 색상
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Column(
                          // 중앙 정렬
                          children: [
                            // children 리스트로 변경
                            Container(
                              width: 360,
                              height: 337,
                              // 내부 컨테이너 색상
                              padding: EdgeInsets.only(
                                  top: 16,
                                  bottom: 16,
                                  left: 16,
                                  right: 16),
                              // 패딩 설정
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start, // 왼쪽 정렬
                                children: [
                                  Container(
                                    width: 328,
                                    height: 44,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 12),
                                  // 각 컨테이너 사이의 간격
                                  Container(
                                    width: 328,
                                    height: 96,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 12),
                                  // 각 컨테이너 사이의 간격
                                  Container(
                                    width: 328,
                                    height: 81,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 12),
                                  // 각 컨테이너 사이의 간격
                                  Container(
                                    width: 328,
                                    height: 48,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 360,
                              height: 337,
                              color: Colors.grey,
                              // 내부 컨테이너 색상
                              padding: EdgeInsets.only(
                                  top: 16,
                                  bottom: 16,
                                  left: 16,
                                  right: 16),
                              // 패딩 설정
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start, // 왼쪽 정렬
                                children: [
                                  Container(
                                    width: 328,
                                    height: 44,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 12),
                                  // 각 컨테이너 사이의 간격
                                  Container(
                                    width: 328,
                                    height: 96,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 12),
                                  // 각 컨테이너 사이의 간격
                                  Container(
                                    width: 328,
                                    height: 81,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 12),
                                  // 각 컨테이너 사이의 간격
                                  Container(
                                    width: 328,
                                    height: 48,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 360,
                              height: 337,
                              color: Colors.grey,
                              // 내부 컨테이너 색상
                              padding: EdgeInsets.only(
                                  top: 16,
                                  bottom: 16,
                                  left: 16,
                                  right: 16),
                              // 패딩 설정
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start, // 왼쪽 정렬
                                children: [
                                  Container(
                                    width: 328,
                                    height: 44,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 12),
                                  // 각 컨테이너 사이의 간격
                                  Container(
                                    width: 328,
                                    height: 96,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 12),
                                  // 각 컨테이너 사이의 간격
                                  Container(
                                    width: 328,
                                    height: 81,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 12),
                                  // 각 컨테이너 사이의 간격
                                  Container(
                                    width: 328,
                                    height: 48,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 12), // 두 번째 컨테이너와의 간격
                          ],
                        ),

                        // 다섯 번째 박스
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 52,
        width: 360,
        color: Color(0xFF3D3D3D),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Row를 중앙 정렬
          children: [
            Container(
              width: 48,
              height: 52,
              color: Color(0xFF3D3D3D), // 하얀색 배경
              child: Center(
                child: Icon(
                  Icons.share_outlined, // 윤곽선 공유 아이콘
                  size: 24,
                  color: Colors.white, // 원하는 색으로 변경 가능
                ),
              ),
            ),

            Container(
              width: 48,
              height: 52,
              color: Color(0xFF3D3D3D), // 하얀색 배경
              child: Center(
                child: Icon(
                  Icons.favorite_border, // 하트 아이콘
                  size: 24,
                  color: Colors.white, // 원하는 색으로 변경 가능
                ),
              ),
            ),

            // 세 번째 컨테이너: "견적서 작성하기" 텍스트 중앙에 표시
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuotationImgSelect()), // Test3 화면으로 이동
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF3D3D3D), // 버튼 배경색
                fixedSize: Size(244, 52), // 버튼 크기
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // 모서리 둥글게
                ),
              ),
              child: Center(
                child: Text(
                  '견적서 작성하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.40,
                    height: 1.0,
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );

  }
}

// 처음 버튼
Widget buildTagContainer(String label) {
  return Row(
    children: [
      Container(
        height: 20,
        width: 47,
        decoration: BoxDecoration(
          color: Color(0xFFE6E4FF), // 배경색 설정
          borderRadius: BorderRadius.circular(4), // 라운드 설정
        ),
        child: Center(
          child: Text(
            label,
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
      SizedBox(width: 8), // 간격 추가
    ],
  );
}

// 두번째 버튼
Widget buildMinimalContainer(String label) {
  return Row(
    children: [
      Container(
        height: 32,
        width: 68,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Color(0xFFE7E7E7),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Color(0xFF5D5D5D),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ),
      SizedBox(width: 8),
    ],
  );
}

// 세번째 버튼
Widget buildLabelContainer(String label) {
  return Row(
    children: [
      Container(
        width: 60,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Color(0xFFE7E7E7),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Color(0xFF5D5D5D),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ),
      SizedBox(width: 8), // 사이즈 박스 추가
    ],
  );
}


// 나중에 넣을 앱바
// appBar: AppBar(
// leading: IconButton(
// icon: Icon(Icons.arrow_back), // 뒤로 가기 버튼
// onPressed: () => Navigator.of(context).pop(),
// ),
// actions: [
// Padding(
// padding: const EdgeInsets.only(right: 4),
// child: IconButton(
// onPressed: () {},
// icon: Icon(Icons.home_outlined),
// iconSize: 24),
// ),
// ],
// backgroundColor: Colors.transparent, // 앱바를 투명하게 설정
// elevation: 0, // 그림자 제거
// ),