import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_qwe/test5.dart';

import 'test4.dart';

void main() {
  runApp(Test3(designerId: '디자이너 아이디 전달하기 위한 변수'));
}


class Test3 extends StatefulWidget { // Test3를 StatefulWidget으로 변경

  final String designerId; // 디자이너 ID 추가

  const Test3({Key? key, required this.designerId}) : super(key: key);
  @override
  _Test3State createState() => _Test3State(); // 상태 클래스를 생성
}

class _Test3State extends State<Test3> {
  String _warningMessage = ''; // 경고 메시지 상태 변수
  String _warningUpMessage = ''; // 경고 메시지 상태 변수
  String _warningBottomMessage = ''; // 경고 메시지 상태 변수

  int? _selectedFit; // 선택된 버튼을 저장하는 변수 (0: 슬림핏, 1: 레귤러핏)
  int? _selectedUpFit; // 선택된 버튼을 저장하는 변수 (0: 슬림핏, 1: 레귤러핏)
  int? _selectedBottomFit; // 선택된 버튼을 저장하는 변수 (0: 슬림핏, 1: 레귤러핏)

  bool _isDataSaved = false; // 데이터 저장 여부

  void _showSlimFitWarning() {
    setState(() {
      _selectedFit = 0; // 슬림핏이 선택됨
      _warningMessage = '몸에 딱 맞는 핏으로 세련된 느낌을 강조';
    });
  }
  void _showRegularFitWarning() {
    setState(() {
      _selectedFit = 1; // 레귤러핏이 선택됨
      _warningMessage = '기본적인 핏으로 몸에 적당히 맞아 깔끔한 인상';
    });
  }
  void _showWarning3() {
    setState(() {
      _selectedFit = 2; // 루즈핏
      _warningMessage = '오버핏보다 조금 더 슬림한 여유를 가진 핏'; // 레귤러핏 클릭 시 메시지 설정
    });
  }
  void _showWarning4() {
    setState(() {
      _selectedFit = 3; // 오버핏
      _warningMessage = '여유있는 실루엣으로 편안하고 캐주얼한 느낌'; // 레귤러핏 클릭 시 메시지 설정
    });
  }
  void _showWarning5() {
    setState(() {
      _selectedFit = 4; // 크롭핏
      _warningMessage = '허리선 위로 잘린 형태로, 다리 길이를 강조'; // 레귤러핏 클릭 시 메시지 설정
    });
  }
  void _showWarning6() {
    setState(() {
      _selectedFit = 5; // 롱핏
      _warningMessage = '엉덩이 아래까지 오는 기장으로 길고 여유있는 실루엣'; // 레귤러핏 클릭 시 메시지 설정
    });
  }

  @override
  void initState() {
    super.initState();
    _checkExistingData(); // 기존 데이터 확인
  }
  String? userId = FirebaseAuth.instance.currentUser?.uid;

  void _checkExistingData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var snapshot = await FirebaseFirestore.instance
          .collection('designer')
          .doc(widget.designerId)
          .collection('Quotation')
          .doc(widget.designerId)
          .get();

