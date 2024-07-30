import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'ReservationPage.dart';

class DesignerDetailScreen extends StatefulWidget {
  final String designerId;
  final String name;
  final String introduction;
  final String classification;
  final String price;
  final String imageUrl;

  DesignerDetailScreen({
    required this.designerId,
    required this.name,
    required this.introduction,
    required this.classification,
    required this.price,
    required this.imageUrl,
  });

  @override
  _DesignerDetailScreenState createState() => _DesignerDetailScreenState();
}

class _DesignerDetailScreenState extends State<DesignerDetailScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0;
  List<Map<String, dynamic>> _reviews = [];
  int _reviewCount = 0;
  double _averageRating = 0;

  @override
  void initState() {
    super.initState();
    _fetchReviews();
  }

  Future<void> _fetchReviews() async {
    QuerySnapshot reviewsSnapshot = await _firestore
        .collection('designer')
        .doc(widget.designerId)
        .collection('reviews')
        .orderBy('timestamp', descending: true)
        .get();

    setState(() {
      _reviews = reviewsSnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      _reviewCount = _reviews.length;
      _averageRating = _reviews.isEmpty
          ? 0
          : _reviews.map((r) => r['rating'] as num).reduce((a, b) => a + b) /
          _reviews.length;
    });
  }

  Future<void> _submitReview() async {
    if (_reviewController.text.isEmpty || _rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('리뷰 내용과 평점을 모두 입력해주세요.')),
      );
      return;
    }

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('리뷰를 작성하려면 로그인이 필요합니다.')),
      );
      return;
    }

    await _firestore
        .collection('designer')
        .doc(widget.designerId)
        .collection('reviews')
        .add({
      'review': _reviewController.text,
      'rating': _rating,
      'userId': user.uid,
      'userName': user.displayName ?? '익명',
      'timestamp': FieldValue.serverTimestamp(),
    });

    await _firestore.collection('designer').doc(widget.designerId).update({
      'reviewCount': FieldValue.increment(1),
    });

    _reviewController.clear();
    setState(() {
      _rating = 0;
    });

    _fetchReviews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(widget.introduction),
                  SizedBox(height: 8),
                  Text('분류: ${widget.classification}'),
                  Text('가격: ${widget.price} 원'),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        '평균 평점: ${_averageRating.toStringAsFixed(1)}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 8),
                      Text('(리뷰 ${_reviewCount}개)'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    '리뷰 작성',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _reviewController,
                    decoration: InputDecoration(
                      hintText: '리뷰를 작성해주세요',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('평점: '),
                      ...List.generate(5, (index) {
                        return IconButton(
                          icon: Icon(
                            index < _rating ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                          ),
                          onPressed: () {
                            setState(() {
                              _rating = index + 1;
                            });
                          },
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _submitReview,
                    child: Text('리뷰 제출'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '리뷰 목록',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _reviews.length,
              itemBuilder: (context, index) {
                final review = _reviews[index];
                return ListTile(
                  title: Text(review['userName']),
                  subtitle: Text(review['review']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text(review['rating'].toString()),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
         bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 48,
          width: double.infinity,  // 버튼이 화면 너비에 맞게 확장되도록 설정합니다.
          child: MaterialButton(
            onPressed: () async {
              // 다음 화면으로 이동 버튼 클릭 시 동작 추가
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReservationPage(),
                ),
              );
            },
            color: Color(0xFF4B0FFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '견적서 예약하기',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1.0,
                letterSpacing: -0.5,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}