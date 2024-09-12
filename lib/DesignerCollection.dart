import 'package:flutter/material.dart';

class DesignerCollection extends StatelessWidget {
  final List<String> classification = ['디자인', '아트', '패션']; // 예시 데이터
  final List<String> _imageUrls = [    'https://example.com/image1.jpg',    'https://example.com/image2.jpg'];    // 더 많은 이미지 URL 추가  ];
  final List<String> _titles = ['디자이너 1', '디자이너 2'];
  final List<String> _names = ['이름 1', '이름 2'];
  final List<double> _reviewCounts = [10, 20];
  final List<int> _prices = [10000, 20000];
  final String _selectedCategory = '전체'; // 예시 선택된 카테고리

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('관심 디자이너'),
      ),
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    List<int> filteredIndices = [];
    for (int i = 0; i < _titles.length; i++) {
      if (_selectedCategory == '전체' || classification[i] == _selectedCategory) {
        filteredIndices.add(i);
      }
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xFFE7E7E7),
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: filteredIndices.length,
        itemBuilder: (context, index) {
          final itemIndex = filteredIndices[index];
          return GestureDetector(
            onTap: () {
              // 아이템 클릭 시 동작
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.zero,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xFFE7E7E7),
                  ),
                ),
              ),
              height: 128,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    margin: EdgeInsets.only(right: 16.0, left: 16.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(_imageUrls[itemIndex]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _titles[itemIndex],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.2,
                            letterSpacing: -0.35,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          _names[itemIndex],
                          style: TextStyle(
                            color: Color(0xFF5D5D5D),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                            letterSpacing: -0.30,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, size: 14, color: Colors.yellow),
                            SizedBox(width: 4),
                            Text(
                              '4.9',
                              style: TextStyle(
                                color: Color(0xFF5D5D5D),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                                letterSpacing: -0.30,
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              '(${_reviewCounts[itemIndex]})',
                              style: TextStyle(
                                color: Color(0xFF5D5D5D),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                                letterSpacing: -0.30,
                              ),
                            ),
                            SizedBox(width: 4),
                            Container(
                              width: 1,
                              height: 12,
                              decoration: BoxDecoration(color: Color(0xFF888888)),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '${classification[itemIndex]}',
                              style: TextStyle(
                                color: Color(0xFF5D5D5D),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                                letterSpacing: -0.30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '${_prices[itemIndex]}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                                height: 1.3,
                                letterSpacing: -0.35,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '원',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                                letterSpacing: -0.35,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