      if (snapshot.exists) { // 수정된 부분: 문서가 존재하는지 확인
        setState(() {
          _isDataSaved = true;
          // 기존 데이터가 있다면 핏 타입을 설정
          String fitTypeValue = snapshot['fitType'];
          _selectedFit = _mapFitTypeToIndex(fitTypeValue);

          // 상의 핏 타입이 있는 경우 설정
          String upFitTypeValue = snapshot['upFitType'];
          _selectedUpFit = _mapUpFitTypeToIndex(upFitTypeValue);

          // 하의 핏 타입 설정
          String bottomFitTypeValue = snapshot['bottomFitType'];
          _selectedBottomFit = _mapBottomFitTypeToIndex(bottomFitTypeValue); // 수정된 부분
        });
      }
    }
  }



  void _saveToServer(String userId) async {
    if (_selectedFit != null || _selectedUpFit != null || _selectedBottomFit != null) {
      String fitType;
      String upFitType;
      String bottomFitType;

      // 상의 핏 타입 설정
      switch (_selectedFit) {
        case 0:
          fitType = '슬림핏';
          break;
        case 1:
          fitType = '레귤러핏';
          break;
        case 2:
          fitType = '루즈핏';
          break;
        case 3:
          fitType = '오버핏';
          break;
        case 4:
          fitType = '크롭핏';
          break;
        case 5:
          fitType = '롱핏';
          break;
        default:
          fitType = '선택되지 않음';
          break;
      }

      // 상의 핏 타입 설정
      switch (_selectedUpFit) {
        case 0:
          upFitType = '슬림핏';
          break;
        case 1:
          upFitType = '레귤러핏';
          break;
        case 2:
          upFitType = '루즈핏';
          break;
        case 3:
          upFitType = '오버핏';
          break;
        case 4:
          upFitType = '크롭핏';
          break;
        case 5:
          upFitType = '롱핏';
          break;
        default:
          upFitType = '선택되지 않음';
          break;
      }

      // 하의 핏 타입 설정
      switch (_selectedBottomFit) {
        case 0:
          bottomFitType = '슬림핏';
          break;
        case 1:
          bottomFitType = '슬림 스트레이트핏';
          break;
        case 2:
          bottomFitType = '레귤러핏';
          break;
        case 3:
          bottomFitType = '테이퍼드핏';
          break;
        case 4:
          bottomFitType = '세미 와이드핏';
          break;
        case 5:
          bottomFitType = '와이드핏';
          break;
        default:
          bottomFitType = '선택되지 않음';
          break;
      }

      try {
        // 기존 데이터가 있으면 업데이트
        var snapshot = await FirebaseFirestore.instance
            .collection('designer')
            .doc(userId) // UID로 문서 접근
            .collection('Quotation')
            .get();

        if (snapshot.docs.isNotEmpty) {
          await FirebaseFirestore.instance
              .collection('designer')
              .doc(userId) // UID로 문서 접근
              .collection('Quotation')
              .doc(snapshot.docs.first.id) // 첫 번째 문서 업데이트
              .update({
            'fitType': fitType,
            'upFitType': upFitType,
            'bottomFitType': bottomFitType,
            'timestamp': FieldValue.serverTimestamp(),
          });
          print('서버에서 업데이트: $fitType, $upFitType, $bottomFitType');
        } else {
          // 새 데이터 추가
          await FirebaseFirestore.instance
              .collection('designer')
              .doc(userId) // UID로 문서 접근
              .collection('Quotation')
              .doc(userId) // UID로 문서 ID 설정
              .set({
            'fitType': fitType,
            'upFitType': upFitType,
            'bottomFitType': bottomFitType,
            'timestamp': FieldValue.serverTimestamp(),
          });
          setState(() {
            _isDataSaved = true; // 데이터가 저장되었음을 표시
          });
          print('서버에 저장: $fitType, $upFitType, $bottomFitType');
        }
      } catch (e) {
        print('저장 실패: $e');
      }
    } else {
      print('핏이 선택되지 않았거나 이미 저장되었습니다.');
    }
  }



  int _mapFitTypeToIndex(String fitType) { // 버튼색 불러오기용
    switch (fitType) {
      case '슬림핏':
        return 0;
      case '레귤러핏':
        return 1;
      case '루즈핏':
        return 2;
      case '오버핏':
        return 3;
      case '크롭핏':
        return 4;
      case '롱핏':
        return 5;
      default:
        return -1; // 선택되지 않음
    }
  }


  void _showFitUpWarning0() {
    setState(() {
      _selectedUpFit = 0; // 슬림핏이 선택됨
      _warningUpMessage = '정핏보다 몸에 딱 달라붙게 입는 핏';
    });
  }
  void _showFitUpWarning1() {
    setState(() {
      _selectedUpFit = 1; // 슬림핏이 선택됨
      _warningUpMessage = '옷이 몸에 너무 달라붙지 않고 많이 헐렁하지도 않은 정도';
    });
  }
  void _showFitUpWarning2() {
    setState(() {
      _selectedUpFit = 2; // 슬림핏이 선택됨
      _warningUpMessage = '자신의 체형보다 여유있는 핏';
    });
  }
  void _showFitUpWarning3() {
    setState(() {
      _selectedUpFit = 3; // 오버핏
      _warningUpMessage = '체형보다 한 사이즈 정도 넉넉한 핏'; // 레귤러핏 클릭 시 메시지 설정
    });
  }
  void _showFitUpWarning4() {
    setState(() {
      _selectedUpFit = 4; // 크롭핏
      _warningUpMessage = '허리선 위로 잘린 형태로, 다리 길이를 강조'; // 레귤러핏 클릭 시 메시지 설정
    });
  }

  int _mapUpFitTypeToIndex(String upFitType) { // 상의 핏 타입 매핑
    switch (upFitType) {
      case '슬림핏':
        return 0;
      case '레귤러핏':
        return 1;
      case '루즈핏':
        return 2;
      case '오버핏':
        return 3;
      case '크롭핏':
        return 4;
      case '롱핏':
        return 5;
      default:
        return -1; // 선택되지 않음
    }
  }

  void _showFitBottomWarning0() {
    setState(() {
      _selectedBottomFit = 0; // 슬림핏이 선택됨
      _warningBottomMessage = '힙에서 발목까지 전체적으로 일자로 곧게 내려오는 스타일';
    });
  }

  void _showFitBottomWarning1() {
    setState(() {
      _selectedBottomFit = 1; // 슬림핏이 선택됨
      _warningBottomMessage = '허리에서 엉덩이까지는 슬림하고 무릎 아래로는 일자 형태';
    });
  }

  void _showFitBottomWarning2() {
    setState(() {
      _selectedBottomFit = 2; // 슬림핏이 선택됨
      _warningBottomMessage = '허벅지부터 종아리까지 일정하게 떨어지는 핏';
    });
  }

  void _showFitBottomWarning3() {
    setState(() {
      _selectedBottomFit = 3; // 슬림핏이 선택됨
      _warningBottomMessage = '정핏보다 몸에 딱 달라붙게 입는 핏';
    });
  }

  void _showFitBottomWarning4() {
    setState(() {
      _selectedBottomFit = 4; // 슬림핏이 선택됨
      _warningBottomMessage = '허벅지에서 밑단으로 내려가며 점점 통이 좁아지는 핏';
    });
  }

  void _showFitBottomWarning5() {
    setState(() {
      _selectedBottomFit = 5; // 슬림핏이 선택됨
      _warningBottomMessage = '레귤러보다 품이 널널하고  핏이 일정하게 떨어지는 핏';
    });
  }

  int _mapBottomFitTypeToIndex(String fitType) { // 바텀 버튼색 불러오기용
    switch (fitType) {
      case '슬림핏':
        return 0;
      case '슬림 스트레이트핏':
        return 1;
      case '레귤러핏':
        return 2;
      case '테이퍼드핏':
        return 3;
      case '세미 와이드핏':
        return 4;
      case '와이드핏':
        return 5;
      default:
        return -1; // 선택되지 않음
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
                                color: Colors.white, // 내부 컨테이너 색상
                              ),
                              alignment: Alignment.center, // 텍스트 중앙 정렬
                              child: Text(
                                '1',
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
                                color: Color(0xFF3D3D3D), // 내부 컨테이너 색상
                              ),
                              alignment: Alignment.center, // 텍스트 중앙 정렬
                              child: Text(
                                '2',
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
                                        onTap: () {
                                          setState(() {
                                            _selectedFit = 0; // 슬림핏 선택
                                          });
                                          _showSlimFitWarning(); // 경고 메시지 표시
                                        },
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedFit == 0 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedFit == 0 ? Colors.transparent : Color(0xFFE7E7E7), // 슬림핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            '슬림핏',
                                            style: TextStyle(
                                              color: _selectedFit == 0 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedFit = 1; // 슬림핏 선택
                                          });
                                          _showRegularFitWarning(); // 경고 메시지 표시
                                        },
                                        child: Container(
                                          width: 72,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedFit == 1 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedFit == 1 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            '레귤러핏',
                                            style: TextStyle(
                                              color: _selectedFit == 1 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedFit = 3; // 슬림핏 선택
                                          });
                                          _showWarning3(); // 경고 메시지 표시
                                        },

                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedFit == 2 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedFit == 2 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '루즈핏',
                                            style: TextStyle(
                                              color: _selectedFit == 2 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedFit = 4; // 슬림핏 선택
                                          });
                                          _showWarning4(); // 경고 메시지 표시
                                        },
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedFit == 3 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedFit == 3 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),

                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '오버핏',
                                            style: TextStyle(
                                              color: _selectedFit == 3 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedFit = 5; // 슬림핏 선택
                                          });
                                          _showWarning5(); // 경고 메시지 표시
                                        },
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedFit == 4 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedFit == 4 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '크롭핏',
                                            style: TextStyle(
                                              color: _selectedFit == 4 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedFit = 6; // 슬림핏 선택
                                          });
                                          _showWarning6(); // 경고 메시지 표시
                                        },
                                        child: Container(
                                          width: 48,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedFit == 5 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedFit == 5 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '롱핏',
                                            style: TextStyle(
                                              color: _selectedFit == 5 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedUpFit = 0; // 슬림핏 선택
                                          });
                                          _showFitUpWarning0(); // 경고 메시지 표시
                                        },
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedUpFit == 0 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedUpFit == 0 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '슬림핏',
                                            style: TextStyle(
                                              color: _selectedUpFit == 0 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedUpFit = 1; // 슬림핏 선택
                                          });
                                          _showFitUpWarning1(); // 경고 메시지 표시
                                        },

                                        child: Container(
                                          width: 72,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedUpFit == 1 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedUpFit == 1 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '레귤러핏',
                                            style: TextStyle(
                                              color: _selectedUpFit == 1 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedUpFit = 2; // 슬림핏 선택
                                          });
                                          _showFitUpWarning2(); // 경고 메시지 표시
                                        },

                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedUpFit == 2 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedUpFit == 2 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '루즈핏',
                                            style: TextStyle(
                                              color: _selectedUpFit == 2 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedUpFit = 3; // 슬림핏 선택
                                          });
                                          _showFitUpWarning3(); // 경고 메시지 표시
                                        },

                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedUpFit == 3 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedUpFit == 3 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '오버핏',
                                            style: TextStyle(
                                              color: _selectedUpFit == 3 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedUpFit = 4; // 슬림핏 선택
                                          });
                                          _showFitUpWarning4(); // 경고 메시지 표시
                                        },

                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedUpFit == 4 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedUpFit == 4 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '크롭핏',
                                            style: TextStyle(
                                              color: _selectedUpFit == 4 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                            if (_warningUpMessage.isNotEmpty) WarningContainer1(_warningUpMessage),

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
                                      GestureDetector( //여기
                                        onTap: () {
                                          setState(() {
                                            _selectedBottomFit = 0; // 슬림핏 선택
                                          });
                                          _showFitBottomWarning0(); // 경고 메시지 표시
                                        },
                                        child: Container(
                                          width: 60,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedBottomFit == 0 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedUpFit == 0 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '슬림핏',
                                            style: TextStyle(
                                              color: _selectedBottomFit == 0 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedBottomFit = 1; // 슬림핏 선택
                                          });
                                          _showFitBottomWarning1(); // 경고 메시지 표시
                                        },
                                        child: Container(
                                          width: 122,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedBottomFit == 1 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedBottomFit == 1 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '슬림 스트레이트핏',
                                            style: TextStyle(
                                              color: _selectedBottomFit == 1 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedBottomFit = 2; // 슬림핏 선택
                                          });
                                          _showFitBottomWarning2(); // 경고 메시지 표시
                                        },
                                        child: Container(
                                          width: 72,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedBottomFit == 2 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedUpFit == 2 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '레귤러핏',
                                            style: TextStyle(
                                              color: _selectedBottomFit == 2 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedBottomFit = 3; // 슬림핏 선택
                                          });
                                          _showFitBottomWarning3(); // 경고 메시지 표시
                                        },
                                        child: Container(
                                          width: 84,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedBottomFit == 3 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedBottomFit == 3 ? Colors.transparent : Color(0xFFE7E7E7),
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '테이퍼드핏',
                                            style: TextStyle(
                                              color: _selectedBottomFit == 3 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedBottomFit = 4; // 슬림핏 선택
                                          });
                                          _showFitBottomWarning4(); // 경고 메시지 표시
                                        },
                                        child: Container(
                                          width: 99,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedBottomFit == 4 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedUpFit == 4 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '세미 와이드핏',
                                            style: TextStyle(
                                              color: _selectedBottomFit == 4 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                                        onTap: () {
                                          setState(() {
                                            _selectedBottomFit = 5; // 슬림핏 선택
                                          });
                                          _showFitBottomWarning5(); // 경고 메시지 표시
                                        },
                                        child: Container(
                                          width: 72,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: _selectedBottomFit == 5 ? Color(0xFF3D3D3D) : Colors.transparent, // 컨테이너 색상
                                            border: Border.all(
                                              width: 1,
                                              color: _selectedUpFit == 5 ? Colors.transparent : Color(0xFFE7E7E7), // 레귤러핏 클릭 시 테두리 색상
                                            ),
                                            borderRadius: BorderRadius.circular(100),
                                          ),

                                          alignment: Alignment.center, // 텍스트 중앙 정렬
                                          child: Text(
                                            '와이드핏',
                                            style: TextStyle(
                                              color: _selectedBottomFit == 5 ? Color(0xFFFFFFFF) : Color(0xFF5D5D5D), // 글자 색상
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
                            if (_warningBottomMessage.isNotEmpty) WarningContainer2(_warningBottomMessage),

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
                    MaterialPageRoute(builder: (context) => Test5(designerId: '',)), // Test3 화면으로 이동
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
                  // 현재 사용자 가져오기
                  User? user = FirebaseAuth.instance.currentUser;

                  if (user != null) {
                    String userId = user.uid; // 사용자 UID 가져오기
                    _saveToServer(userId); // 서버에 저장
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Test4()), // Test4 화면으로 이동
                    );
                  } else {
                    print('사용자가 로그인하지 않았습니다.');
                  }
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

Widget WarningContainer1(String message) {
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

Widget WarningContainer2(String message) {
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
