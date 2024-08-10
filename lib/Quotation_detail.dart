import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: QuotationPage(),
  ));
}

class QuotationPage extends StatefulWidget {
  @override
  _QuotationPageState createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back), // 뒤로 가기 버튼
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              '견적서 상세보기',
              style: TextStyle(
                color: Color(0xFF3D3D3D),
                fontSize: 18,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 1.4,
                letterSpacing: -0.45,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child:
                    IconButton(onPressed: () {}, icon: Icon(Icons.home_outlined), iconSize: 24),
              )
            ], // 앱바 타이틀
          ),
        ),
      ),
    );
  }
}
