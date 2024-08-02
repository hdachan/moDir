// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import 'package:flutter/material.dart';
//
// class ReservationPage extends StatefulWidget {
//   @override
//   _ReservationPageState createState() => _ReservationPageState();
// }
//
// class _ReservationPageState extends State<ReservationPage> {
//   int _currentStep = 0; // 현재 단계 저장
//   final int _totalSteps = 5; // 총 단계 수
//   final PageController _pageController = PageController(); // 페이지 컨트롤러
//
//   @override
//   void dispose() {
//     _pageController.dispose(); // 페이지 컨트롤러 해제
//     super.dispose();
//   }
//
//   void _goToStep(int step) {
//     setState(() {
//       _currentStep = step; // 현재 단계 업데이트
//     });
//     _pageController.animateToPage( // 페이지 이동 애니메이션
//       step,
//       duration: Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton( // 뒤로 가기 버튼
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Text('견적서 작성하기'), // 앱바 타이틀
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 20),
//           CustomStepIndicator( // 단계 표시기
//             totalSteps: _totalSteps,
//             currentStep: _currentStep,
//             onTap: _goToStep,
//           ),
//           Expanded(
//             child: PageView( // 페이지 뷰
//               controller: _pageController,
//               onPageChanged: (index) {
//                 setState(() {
//                   _currentStep = index; // 현재 단계 업데이트
//                 });
//               },
//               children: [
//                 SliderStep(designerId: 'your_designer_id_here'), // 슬라이더 단계
//                 Container(child: Center(child: Text('Step 3'))), // 추가 단계
//                 Container(child: Center(child: Text('Step 4'))), // 추가 단계
//                 Container(child: Center(child: Text('Step 5'))), // 추가 단계
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton( // 이전 버튼
//                     onPressed: _currentStep > 0
//                         ? () => _goToStep(_currentStep - 1)
//                         : null,
//                     child: Text('이전'),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.white,
//                       onPrimary: Colors.black,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: ElevatedButton( // 다음 버튼
//                     onPressed: _currentStep < _totalSteps - 1
//                         ? () => _goToStep(_currentStep + 1)
//                         : null,
//                     child: Text('다음'),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.black,
//                       onPrimary: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class CustomStepIndicator extends StatelessWidget {
//   final int totalSteps;
//   final int currentStep;
//   final Function(int) onTap;
//
//   const CustomStepIndicator({
//     Key? key,
//     required this.totalSteps,
//     required this.currentStep,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row( // 단계 표시기 생성
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(totalSteps, (index) {
//         return Row(
//           children: [
//             GestureDetector( // 각 단계를 탭할 수 있도록 함
//               onTap: () => onTap(index),
//               child: Container(
//                 width: 30,
//                 height: 30,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: index == currentStep ? Colors.purple : Colors.grey[300],
//                 ),
//                 child: Center(
//                   child: Text(
//                     '${index + 1}',
//                     style: TextStyle(
//                       color: index == currentStep ? Colors.white : Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (index < totalSteps - 1)
//               Container( // 단계 사이의 구분선
//                 width: 20,
//                 height: 2,
//                 color: Colors.grey[300],
//               ),
//           ],
//         );
//       }),
//     );
//   }
// }
//
// class ProfileInputStep extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('프로필 입력 단계'),
//           SizedBox(height: 20), // 텍스트와 버튼 사이의 간격
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 버튼을 고르게 배치
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // 첫 번째 버튼 클릭 시 수행할 작업
//                   print('빈티지');
//                 },
//                 child: Text('첫 번째 버튼'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // 두 번째 버튼 클릭 시 수행할 작업
//                   print('아메카지');
//                 },
//                 child: Text('두 번째 버튼'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class SliderStep extends StatelessWidget {
//   final String designerId; // 디자이너 ID를 전달받아야 합니다.
//
//   // 생성자에서 designerId를 필수로 받습니다.
//   SliderStep({required this.designerId});
//
//   Future<String?> _fetchClassification() async {
//     DocumentSnapshot designerDoc = await FirebaseFirestore.instance
//         .collection('designer')
//         .doc(designerId)
//         .get();
//
//     // 데이터가 존재하지 않을 경우 null 반환
//     return designerDoc.data() != null ? (designerDoc.data() as Map<String, dynamic>)['classification'] as String? : null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FutureBuilder<String?>(
//         future: _fetchClassification(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator(); // 데이터 로딩 중 표시
//           } else if (snapshot.hasError) {
//             return Text('오류 발생: ${snapshot.error}');
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Text('분류 정보가 없습니다.');
//           }
//
//           String classification = snapshot.data!;
//
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('슬라이더 단계'),
//               SizedBox(height: 20), // 텍스트와 버튼 사이의 간격
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 버튼을 고르게 배치
//                 children: [
//                   if (classification.contains('빈티지')) // "빈티지"가 포함된 경우 버튼 생성
//                     ElevatedButton(
//                       onPressed: () {
//                         // 빈티지 버튼 클릭 시 수행할 작업
//                         print('빈티지');
//                       },
//                       child: Text('빈티지 버튼'),
//                     ),
//                   if (classification.contains('아메카지')) // "아메카지"가 포함된 경우 버튼 생성
//                     ElevatedButton(
//                       onPressed: () {
//                         // 아메카지 버튼 클릭 시 수행할 작업
//                         print('아메카지');
//                       },
//                       child: Text('아메카지 버튼'),
//                     ),
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
import 'package:flutter/material.dart'; // Flutter의 Material 디자인 라이브러리
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore 데이터베이스 사용을 위한 라이브러리

class SliderStep extends StatelessWidget {
  final String designerId = 'HbOEEhjnMomtkLP0xo1Z'; // 디자이너 ID 설정

  // Firestore에서 classification 데이터를 가져오는 비동기 함수
  Future<String?> _fetchClassification() async {
    // 해당 디자이너의 문서를 가져옴
    DocumentSnapshot designerDoc = await FirebaseFirestore.instance
        .collection('designer') // 'designer' 컬렉션에서
        .doc(designerId) // 특정 디자이너 ID 문서 조회
        .get();

    // 문서의 데이터가 존재하면 classification 반환, 없으면 null 반환
    return designerDoc.data() != null ? (designerDoc.data() as Map<String, dynamic>)['classification'] as String? : null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String?>(
        future: _fetchClassification(), // Firestore에서 데이터를 가져오는 비동기 작업
        builder: (context, snapshot) {
          // 데이터 로딩 중일 때
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // 로딩 스피너 표시
          }
          // 데이터 가져오기 중 오류 발생 시
          else if (snapshot.hasError) {
            return Text('오류 발생: ${snapshot.error}'); // 오류 메시지 표시
          }
          // 데이터가 없거나 비어 있을 경우
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('분류 정보가 없습니다.'); // 데이터 없음 메시지 표시
          }

          // 가져온 classification 문자열
          String classification = snapshot.data!;
          // 각 버튼 활성화 조건 설정
          bool isVintage = classification.contains('빈티지'); // '빈티지' 포함 여부
          bool isAmeKaji = classification.contains('아메카지'); // '아메카지' 포함 여부
          bool isCasual = classification.contains('캐주얼'); // '캐주얼' 포함 여부
          bool isfomor = classification.contains('포멀');

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('슬라이더 단계'), // 제목
              SizedBox(height: 20), // 여백
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClassificationButton(
                    label: '빈티지 버튼',
                    isEnabled: isVintage,
                    onPressed: () {
                      print('빈티지'); // 버튼 클릭 시 '빈티지' 출력
                    },
                  ),
                  ClassificationButton(
                    label: '아메카지 버튼',
                    isEnabled: isAmeKaji,
                    onPressed: () {
                      print('아메카지'); // 버튼 클릭 시 '아메카지' 출력
                    },
                  ),
                  ClassificationButton(
                    label: '캐주얼 버튼',
                    isEnabled: isCasual,
                    onPressed: () {
                      print('캐주얼'); // 버튼 클릭 시 '캐주얼' 출력
                    },
                  ),
                  ClassificationButton(
                    label: '포멀 버튼',
                    isEnabled: isfomor,
                    onPressed: () {
                      print('포멀'); // 버튼 클릭 시 '캐주얼' 출력
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

// 버튼을 위한 별도 클래스
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





