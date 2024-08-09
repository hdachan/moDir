import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: ReservationPage(),
  ));
}

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  int _currentStep = 0; // 현재 단계
  final int _totalSteps = 5; // 총 단계 수
  final PageController _pageController = PageController(); // 페이지 컨트롤러
  final String designerId = 'HbOEEhjnMomtkLP0xo1Z'; // 디자이너 ID 설정
  String? classification; // 분류 정보를 저장할 변수

  @override
  void initState() {
    super.initState();
    _fetchClassification(); // 분류 정보 가져오기
  }

  @override
  void dispose() {
    _pageController.dispose(); // 페이지 컨트롤러 해제
    super.dispose();
  }

  Future<void> _fetchClassification() async {
    try {
      DocumentSnapshot designerDoc = await FirebaseFirestore.instance
          .collection('designer')
          .doc(designerId)
          .get();

      if (designerDoc.exists) {
        var data = designerDoc.data() as Map<String, dynamic>?; // 데이터가 Map 형태인지 확인
        if (data != null && data.containsKey('classification')) {
          setState(() {
            classification = data['classification'] as String?; // 안전하게 캐스팅
          });
        } else {
          print('classification 필드가 존재하지 않거나 데이터가 null입니다.');
        }
      } else {
        print('디자이너 문서가 존재하지 않습니다.');
      }
    } catch (e) {
      print('데이터 가져오기 오류: $e'); // 오류 로그 출력
    }
  }


  void _goToStep(int step) {
    setState(() {
      _currentStep = step; // 현재 단계 업데이트
    });
    _pageController.animateToPage(
      step,
      duration: Duration(milliseconds: 300), // 애니메이션 시간
      curve: Curves.easeInOut, // 애니메이션 곡선
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // 뒤로 가기 버튼
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('견적서 작성하기'), // 앱바 타이틀
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomStepIndicator(
            totalSteps: _totalSteps,
            currentStep: _currentStep,
            onTap: _goToStep, // 단계 클릭 시 이동
          ),
          Expanded(child: _buildPageView()), // 페이지 뷰
          _buildNavigationButtons(), // 내비게이션 버튼
        ],
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) => setState(() => _currentStep = index), // 페이지 변경 시 현재 단계 업데이트
      children: List.generate(
        _totalSteps,
            (index) {
          if (index == 0) {
            return _buildStepOne(); // 첫 번째 단계 내용
          }
          return Center(child: Text('Step ${index + 1}')); // 나머지 단계 내용
        },
      ),
    );
  }

  Widget _buildStepOne() {
    if (classification == null) {
      return Center(child: CircularProgressIndicator()); // 로딩 중일 때 표시
    }

    // 각 버튼 활성화 조건 설정
    bool isVintage = classification!.contains('빈티지');
    bool isAmeKaji = classification!.contains('아메카지');
    bool isCasual = classification!.contains('캐주얼');
    bool isFormal = classification!.contains('포멀');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClassificationButton(
              label: '빈티지 버튼',
              isEnabled: isVintage,
              onPressed: isVintage ? () => print('빈티지') : null,
            ),
            ClassificationButton(
              label: '아메카지 버튼',
              isEnabled: isAmeKaji,
              onPressed: isAmeKaji ? () => print('아메카지') : null,
            ),
            ClassificationButton(
              label: '캐주얼 버튼',
              isEnabled: isCasual,
              onPressed: isCasual ? () => print('캐주얼') : null,
            ),
            ClassificationButton(
              label: '포멀 버튼',
              isEnabled: isFormal,
              onPressed: isFormal ? () => print('포멀') : null,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0), // 버튼 여백
      child: Row(
        children: [
          Expanded(
            child: _buildButton('이전', _currentStep > 0 ? () => _goToStep(_currentStep - 1) : null, Colors.white, Colors.black), // 이전 버튼
          ),
          SizedBox(width: 16), // 버튼 간격
          Expanded(
            child: _buildButton('다음', _currentStep < _totalSteps - 1 ? () => _goToStep(_currentStep + 1) : null, Colors.black, Colors.white), // 다음 버튼
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback? onPressed, Color bgColor, Color textColor) {
    return ElevatedButton(
      onPressed: onPressed, // 버튼 클릭 시 동작
      child: Text(text),
      style: ElevatedButton.styleFrom(primary: bgColor, onPrimary: textColor), // 버튼 스타일
    );
  }
}

class ClassificationButton extends StatelessWidget {
  final String label; // 버튼 텍스트
  final bool isEnabled; // 버튼 활성화 여부
  final VoidCallback? onPressed; // 버튼 클릭 시 호출될 콜백

  ClassificationButton({
    required this.label,
    required this.isEnabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null, // 활성화 조건
      child: Text(label), // 버튼 텍스트
      style: ElevatedButton.styleFrom(
        primary: isEnabled ? Colors.blue : Colors.grey, // 색상 설정
      ),
    );
  }
}

class CustomStepIndicator extends StatelessWidget {
  final int totalSteps; // 총 단계 수
  final int currentStep; // 현재 단계
  final Function(int) onTap; // 단계 클릭 시 동작

  const CustomStepIndicator({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        return Row(
          children: [
            GestureDetector(
              onTap: () => onTap(index), // 단계 클릭 시 해당 단계로 이동
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == currentStep ? Colors.purple : Colors.grey[300], // 현재 단계 색상
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: index == currentStep ? Colors.white : Colors.black, // 텍스트 색상
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            if (index < totalSteps - 1)
              Container(
                width: 20,
                height: 2,
                color: Colors.grey[300], // 단계 사이의 구분선
              ),
          ],
        );
      }),
    );
  }
}



// import 'package:flutter/material.dart'; // Flutter의 Material 디자인 라이브러리
// import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore 데이터베이스 사용을 위한 라이브러리
//
// class SliderStep extends StatelessWidget {
//   final String designerId = 'HbOEEhjnMomtkLP0xo1Z'; // 디자이너 ID 설정
//
//   // Firestore에서 classification 데이터를 가져오는 비동기 함수
//   Future<String?> _fetchClassification() async {
//     // 해당 디자이너의 문서를 가져옴
//     DocumentSnapshot designerDoc = await FirebaseFirestore.instance
//         .collection('designer') // 'designer' 컬렉션에서
//         .doc(designerId) // 특정 디자이너 ID 문서 조회
//         .get();
//
//     // 문서의 데이터가 존재하면 classification 반환, 없으면 null 반환
//     return designerDoc.data() != null ? (designerDoc.data() as Map<String, dynamic>)['classification'] as String? : null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FutureBuilder<String?>(
//         future: _fetchClassification(), // Firestore에서 데이터를 가져오는 비동기 작업
//         builder: (context, snapshot) {
//           // 데이터 로딩 중일 때
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator(); // 로딩 스피너 표시
//           }
//           // 데이터 가져오기 중 오류 발생 시
//           else if (snapshot.hasError) {
//             return Text('오류 발생: ${snapshot.error}'); // 오류 메시지 표시
//           }
//           // 데이터가 없거나 비어 있을 경우
//           else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Text('분류 정보가 없습니다.'); // 데이터 없음 메시지 표시
//           }
//
//           // 가져온 classification 문자열
//           String classification = snapshot.data!;
//           // 각 버튼 활성화 조건 설정
//           bool isVintage = classification.contains('빈티지'); // '빈티지' 포함 여부
//           bool isAmeKaji = classification.contains('아메카지'); // '아메카지' 포함 여부
//           bool isCasual = classification.contains('캐주얼'); // '캐주얼' 포함 여부
//           bool isfomor = classification.contains('포멀');
//
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('슬라이더 단계'), // 제목
//               SizedBox(height: 20), // 여백
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ClassificationButton(
//                     label: '빈티지 버튼',
//                     isEnabled: isVintage,
//                     onPressed: () {
//                       print('빈티지'); // 버튼 클릭 시 '빈티지' 출력
//                     },
//                   ),
//                   ClassificationButton(
//                     label: '아메카지 버튼',
//                     isEnabled: isAmeKaji,
//                     onPressed: () {
//                       print('아메카지'); // 버튼 클릭 시 '아메카지' 출력
//                     },
//                   ),
//                   ClassificationButton(
//                     label: '캐주얼 버튼',
//                     isEnabled: isCasual,
//                     onPressed: () {
//                       print('캐주얼'); // 버튼 클릭 시 '캐주얼' 출력
//                     },
//                   ),
//                   ClassificationButton(
//                     label: '포멀 버튼',
//                     isEnabled: isfomor,
//                     onPressed: () {
//                       print('포멀'); // 버튼 클릭 시 '캐주얼' 출력
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// // 버튼을 위한 별도 클래스
// class ClassificationButton extends StatelessWidget {
//   final String label; // 버튼 텍스트
//   final bool isEnabled; // 버튼 활성화 여부
//   final VoidCallback? onPressed; // 버튼 클릭 시 호출될 콜백
//
//   ClassificationButton({
//     required this.label,
//     required this.isEnabled,
//     required this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: isEnabled ? onPressed : null, // 활성화 조건
//       child: Text(label), // 버튼 텍스트
//       style: ElevatedButton.styleFrom(
//         primary: isEnabled ? Colors.blue : Colors.grey, // 색상 설정
//       ),
//     );
//   }
// }





