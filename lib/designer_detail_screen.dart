import 'package:flutter/material.dart';
import 'ReservationPage.dart';
import 'bottom_bar.dart';

// class DesignerDetailScreen extends StatelessWidget {
//   final Designer designer;
//
//   DesignerDetailScreen({required this.designer});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${designer.name} 상세 정보'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView( // 스크롤 가능하도록 변경
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10.0),
//                 child: designer.imageUrl.isNotEmpty
//                     ? Image.network(
//                   designer.imageUrl,
//                   width: double.infinity,
//                   height: 200,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Image.asset(
//                       'assets/image/m_logo.png',
//                       width: double.infinity,
//                       height: 200,
//                       fit: BoxFit.cover,
//                     );
//                   },
//                 )
//                     : Image.asset(
//                   'assets/image/m_logo.png',
//                   width: double.infinity,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Text(
//                 designer.name,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 24,
//                   fontFamily: 'Pretendard',
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 8.0),
//               Row(
//                 children: [
//                   Icon(Icons.star, color: Colors.yellow, size: 20.0),
//                   SizedBox(width: 4.0),
//                   Text(
//                     '평점: ${designer.rating}',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontFamily: 'Pretendard',
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8.0),
//               Text(
//                 '분야: ${designer.specialty}',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontFamily: 'Pretendard',
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               SizedBox(height: 8.0),
//               Text(
//                 '가격: \$${designer.price}',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontFamily: 'Pretendard',
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Text(
//                 '소개',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontFamily: 'Pretendard',
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 8.0),
//               Text(
//                 designer.description,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontFamily: 'Pretendard',
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           height: 48,
//           width: double.infinity,  // 버튼이 화면 너비에 맞게 확장되도록 설정합니다.
//           child: MaterialButton(
//             onPressed: () async {
//               // 다음 화면으로 이동 버튼 클릭 시 동작 추가
//               await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ReservationPage(),
//                 ),
//               );
//             },
//             color: Color(0xFF4B0FFF),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Text(
//               '견적서 예약하기',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'Pretendard',
//                 fontWeight: FontWeight.w700,
//                 height: 1.0,
//                 letterSpacing: -0.5,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//         ),
//       ),
//
//
//     );
//   }
// }
