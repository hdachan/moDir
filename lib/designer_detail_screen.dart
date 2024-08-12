// 마이페이지 화면 위젯
// class MyPageScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           width: 360,
//           height: 48,
//           child: Stack(
//             children: [
//               Positioned(
//                 top: 14,
//                 left: 12,
//                 child: Image.asset(
//                   'assets/image/logo_modi.png', // 실제 로고 이미지
//                   width: 34,
//                   height: 20,
//                 ),
//               ),
//               Positioned(
//                 right: 0,
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Icon(
//                         Icons.search,
//                         size: 24,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Icon(
//                         Icons.notifications,
//                         size: 24,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 48,
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       width: 1,
//                       color: Color(0xFFE7E7E7),
//                     ),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(12),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Container(
//                           width: 24,
//                           height: 24,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage('assets/image/back_icon.png'),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Text(
//                         '설정',
//                         style: TextStyle(
//                           color: Color(0xFF3D3D3D),
//                           fontSize: 18,
//                           fontFamily: 'Pretendard',
//                           fontWeight: FontWeight.w400,
//                           height: 1.0,
//                           letterSpacing: -0.45,
//                         ),
//                       ),
//                       SizedBox(width: 24), // Placeholder to balance the row
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 48,
//                       padding: EdgeInsets.only(top: 16),
//                       decoration: BoxDecoration(
//                         color: Color(0xFFF6F6F6),
//                       ),
//                       child: Text(
//                         '계정',
//                         style: TextStyle(
//                           color: Color(0xFF3D3D3D),
//                           fontSize: 16,
//                           fontFamily: 'Pretendard',
//                           fontWeight: FontWeight.w500,
//                           height: 1.0,
//                           letterSpacing: -0.40,
//                         ),
//                       ),
//                     ),
//                     MaterialButton(
//                       onPressed: () {},
//                       height: 48,
//                       padding: EdgeInsets.zero,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '내 정보 변경',
//                             style: TextStyle(
//                               color: Color(0xFF3D3D3D),
//                               fontSize: 16,
//                               fontFamily: 'Pretendard',
//                               fontWeight: FontWeight.w500,
//                               height: 1.0,
//                               letterSpacing: -0.40,
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/image/next_line_S.png'))),
//                           )
//                         ],
//                       ),
//                     ),
//                     MaterialButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ChangePassword()),
//                         );
//                       },
//                       height: 48,
//                       padding: EdgeInsets.zero,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '비밀번호 변경',
//                             style: TextStyle(
//                               color: Color(0xFF3D3D3D),
//                               fontSize: 16,
//                               fontFamily: 'Pretendard',
//                               fontWeight: FontWeight.w500,
//                               height: 1.0,
//                               letterSpacing: -0.40,
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/image/next_line_S.png'))),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       height: 48,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '알림 푸시 설정',
//                             style: TextStyle(
//                               color: Color(0xFF3D3D3D),
//                               fontSize: 16,
//                               fontFamily: 'Pretendard',
//                               fontWeight: FontWeight.w500,
//                               height: 1.0,
//                               letterSpacing: -0.40,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     MaterialButton(
//                       onPressed: () async {
//                         await FirebaseAuth.instance.signOut();
//                         // 로그아웃 후 이동할 화면
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Login()), // BottomBar로 이동
//                         );
//                       },
//                       height: 48,
//                       padding: EdgeInsets.zero,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '로그아웃',
//                             style: TextStyle(
//                               color: Color(0xFF3D3D3D),
//                               fontSize: 16,
//                               fontFamily: 'Pretendard',
//                               fontWeight: FontWeight.w500,
//                               height: 1.0,
//                               letterSpacing: -0.40,
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage(
//                                     'assets/image/logout_line_S.png'),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       height: 48,
//                       padding: EdgeInsets.only(top: 16),
//                       decoration: BoxDecoration(
//                         color: Color(0xFFF6F6F6),
//                       ),
//                       child: Text(
//                         '고객센터',
//                         style: TextStyle(
//                           color: Color(0xFF3D3D3D),
//                           fontSize: 16,
//                           fontFamily: 'Pretendard',
//                           fontWeight: FontWeight.w500,
//                           height: 1.0,
//                           letterSpacing: -0.40,
//                         ),
//                       ),
//                     ),
//                     MaterialButton(
//                       onPressed: () {},
//                       height: 48,
//                       padding: EdgeInsets.zero,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '1:1 문의',
//                             style: TextStyle(
//                               color: Color(0xFF3D3D3D),
//                               fontSize: 16,
//                               fontFamily: 'Pretendard',
//                               fontWeight: FontWeight.w500,
//                               height: 1.0,
//                               letterSpacing: -0.40,
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/image/next_line_S.png'))),
//                           )
//                         ],
//                       ),
//                     ),
//                     MaterialButton(
//                       onPressed: () {},
//                       height: 48,
//                       padding: EdgeInsets.zero,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'FAQ',
//                             style: TextStyle(
//                               color: Color(0xFF3D3D3D),
//                               fontSize: 16,
//                               fontFamily: 'Pretendard',
//                               fontWeight: FontWeight.w500,
//                               height: 1.0,
//                               letterSpacing: -0.40,
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/image/next_line_S.png'))),
//                           )
//                         ],
//                       ),
//                     ),
//                     MaterialButton(
//                       onPressed: () {},
//                       height: 48,
//                       padding: EdgeInsets.zero,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '약관확인',
//                             style: TextStyle(
//                               color: Color(0xFF3D3D3D),
//                               fontSize: 16,
//                               fontFamily: 'Pretendard',
//                               fontWeight: FontWeight.w500,
//                               height: 1.0,
//                               letterSpacing: -0.40,
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/image/next_line_S.png'))),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(height: 24, color: Color(0xFFF6F6F6)),
//                     Container(
//                       height: 48,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '앱버전',
//                             style: TextStyle(
//                               color: Color(0xFF3D3D3D),
//                               fontSize: 16,
//                               fontFamily: 'Pretendard',
//                               fontWeight: FontWeight.w500,
//                               height: 1.0,
//                               letterSpacing: -0.40,
//                             ),
//                           ),
//                           Container(
//                             width: 24,
//                             height: 24,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/image/next_line_S.png'))),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(height: 24, color: Color(0xFFF6F6F6)),
//                     MaterialButton(
//                       onPressed: () async {
//                         User? user = FirebaseAuth.instance.currentUser;
//
//                         if (user != null) {
//                           try {
//                             await user.delete();
//                             // 회원 탈퇴 후 이동할 화면이 있다면 여기에 추가
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       Login()), // BottomBar로 이동
//                             );
//                             ;
//                           } catch (e) {
//                             // 오류 처리
//                             print('회원 탈퇴 오류: $e');
//                           }
//                         }
//                       },
//                       height: 48,
//                       padding: EdgeInsets.zero,
//                       child: Row(
//                         children: const [
//                           Text(
//                             '회원탈퇴',
//                             style: TextStyle(
//                               color: Color(0xFFED1515),
//                               fontSize: 16,
//                               fontFamily: 'Pretendard',
//                               fontWeight: FontWeight.w500,
//                               height: 1.0,
//                               letterSpacing: -0.40,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'ReservationPage.dart';
//
// class DesignerDetailScreen extends StatefulWidget {
//   final String designerId;
//   final String name;
//   final String introduction;
//   final String classification;
//   final String price;
//   final String imageUrl;
//
//   DesignerDetailScreen({
//     required this.designerId,
//     required this.name,
//     required this.introduction,
//     required this.classification,
//     required this.price,
//     required this.imageUrl,
//   });
//
//   @override
//   _DesignerDetailScreenState createState() => _DesignerDetailScreenState();
// }
//
// class _DesignerDetailScreenState extends State<DesignerDetailScreen> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final TextEditingController _reviewController = TextEditingController();
//   double _rating = 0;
//   List<Map<String, dynamic>> _reviews = [];
//   int _reviewCount = 0;
//   double _averageRating = 0;
//
//   @override // 처음 생성될때 필요한 작업
//   void initState() {
//     super.initState();
//     _fetchReviews();
//   }
//
//   Future<void> _fetchReviews() async {
//     QuerySnapshot reviewsSnapshot = await _firestore
//         .collection('designer')
//         .doc(widget.designerId)
//         .collection('reviews')
//         .orderBy('timestamp', descending: true) // 최신 리뷰부터 가져오기
//         .get();
//
//     // 리뷰 리스트를 초기화하고 비동기 작업을 통해 리뷰를 가져옵니다.
//     List<Map<String, dynamic>> reviewsList = [];
//
//     await Future.wait(reviewsSnapshot.docs.map((doc) async {
//       final data = doc.data() as Map<String, dynamic>;
//       final userId = data['userId'];
//
//       // users 컬렉션에서 nickname 가져오기
//       DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(userId).get();
//       String nickname = userSnapshot.exists ? (userSnapshot.data() as Map<String, dynamic>)['nickname'] ?? '익명' : '익명';
//
//       reviewsList.add({
//         'review': data['review'],
//         'rating': data['rating'],
//         'userId': userId,
//         'userName': nickname, // nickname으로 변경
//         'timestamp': data['timestamp'],
//       });
//     }));
//
//     // setState를 호출하여 UI를 업데이트합니다.
//     setState(() {
//       _reviews = reviewsList; // 리뷰 리스트 업데이트
//       _reviewCount = _reviews.length; // 리뷰 개수 업데이트
//       _averageRating = _reviews.isEmpty
//           ? 0
//           : _reviews.map((r) => r['rating'] as num).reduce((a, b) => a + b) / _reviews.length; // 평균 평점 계산
//     });
//   }
//
//   Future<void> _submitReview() async {
//     if (_reviewController.text.isEmpty || _rating == 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('리뷰 내용과 평점을 모두 입력해주세요.')),
//       );
//       return;
//     }
//
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('리뷰를 작성하려면 로그인이 필요합니다.')),
//       );
//       return;
//     }
//
//     // 기존 리뷰 확인
//     QuerySnapshot existingReviewsSnapshot = await _firestore
//         .collection('designer')
//         .doc(widget.designerId)
//         .collection('reviews')
//         .where('userId', isEqualTo: user.uid)
//         .get();
//
//     if (existingReviewsSnapshot.docs.isNotEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('이미 리뷰를 작성하셨습니다.')),
//       );
//       return;
//     }
//
//     // 리뷰 추가
//     await _firestore
//         .collection('designer')
//         .doc(widget.designerId)
//         .collection('reviews')
//         .add({
//       'review': _reviewController.text,
//       'rating': _rating,
//       'userId': user.uid,
//       'userName': user.displayName ?? user.uid, // 이름이 없을 경우 userId로 대체
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//
//     // 리뷰 개수 업데이트
//     await _firestore.collection('designer').doc(widget.designerId).update({
//       'reviewCount': FieldValue.increment(1),
//     });
//
//     // 입력 필드 초기화 및 UI 업데이트
//     _reviewController.clear();
//     setState(() {
//       _rating = 0;
//     });
//
//     // 리뷰 목록 새로 고침
//     await _fetchReviews();
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.name),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.network(widget.imageUrl),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.name,
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   Text(widget.introduction),
//                   SizedBox(height: 8),
//                   Text('분류: ${widget.classification}'),
//                   Text('가격: ${widget.price} 원'),
//                   SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Text(
//                         '평균 평점: ${_averageRating.toStringAsFixed(1)}',
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       SizedBox(width: 8),
//                       Text('(리뷰 ${_reviewCount}개)'),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     '리뷰 작성',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   TextField(
//                     controller: _reviewController,
//                     decoration: InputDecoration(
//                       hintText: '리뷰를 작성해주세요',
//                       border: OutlineInputBorder(),
//                     ),
//                     maxLines: 3,
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Text('평점: '),
//                       ...List.generate(5, (index) {
//                         return IconButton(
//                           icon: Icon(
//                             index < _rating ? Icons.star : Icons.star_border,
//                             color: Colors.amber,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _rating = index + 1;
//                             });
//                           },
//                         );
//                       }),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   ElevatedButton(
//                     onPressed: _submitReview,
//                     child: Text('리뷰 제출'),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     '리뷰 목록',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: _reviews.length,
//               itemBuilder: (context, index) {
//                 final review = _reviews[index];
//                 return ListTile(
//                   title: Text(review['userName']),
//                   subtitle: Text(review['review']),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(Icons.star, color: Colors.amber),
//                       Text(review['rating'].toString()),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//          bottomNavigationBar: Padding(
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
//     );
//   }
// }