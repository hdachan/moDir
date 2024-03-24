import 'package:flutter/material.dart';

void main() async {
  runApp(AgreePage());
}

class AgreePage extends StatefulWidget {
  const AgreePage({Key? key}) : super(key: key);

  @override
  _AgreePageState createState() => _AgreePageState();
}

class _AgreePageState extends State<AgreePage> {
  bool _isAgreed = false; // 사용자의 동의 상태를 관리하는 변수
  bool _isTermsAgreed = false; // 이용 약관 동의 상태를 추적하는 변수
  bool _isPrivacyAgreed = false; // 이용 약관 동의 상태 추적 변수 2
  bool _isPrivacyAgreed2 = false; // 이용 약관 동의 상태 추적 변수 3
  bool _isPrivacyAgreed3 = false; // 이용 약관 동의 상태 추적 변수 4
  bool isButtonPressed = false;

  // 동의 처리 메서드 (예시)
  void _toggleAgreement() {
    setState(() {
      _isAgreed = !_isAgreed; // 전체 동의 상태를 토글
      // 전체 동의 상태에 따라 개별 동의 변수들과 버튼 활성화 상태를 설정
      if (_isAgreed) {
        _isTermsAgreed = true;
        _isPrivacyAgreed = true;
        _isPrivacyAgreed2 = true;
        _isPrivacyAgreed3 = true;
        isButtonPressed = true; // 전체 동의 시 버튼 활성화
      } else {
        _isTermsAgreed = false;
        _isPrivacyAgreed = false;
        _isPrivacyAgreed2 = false;
        _isPrivacyAgreed3 = false;
        isButtonPressed = false; // 전체 동의가 아니면 버튼 비활성화
      }
    });
  }

  void _StatetoggleAgreement() {
    setState(() {
      bool allAgreed = _isTermsAgreed&& _isPrivacyAgreed && _isPrivacyAgreed2;

      if (allAgreed) {
        // 모든 조건이 참일 때
        isButtonPressed = true;
      } else {
        // 이외의 경우에는 isButtonPressed를 false로 설정합니다.
        isButtonPressed = false;
      }
    });
  }

  void  _toggleTermsAgreement() {
    setState(() {
      _isTermsAgreed = !_isTermsAgreed;
      _StatetoggleAgreement();
    });
  }

  void  _toggleTermsAgreement1() {
    setState(() {
      _isPrivacyAgreed = !_isPrivacyAgreed;
      _StatetoggleAgreement();
    });
  }

  void  _toggleTermsAgreement2() {
    setState(() {
      _isPrivacyAgreed2 = !_isPrivacyAgreed2;
      _StatetoggleAgreement();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                // 앱 바 - 완
                width: double.infinity,
                height: 54,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    width: 1,
                    color: Color(0xFFE7E7E7),
                  )),
                ),
                child: Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15, left: 24),
                    child: Row(
                      children: [
                        Container(
                          // 뒤로가기 버튼 - 완
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/image/back_icon.png'))),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    )),
              ),
              Center(
                child: Container(
                  // 중간 패널
                  width: 428,
                  height: 586,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 48, bottom: 124, right: 24, left: 24),
                    child: Container(
                      height: 114,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // 제목 - 완
                            '모디랑\n이용약관 동의',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 28,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                              letterSpacing: -0.7,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            // 설명 - 완
                            '모디랑 서비스 시작 및 가입을 위해\n정보 제공에 동의해 주세요!',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                              letterSpacing: -0.35,
                            ),
                          ),
                          SizedBox(height: 48),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _toggleAgreement();
                              });
                            },
                            child: Container(
                              width: 428,
                              height: 48,
                              decoration: BoxDecoration(
                                color: _isAgreed
                                    ? Color(0xFF4B0FFF)
                                    : Colors.transparent, // 여기에서 배경색을 변경합니다.
                                border: Border.all(
                                  width: 1.5,
                                  color: _isAgreed
                                      ? Color(0xFF4B0FFF)
                                      : Color(
                                          0xFF8773FF), // 조건에 따라 테두리 색상을 변경합니다.
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            _isAgreed
                                                ? 'assets/image/checkOn_icon.png'
                                                : 'assets/image/check_icon.png', // 조건에 따라 이미지를 변경합니다.
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '전체 약관동의',
                                      style: TextStyle(
                                        color: _isAgreed
                                            ? Colors.white
                                            : Color(0xFF888888),
                                        // 조건에 따라 텍스트 색상을 변경합니다.
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 12),

                          Row(
                            // 동의 1번 부분 - 아이콘, 텍스트 메서드로 변경 / 버튼 기능 추가
                            children: [
                              Expanded(
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _toggleTermsAgreement();
                                          //_isTermsAgreed =!_isTermsAgreed; // 탭할 때마다 _isTermsAgreed 값 토글
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 12),
                                        height: 48,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 28,
                                              height: 28,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    _isTermsAgreed
                                                        ? 'assets/image/Onbluecheck_icon.png' // 조건에 따라 이미지 변경
                                                        : 'assets/image/check_icon.png',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 3),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '(필수) 이용 약관 동의',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: _isTermsAgreed
                                                          ? Color(0xFF3D3D3D)
                                                          : Color(0xFF888888),
                                                      // 조건에 따라 텍스트 색상 변경
                                                      fontSize: 14,
                                                      fontFamily: 'Pretendard',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.3,
                                                      letterSpacing: -0.35,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ))),
                              Container(
                                // 약관 더보기 부분 - 메서드 / 버튼 기능 추가
                                width: 31,
                                height: 28,
                                margin: EdgeInsets.only(right: 12),
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  '더보기',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFB0B0B0),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFB0B0B0),
                                    height: 1.3,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),

