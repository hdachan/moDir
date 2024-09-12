// 견적서 마이프로필 화면

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'MyStyleInfo.dart';
import 'Quotation_img_select.dart';

class DetailScreen extends StatefulWidget {
  final String designerId;
  final String name;
  final String introduction;
  final String classification;
  final String price;
  final String imageUrl;
  final int reviewCount;
  final String gender;

  DetailScreen({
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
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String? kgValue;
  String? cmValue;
  String? facesizeValue;
  String? faceValue;
  String? shoulderValue;
  String? pelvisValue;
  String? thighValue;
  String? calfValue;
  String? chestValue;
  String? shouldersizeValue;

  @override
  void initState() {
    super.initState();
    fetchCmAndKgValue();
  }


  List<String> selectedOptions = [];

  Future<void> fetchCmAndKgValue() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String uid = user.uid;
        DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

        setState(() {
          if (doc.exists) {
            cmValue = _getFieldValue(doc, 'cm');
            kgValue = _getFieldValue(doc, 'kg');
            facesizeValue = _getFieldValue(doc, 'facesizeValue');
            faceValue = _getFieldValue(doc, 'faceValue');
            shoulderValue = _getFieldValue(doc, 'shoulderValue');
            pelvisValue = _getFieldValue(doc, 'pelvisValue');
            thighValue = _getFieldValue(doc, 'thighValue');
            calfValue = _getFieldValue(doc, 'calfValue');
            chestValue = _getFieldValue(doc, 'chestValue');
            shouldersizeValue = _getFieldValue(doc, 'shouldersizeValue');

            // selectedOptions 문자열을 리스트로 변환
            String optionsString = _getFieldValue(doc, 'selectedOptions'); // selectedOptions 필드에서 값 가져오기
            selectedOptions = optionsString.split(',').map((option) => option.trim()).toList(); // 공백 제거 및 리스트로 변환

            // selectedOptions 출력
            for (String option in selectedOptions) {
              print(option);
            }
          } else {
            print('문서가 존재하지 않습니다.');
            _setDefaultValues();
          }
        });
      }
    } catch (e) {
      print('에러 발생: $e');
    }
  }


  String _getFieldValue(DocumentSnapshot doc, String field) {
    return doc[field] as String? ?? '';
  }

  void _setDefaultValues() {
    cmValue = '';
    kgValue = '';
    facesizeValue = '';
    faceValue = '';
    shoulderValue = '';
    pelvisValue = '';
    thighValue = '';
    calfValue = '';
    chestValue = '';
    shouldersizeValue = '';
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuotationImgSelectAppBar(
        designerId: widget.designerId, // 위젯에서 가져온 값
        name: widget.name, // 위젯에서 가져온 값
        introduction: widget.introduction, // 위젯에서 가져온 값
        classification: widget.classification, // 위젯에서 가져온 값
        price: widget.price, // 위젯에서 가져온 값
        imageUrl: widget.imageUrl, // 위젯에서 가져온 값
        reviewCount: widget.reviewCount, // 위젯에서 가져온 값
        gender: widget.gender, // 위젯에서 가져온 값
      ),


    body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 360,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 360,
                  height: 208,
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 32),
                  child: Column(
                    children: [
                      Container(
                        width: 328,
                        height: 28,
                        child: Text(
                          '프로필 정보가 맞나요?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                            letterSpacing: -0.50,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        width: 328,
                        height: 112,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 328,
                              height: 36,
                              child: Text(
                                '올바른 프로필 정보가 있어야지만 스타일리스트가 고객님에게 정확한 스타일을 추천해드릴 수 있습니다',
                                style: TextStyle(
                                  color: Color(0xFF888888),
                                  fontSize: 13,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.4,
                                  letterSpacing: -0.33,
                                ),
                              ),
                            ),
                            SizedBox(height: 24), // 사이즈박스 24
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyStyleInfo(designerId: '',)),
                                );
                              },
                              borderRadius: BorderRadius.circular(4), // 둥근 모서리
                              child: Container(
                                width: 328,
                                height: 52,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Color(0xFFE7E7E7)),
                                  borderRadius: BorderRadius.circular(4), // 둥근 모서리
                                ),
                                child: Text(
                                  '프로필 수정',
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
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 328,
                  padding: EdgeInsets.only(left: 16, right: 16, top: 32),
                  color: Color(0xFFF6F6F6), // 올바른 색상 정의
                  child: Column(
                    children: [
                      infoContainerWidget([
                        shapeTextWidget('체형'),
                        weightDisplayWidget('몸무게', '$kgValue kg'),
                        weightDisplayWidget('키', '$cmValue cm'),
                        weightDisplayWidget(
                            '체구', '여기 넣어야됨'),
                      ]),

                      SizedBox(height: 24),

                      infoContainerWidget([
                        shapeTextWidget('얼굴'),
                        weightDisplayWidget('얼굴형', '$facesizeValue'),
                        weightDisplayWidget('피부톤', '$faceValue'),
                      ]),

                      SizedBox(height: 24),

                      infoContainerWidget([
                        shapeTextWidget('상의 사이즈'),
                        weightDisplayWidget('어꺠넓이', '$shouldersizeValue'),
                        weightDisplayWidget('어깨모양', '$shoulderValue'),
                        weightDisplayWidget('흉부', '$chestValue'),
                      ]),

                      SizedBox(height: 24),

                      infoContainerWidget([
                        shapeTextWidget('하의 사이즈'),
                        weightDisplayWidget('골반', '$pelvisValue'),
                        weightDisplayWidget('허벅지', '$thighValue'),
                        weightDisplayWidget('종아리', '$calfValue'),
                      ]),

                    ],
                  ),
                ),
                SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
        bottomNavigationBar: QuotationImgSelectBottombar(designerId: widget.designerId),
    );
  }
}

