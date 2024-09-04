import 'package:flutter/material.dart';
import 'package:test_qwe/Quotation_img_select.dart';
import 'package:test_qwe/home_screen.dart';
import 'package:test_qwe/test5.dart';

void main() {
  runApp(MaterialApp(
    home: StyleSelect(),
  ));
}

class StyleSelect extends StatefulWidget {
  const StyleSelect({super.key});

  @override
  State<StyleSelect> createState() => _UserSetting();
}

class _UserSetting extends State<StyleSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 360,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    width: 360,
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomeScreen()),
                            );
                          },
                          icon: Icon(Icons.arrow_back),
                          iconSize: 24,
                          color: Colors.black,
                          style:
                              OutlinedButton.styleFrom(minimumSize: Size.zero),
                        ),
                        SizedBox(width: 8),
                        SizedBox(
                            width: 256,
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
                            )),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.refresh),
                          iconSize: 24,
                          color: Colors.black,
                          style:
                              OutlinedButton.styleFrom(minimumSize: Size.zero),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 360,
                    child: Column(
                      children: [
                        SizedBox(height: 24),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '아메리칸 캐주얼, 아메카지',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 1.4,
                                    letterSpacing: -0.60,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '를',
                                  style: TextStyle(
                                    color: Color(0xFF5D5D5D),
                                    fontSize: 24,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 1.4,
                                    letterSpacing: -0.60,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '선택해주셨습니다',
                              style: TextStyle(
                                color: Color(0xFF5D5D5D),
                                fontSize: 24,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 1.4,
                                letterSpacing: -0.60,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '원하는 옷을 알맞게 고르셨다면 다음 버튼을 눌러주세요',
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
                        ),
                        SizedBox(height: 24),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(width: 16),
                              imageContainer(0),
                              SizedBox(width: 4),
                              imageContainer(1),
                              SizedBox(width: 4),
                              imageContainer(2),
                              SizedBox(width: 4),
                              imageContainer(3),
                              SizedBox(width: 16),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                        Container(
                          width: 328,
                          height: 42,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFE7E7E7)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        QuotationImgSelect(designerId: '',)),
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
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
                        SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '이런 분위기를 낼 수 있어요',
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
                        ),
                        SizedBox(height: 8),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '아메카지',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 1.4,
                                    letterSpacing: -0.40,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  productFeatures(0, '캐주얼한 이미지'),
                                  SizedBox(width: 8),
                                  productFeatures(1, '개성있는'),
                                  SizedBox(width: 8),
                                  productFeatures(2, '편안함'),
                                  SizedBox(width: 8),
                                  productFeatures(3, '개성있는'),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  productFeatures(0, '레트로한 매력'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '아메카지',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 1.4,
                                    letterSpacing: -0.40,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  productFeatures2(0, '다양한 조합'),
                                  SizedBox(width: 8),
                                  productFeatures2(1, '편안함'),
                                  SizedBox(width: 8),
                                  productFeatures2(2, '자유로움'),
                                  SizedBox(width: 8),
                                  productFeatures2(3, '실용성'),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  productFeatures2(0, '트렌디'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 48),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Container(
                            width: 328,
                            height: 42,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Test5(designerId: '',)), // Test3 화면으로 이동
                                );
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF3D3D3D),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
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
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget imageContainer(int index) {
    return Stack(
      children: [
        Container(
          width: 162,
          height: 216,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Image.asset(
            "assets/image/test_img.png",
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget productFeatures(int index, String text) {
    return Stack(
      children: [
        Container(
          height: 27,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFE7E7E7)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Color(0xFF3D3D3D),
              fontSize: 13,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 1,
              letterSpacing: -0.33,
            ),
          ),
        )
      ],
    );
  }

  Widget productFeatures2(int index2, String text2) {
    return Stack(
      children: [
        Container(
          height: 27,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFE7E7E7)),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text(
            text2,
            style: TextStyle(
              color: Color(0xFF3D3D3D),
              fontSize: 13,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 1,
              letterSpacing: -0.33,
            ),
          ),
        )
      ],
    );
  }
}
