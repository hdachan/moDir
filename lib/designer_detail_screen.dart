import 'package:flutter/material.dart';

class DesignerDetailScreen extends StatelessWidget {
  final String name;
  final String introduction;
  final String classification;
  final String price;
  final String imageUrl;

  DesignerDetailScreen({
    required this.name,
    required this.introduction,
    required this.classification,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
          Image.network(imageUrl),
          Text(introduction),
          Text('분류: $classification'),
          Text('가격: $price 원'),
        ],
      ),
    );
  }
}
