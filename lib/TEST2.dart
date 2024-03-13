import 'package:flutter/material.dart';
import 'contents_onboard.dart';
import 'login_screen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 22, left: 30, bottom: 4),
              child: Container(
                width: 124,
                height: 24,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/eng_logo.png')
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return SingleChildScrollView( // 이미지 + 텍스트 - 수정
                    child: Padding(
                      padding: EdgeInsets.only(top: 118, bottom: 100, left: 43, right: 43), // 이미지 크기와 함께 수정 필요
                      child: Column(
                        children: [
                          Image.asset(contents[i].image),
                          SizedBox(height: 62), // 이미지 크기와 함께 수정 필요
                          Text(
                            textAlign: TextAlign.center,
                            contents[i].text,
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 26,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(height: 100),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    contents.length, (index) => buildPage(index, context)
                )
            ),
            Container( // 다음, 시작 하기 버튼 - 완료
              height: 54,
              width: double.infinity,
              margin: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 48),
              child: MaterialButton(
                onPressed: () async {
                  if (currentIndex == contents.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => login_screen()
                      ),
                    );
                  }
                  _controller.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                color: Color(0xFF4B0FFF),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  currentIndex == contents.length - 1
                      ? "시작하기"
                      : "다음",
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                    letterSpacing: -0.53,
                    fontSize: 21,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildPage(int index, BuildContext context) {
    return Container( // 코코볼 - 완료
      height: 12,
      width: 12,
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: ShapeDecoration(
        shape: OvalBorder(),
        color:
        currentIndex == index ? Color(0xFF4B0FFF) : Color(0xFFD1D1D1),
      ),
    );
  }
}