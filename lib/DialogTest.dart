import 'package:flutter/material.dart';

class DialogTest extends StatefulWidget {
  const DialogTest({super.key});

  @override
  State<DialogTest> createState() => _DialogTestState();
}

void main() {
  runApp(MaterialApp(
    home: DialogTest(),
  ));
}

class _DialogTestState extends State<DialogTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: 280,
                    height: 150,
                    padding: const EdgeInsets.only(top: 32),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                '이메일 전송',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF3D3D3D),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                '입력하신 이메일로 인증번호를 전송했습니다.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF3D3D3D),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1.0,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: 44,
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                width: 1,
                                color: Color(0xFFE7E7E7),
                              ),
                            )),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: OutlinedButton.styleFrom(
                                minimumSize: Size.zero,
                              ),
                              child: Text('확인',
                                  style: TextStyle(color: Color(0xFF4B0FFF))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Text("Button"),
        ),
      ),
    );
  }
}
