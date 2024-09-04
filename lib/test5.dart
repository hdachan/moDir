import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_qwe/test3.dart';
import 'Quotation_img_select.dart';

void main() {
  runApp(Test5(designerId: '디자이너 아이디 전달하기 위한 변수')); // Test3 위젯을 홈으로 설정
}

class Test5 extends StatefulWidget {
  // Test3을 StatefulWidget으로 정의
  final String designerId; // 디자이너 ID 추가

  const Test5({Key? key, required this.designerId}) : super(key: key);
  @override
  _Test5State createState() => _Test5State(); // 상태 클래스를 생성
}

class _Test5State extends State<Test5> {

  @override
  void initState() {
    super.initState();
    _loadSelectedItems(); // 위젯이 생성될 때 아이템 로드
  }

  List<String> _itemTexts = ['반팔', '긴팔', '반바지', '긴바지','아우터','신발','안경','팔찌','반지','목도리','모자','목걸이','벨트','시계','귀걸이','키링','치마','원피스']; // 필요에 따라 아이템 추가

  String? userId = FirebaseAuth.instance.currentUser?.uid;
  List<int> _selectedItems = [];

  void _toggleItem(int index) {
    setState(() {
      if (_selectedItems.contains(index)) {
        _selectedItems.remove(index);
      } else if (_selectedItems.length < 4) {
        _selectedItems.add(index);
      }
    });
  }

