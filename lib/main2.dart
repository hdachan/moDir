import 'package:flutter/material.dart';
import 'main3.dart'; // Import your third page here

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('모디랑 채널')),
      body: Container(
        width: 360,
        height: 790,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            // 기존에 제공해주신 위젯들은 여기 포함됩니다.
          ],
        ),
      ),
    );
  }
}