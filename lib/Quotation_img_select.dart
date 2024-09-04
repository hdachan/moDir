import 'package:flutter/material.dart';
import 'package:test_qwe/test5.dart';

void main() {
  runApp(MaterialApp(
    home: QuotationImgSelect(designerId: 'example_id'),
  ));
}

class QuotationImgSelect extends StatefulWidget {
  final String designerId; // 디자이너 ID 추가

  const QuotationImgSelect({Key? key, required this.designerId}) : super(key: key);


  @override
  State<QuotationImgSelect> createState() => _QuotationImgSelectState ();
}

class _QuotationImgSelectState  extends State<QuotationImgSelect> {
  List<bool> selectedImages = [
    false,
    false,
    false,
    false
  ]; // Track selected images

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuotationImgSelectAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 360,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 360,
                  height: 121,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.designerId,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            letterSpacing: -0.60,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '추천 받고 싶은 스타일과 비슷한 사진을 5개 이상 골라 주세요\n고르신 스타일이 어떤 패션인지 알려드릴게요',
                          style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 13,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                            letterSpacing: -0.33,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 360,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          imageContainer(0),
                          SizedBox(width: 4),
                          imageContainer(1),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          imageContainer(2),
                          SizedBox(width: 4),
                          imageContainer(3),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: QuotationImgSelectBottombar(designerId: widget.designerId),
    );
  }

  Widget imageContainer(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImages[index] = !selectedImages[index];
        });
      },
      child: Stack(
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
          if (selectedImages[index])
            Container(
              width: 162,
              height: 216,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// 앱 바

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

class QuotationImgSelectBottombar extends StatelessWidget {
  final String designerId; // 디자이너 ID 추가

  const QuotationImgSelectBottombar({Key? key, required this.designerId}) : super(key: key);

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
                  MaterialPageRoute(builder: (context) => Test5(designerId: designerId)), // designerId 사용
                );

              },
              color: Color(0xFF888888),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
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
        ),
      ],
    );
  }
}