//-------------------------------------------여기서 부터는 같은 코드 3개 + 다음 버튼--------------------------------------------------------------
//                                            동의 2번 부분에 적어 놓겠음.(메서드)
//           온보딩 처럼 콘텐츠 만들고 불러 오는 식으로 하면 좋을 듯 함 생각하니까 메서드는 아래꺼 그대로 만들고 콘텐츠에서 텍스트만 불러오면 될 듯?
//                                                       필요하면 부르셈

                          Row(
                            // 동의 2번 부분 - 아이콘, 텍스트 메서드로 변경 / 버튼 기능 추가
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    _StatetoggleAgreement();
                                    setState(() {
                                      _toggleTermsAgreement1();
                                      //_isPrivacyAgreed = !_isPrivacyAgreed; // 탭할 때마다 _isPrivacyAgreed 값 토글
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 12),
                                    height: 48,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 28,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                _isPrivacyAgreed
                                                    ? 'assets/image/Onbluecheck_icon.png' // 조건에 따라 이미지 변경
                                                    : 'assets/image/check_icon.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 3),
                                          child: Row(
                                            children: [
                                              Text(
                                                '(필수) 개인정보 수집 동의',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _isPrivacyAgreed
                                                      ? Color(0xFF3D3D3D)
                                                      : Color(0xFF888888),
                                                  // 조건에 따라 텍스트 색상 변경
                                                  fontSize: 14,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.3,
                                                  letterSpacing: -0.35,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // 약관 더보기 부분 - 메서드 / 버튼 기능 추가
                                width: 31,
                                height: 28,
                                margin: EdgeInsets.only(right: 12),
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  '더보기',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFB0B0B0),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFB0B0B0),
                                    height: 1.3,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            // 동의 3번 부분 - 아이콘, 텍스트 메서드로 변경 / 버튼 기능 추가
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _toggleTermsAgreement2();
                                      //_isPrivacyAgreed2 = !_isPrivacyAgreed2; // 탭할 때마다 _isPrivacyAgreed 값 토글
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 12),
                                    height: 48,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 28,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                _isPrivacyAgreed2
                                                    ? 'assets/image/Onbluecheck_icon.png' // 조건에 따라 이미지 변경
                                                    : 'assets/image/check_icon.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 3),
                                          child: Row(
                                            children: [
                                              Text(
                                                '(필수) 전금 금융 거래 이용 약관 동의',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _isPrivacyAgreed2
                                                      ? Color(0xFF3D3D3D)
                                                      : Color(0xFF888888),
                                                  // 조건에 따라 텍스트 색상 변경
                                                  fontSize: 14,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.3,
                                                  letterSpacing: -0.35,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // 약관 더보기 부분 - 메서드 / 버튼 기능 추가
                                width: 31,
                                height: 28,
                                margin: EdgeInsets.only(right: 12),
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  '더보기',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFB0B0B0),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFB0B0B0),
                                    height: 1.3,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            // 동의 4번 부분 - 아이콘, 텍스트 메서드로 변경 / 버튼 기능 추가
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _isPrivacyAgreed3 =
                                          !_isPrivacyAgreed3; // 탭할 때마다 _isPrivacyAgreed 값 토글
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 12),
                                    height: 48,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 28,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                _isPrivacyAgreed3
                                                    ? 'assets/image/Onbluecheck_icon.png' // 조건에 따라 이미지 변경
                                                    : 'assets/image/check_icon.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 3),
                                          child: Row(
                                            children: [
                                              Text(
                                                '(선택) 이벤트 및 마케팅 이용 약관 동의',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: _isPrivacyAgreed3
                                                      ? Color(0xFF3D3D3D)
                                                      : Color(0xFF888888),
                                                  // 조건에 따라 텍스트 색상 변경
                                                  fontSize: 14,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.3,
                                                  letterSpacing: -0.35,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // 약관 더보기 부분 - 메서드 / 버튼 기능 추가
                                width: 31,
                                height: 28,
                                margin: EdgeInsets.only(right: 12),
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  '더보기',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFB0B0B0),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFFB0B0B0),
                                    height: 1.3,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 48),
                child: SizedBox(
                  height: 52,
                  width: 428,
                  child: MaterialButton(
                    onPressed: () {
                      // 버튼이 눌렸을 때 수행할 작업을 여기에 구현
                      // 예를 들어, 모든 동의 상태가 true일 때만 다음 화면으로 넘어가는 로직 등
                      if (isButtonPressed) {
                        // 다음 화면으로 넘어가는 로직
                      }
                    },
                    color: isButtonPressed
                        ? Color(0xFF4B0FFF)
                        : Color(0xFFAFA6FF), // 버튼의 상태에 따라 색상 변경
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '다음',
                      style: TextStyle(
                        color: Color(0xFFF6F6F6),
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                        letterSpacing: -0.53,
                        fontSize: 21,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
