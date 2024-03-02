import 'package:flutter/material.dart';

import 'main6.dart';

// 약관동의 화면
void main() {
  runApp(MaterialApp(
    home: Main5(),
  ));
}

class Main5 extends StatefulWidget {
  @override
  _Main5State createState() => _Main5State();
}

class _Main5State extends State<Main5> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isAllChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('서비스 이용 약관 동의'),
      ),
      body: Column(
        children: <Widget>[
          Text('서비스 이용 약관'),
          InkWell(
            onTap: () {
              // 약관 내용 페이지로 이동
            },
            child: Text(
              '전체 약관 보기',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          CheckboxListTile(
            title: Text('전체 동의하기'),
            value: _isAllChecked,
            onChanged: (bool? value) {
              setState(() {
                _isAllChecked = value ?? false;
                _isChecked1 = _isAllChecked;
                _isChecked2 = _isAllChecked;
                _isChecked3 = _isAllChecked;
              });
            },
          ),
          CheckboxListTile(
            title: Text('약관1에 동의합니다.'),
            value: _isChecked1,
            onChanged: (bool? value) {
              setState(() {
                _isChecked1 = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text('약관2에 동의합니다.'),
            value: _isChecked2,
            onChanged: (bool? value) {
              setState(() {
                _isChecked2 = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: Text('약관3에 동의합니다.'),
            value: _isChecked3,
            onChanged: (bool? value) {
              setState(() {
                _isChecked3 = value ?? false;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_isChecked1 && _isChecked2 && _isChecked3) {
                // 약관 모두에 동의하였을 때 처리
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Main6()),
                );
              } else {
                // 약관 모두에 동의하지 않았을 때 처리
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text("알림"),
                      content: new Text("모든 약관에 동의해주세요."),
                      actions: <Widget>[
                        new TextButton(
                          child: new Text("닫기"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: Text('확인'),
          ),
        ],
      ),
    );
  }
}