Widget shapeTextWidget(String text) {
  return Container(
    width: 296,
    padding: EdgeInsets.only(bottom: 12, top: 12),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 1,
          color: Color(0xFFF6F6F6), // 아래쪽 테두리 두께 설정
        ),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: Color(0xFF3D3D3D),
        fontSize: 16,
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w500,
        height: 1.2,
        letterSpacing: -0.40,
      ),
    ),
  );
}

Widget weightDisplayWidget(String label, String value) {
  return Container(
    width: 296,
    padding: EdgeInsets.only(bottom: 12, top: 12),
    color: Colors.white, // 내부 컨테이너 색상
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양쪽 끝으로 배치
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF888888),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: -0.35,
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF3D3D3D),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
            height: 1.2,
            letterSpacing: -0.35,
          ),
        ),
      ],
    ),
  );
}

Widget infoContainerWidget(List<Widget> children) {
  return Container(
    width: 328,
    padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
    decoration: ShapeDecoration(
      color: Colors.white, // 배경색
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color(0xFFE7E7E7)), // 테두리
        borderRadius: BorderRadius.circular(12), // 테두리 둥글기
      ),
    ),
    child: Column(
      children: children,
    ),
  );
}


class QuotationImgSelectAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String designerId;
  final String name;
  final String introduction;
  final String classification;
  final String price;
  final String imageUrl;
  final int reviewCount;
  final String gender;

  QuotationImgSelectAppBar({
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 16),
        width: 360,
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context); // 뒤로가기
              },
              icon: Icon(Icons.arrow_back),
              iconSize: 24,
              color: Colors.black,
            ),
            SizedBox(width: 8),
            Expanded(
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
              onPressed: () {
              },
              icon: Icon(Icons.refresh),
              iconSize: 24,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(360, kToolbarHeight);
}

class QuotationImgSelectBottombar extends StatelessWidget {
  final String designerId; // designerId를 필드로 추가

  QuotationImgSelectBottombar({required this.designerId}); // 생성자에서 필드 초기화
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Container(
            width: 360,
            height: 66,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1, color: Color(0xFFE7E7E7)),
              ),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuotationImgSelect(designerId: designerId)), // designerId 사용
                );
              },
              color: Color(0xFF888888),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '견적서 작성하기',
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
          ),
        ),
      ],
    );
  }
}