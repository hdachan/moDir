import 'package:flutter/material.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  int _currentStep = 0; // 현재 단계 저장
  final int _totalSteps = 5; // 총 단계 수
  final PageController _pageController = PageController(); // 페이지 컨트롤러

  @override
  void dispose() {
    _pageController.dispose(); // 페이지 컨트롤러 해제
    super.dispose();
  }

  void _goToStep(int step) {
    setState(() {
      _currentStep = step; // 현재 단계 업데이트
    });
    _pageController.animateToPage( // 페이지 이동 애니메이션
      step,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( // 뒤로 가기 버튼
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('견적서 작성하기'), // 앱바 타이틀
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CustomStepIndicator( // 단계 표시기
            totalSteps: _totalSteps,
            currentStep: _currentStep,
            onTap: _goToStep,
          ),
          Expanded(
            child: PageView( // 페이지 뷰
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentStep = index; // 현재 단계 업데이트
                });
              },
              children: [
                ProfileInputStep(), // 프로필 입력 단계
                SliderStep(), // 슬라이더 단계
                Container(child: Center(child: Text('Step 3'))), // 추가 단계
                Container(child: Center(child: Text('Step 4'))), // 추가 단계
                Container(child: Center(child: Text('Step 5'))), // 추가 단계
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton( // 이전 버튼
                    onPressed: _currentStep > 0
                        ? () => _goToStep(_currentStep - 1)
                        : null,
                    child: Text('이전'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton( // 다음 버튼
                    onPressed: _currentStep < _totalSteps - 1
                        ? () => _goToStep(_currentStep + 1)
                        : null,
                    child: Text('다음'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomStepIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final Function(int) onTap;

  const CustomStepIndicator({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row( // 단계 표시기 생성
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        return Row(
          children: [
            GestureDetector( // 각 단계를 탭할 수 있도록 함
              onTap: () => onTap(index),
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == currentStep ? Colors.purple : Colors.grey[300],
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: index == currentStep ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            if (index < totalSteps - 1)
              Container( // 단계 사이의 구분선
                width: 20,
                height: 2,
                color: Colors.grey[300],
              ),
          ],
        );
      }),
    );
  }
}

class ProfileInputStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('프로필 입력 단계'),
    );
  }
}

class SliderStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('슬라이더 단계'),
    );
  }
}