  Future<void> _saveSelectedItems() async {
    if (userId != null && _selectedItems.isNotEmpty) {
      // 선택된 인덱스를 텍스트 목록으로 변환
      List<String> selectedTexts = _selectedItems.map((index) => _itemTexts[index]).toList();

      await FirebaseFirestore.instance
          .collection('designer')
          .doc(widget.designerId)
          .collection('Quotation')
          .doc(userId) // Quotation 서브컬렉션 내에서 문서 이름도 사용자 UID로 설정
          .set({ // set()을 사용하여 문서 데이터를 추가하거나 업데이트
        'items': selectedTexts, // 텍스트 목록으로 저장
        'fitType': '설정한 핏이 없습니다', // fitType 추가
        'upFitType': '설정한 핏이 없습니다', // upFitType 추가
        'bottomFitType': '설정한 핏이 없습니다', // bottomFitType 추가
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<void> _loadSelectedItems() async {
    if (userId != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('designer')
          .doc(userId)
          .collection('Quotation')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        // Firestore에서 가져온 데이터에서 'items' 필드를 읽어옵니다.
        Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

        if (data != null && data['items'] != null) {
          List<String> loadedItems = List<String>.from(data['items']);

          // 로드된 아이템을 _selectedItems에 저장
          _selectedItems = loadedItems.map((text) => _itemTexts.indexOf(text)).toList();

          // 필요에 따라 UI 업데이트를 위한 setState 호출
          setState(() {
            // UI 업데이트 관련 코드
          });
        } else {
          print("아이템이 존재하지 않습니다.");
        }
      } else {
        print("문서가 존재하지 않습니다.");
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: QuotationImgSelectAppBar(),
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
                                color: Color(0xFF3D3D3D), // 내부 컨테이너 색상
                              ),
                              alignment: Alignment.center, // 텍스트 중앙 정렬
                              child: Text(
                                '1',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 1.0,
                                  letterSpacing: -0.25,
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
                                color: Colors.white, // 내부 컨테이너 색상
                              ),
                              alignment: Alignment.center, // 텍스트 중앙 정렬
                              child: Text(
                                '2',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF3D3D3D),
                                  fontSize: 10,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 1.0,
                                  letterSpacing: -0.25,
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
                                color: Colors.white, // 내부 컨테이너 색상
                              ),
                              alignment: Alignment.center, // 텍스트 중앙 정렬
                              child: Text(
                                '3',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF3D3D3D),
                                  fontSize: 10,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 1.0,
                                  letterSpacing: -0.25,
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
                                  widget.designerId,
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
                                  '고객님이 선택하신 스타일에 맞게 아이템을 추천해드릴게요 (최대4개)',
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
                                  onTap: () => _toggleItem(0), // 여기서 인덱스를 13으로 설정
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(0) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(0) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '반팔',
                                      style: TextStyle(
                                        color: _selectedItems.contains(0) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(1),
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(1) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(1) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '긴팔',
                                      style: TextStyle(
                                        color: _selectedItems.contains(1) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(2),
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(2) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(2) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '반바지',
                                      style: TextStyle(
                                        color: _selectedItems.contains(2) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(3),
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(3) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(3) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '긴바지',
                                      style: TextStyle(
                                        color: _selectedItems.contains(3) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(4),
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(4) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(4) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '아우터',
                                      style: TextStyle(
                                        color: _selectedItems.contains(4) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(5),
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(5) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(5) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '신발',
                                      style: TextStyle(
                                        color: _selectedItems.contains(5) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(6),
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(6) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(6) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '안경',
                                      style: TextStyle(
                                        color: _selectedItems.contains(6) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(7),
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(7) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(7) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '팔찌',
                                      style: TextStyle(
                                        color: _selectedItems.contains(7) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(8),
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(8) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(8) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '반지',
                                      style: TextStyle(
                                        color: _selectedItems.contains(8) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(9),
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(9) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(9) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '목도리',
                                      style: TextStyle(
                                        color: _selectedItems.contains(9) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(10),
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(10) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(10) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '모자',
                                      style: TextStyle(
                                        color: _selectedItems.contains(10) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(11),
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(11) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(11) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '목걸이',
                                      style: TextStyle(
                                        color: _selectedItems.contains(11) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.1,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8), //여기

                                GestureDetector(
                                  onTap: () => _toggleItem(12),
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(12) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(12) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '벨트',
                                      style: TextStyle(
                                        color: _selectedItems.contains(12) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(13),
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(13) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(13) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '시계',
                                      style: TextStyle(
                                        color: _selectedItems.contains(13) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(14),
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(14) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(14) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '귀걸이',
                                      style: TextStyle(
                                        color: _selectedItems.contains(14) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(15),
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(15) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(15) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '키링',
                                      style: TextStyle(
                                        color: _selectedItems.contains(15) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(16),
                                  child: Container(
                                    width: 48,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(16) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(16) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '치마',
                                      style: TextStyle(
                                        color: _selectedItems.contains(16) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                  onTap: () => _toggleItem(17),
                                  child: Container(
                                    width: 60,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: _selectedItems.contains(17) ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                      border: Border.all(
                                        width: 1,
                                        color: _selectedItems.contains(17) ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    alignment: Alignment.center, // 텍스트 중앙 정렬
                                    child: Text(
                                      '원피스',
                                      style: TextStyle(
                                        color: _selectedItems.contains(17) ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                color: Colors.black, // 원하는 색상
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add, // 플러스 아이콘
                                      size: 72, // 아이콘 크기 설정
                                      color: Colors.white, // 아이콘 색상 설정
                                    ),
                                    onPressed: () {
                                      // 버튼 클릭 시 동작할 코드
                                      print('플러스 버튼 클릭됨');
                                    },
                                  ),
                                ),
                              ),

                              SizedBox(width: 4), // 사이 간격
                              Container(
                                width: 162,
                                height: 216,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 만들기
                                  child: Image.asset(
                                    'assets/image/1111.png', // 이미지 파일 경로
                                    fit: BoxFit.cover, // 이미지 크기 조정
                                  ),
                                ),
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
                        child:Container(
                          width: 328,
                          height: 162,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '해당 컬러에 대해 추가적인 요청사항을 적어주세요.',
                              hintStyle: TextStyle(
                                color: Color(0xFFB0B0B0), // 힌트 텍스트 색상
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                letterSpacing: -0.35,
                              ),
                              border: InputBorder.none, // 테두리 제거
                              filled: true,
                              fillColor: Color(0xFFF6F6F6), // 배경색 설정
                              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), // 내부 여백 설정
                            ),
                            style: TextStyle(
                              color: Color(0xFF3D3D3D), // 입력 텍스트 색상
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              letterSpacing: -0.35,
                            ),
                            maxLines: null, // 여러 줄 입력 가능
                            minLines: 5, // 초기 줄 수 설정
                            keyboardType: TextInputType.multiline, // 멀티라인 입력을 위한 키보드 타입
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100), // 최대 글자 수 설정 (예: 100자)
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
                      //MaterialPageRoute(builder: (context) => QuotationImgSelect()),
                    MaterialPageRoute(builder: (context) => QuotationImgSelect(designerId: '',)), // Test3 화면으로 이동
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
                  _saveSelectedItems();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Test3(designerId: '',)
                    ), // designerId 사용
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

class QuotationImgSelectAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const QuotationImgSelectAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.only(left: 16),
          width: 360,
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
                iconSize: 24,
                color: Colors.black,
              ),
              SizedBox(width: 8),
              SizedBox(
                width: 248,
                height: 56,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
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
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh),
                iconSize: 24,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(360, kToolbarHeight);
}
