import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

void main() {
  runApp(MaterialApp(
    home: MyStyleInfo(),
  ));
}

class MyStyleInfo extends StatefulWidget {
  const MyStyleInfo({super.key});

  @override
  State<MyStyleInfo> createState() => _UserSetting();
}

class _UserSetting extends State<MyStyleInfo> {
  final _textController = TextEditingController();

  int? _selectedIndex;
  int? _selectedIndex2;
  int? _selectedIndex3;
  final Set<int> _selectedIndices4 = {};
  int? _selectedIndex5;
  int? _selectedIndex6;
  int? _selectedIndex7;
  int? _selectedIndex8;
  int? _selectedIndex9;
  int? _selectedIndex10;
  int? _selectedIndex11;
  int? _selectedIndex12;


  final TextEditingController _controller = TextEditingController();
  final TextEditingController _kgController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadCmValue();
  }

  void _saveCmValue() async {
    User? user = _auth.currentUser;
    if (user != null) {
      String uid = user.uid;
      String cmValue = _controller.text;
      String kgValue = _kgController.text;
      String genderValue = _selectedIndex == 0 ? '남성' : '여성';
      String birthDateValue = _birthDateController.text;

      String topsizeValue = (_selectedIndex2 != null && _selectedIndex2! >= 0)
      ? ['XS', 'S', 'M', 'L', 'XL', 'XXL', '기타'][_selectedIndex2!]
        : '';

      String bottomsizeValue = (_selectedIndex3 != null && _selectedIndex3! >= 0)
      ? ['XS', 'S', 'M', 'L', 'XL', 'XXL', '기타'][_selectedIndex3!]
        : '';

      String faceValue = (_selectedIndex5 != null && _selectedIndex5! >= 0)
      ? ['웜톤', '뉴트럴톤', '쿨톤', '모르겠어요'][_selectedIndex5!]
        : '';

      String facesizeValue = (_selectedIndex6 != null && _selectedIndex6! >= 0)
      ? ['긴형', '계란형', '둥근형', '하트형','사각형'][_selectedIndex6!]
        : '';

    String shoulderValue = (_selectedIndex7 != null && _selectedIndex7! >= 0)
    ? ['상견', '증견', '하견'][_selectedIndex7!]
        : '';

    String shouldersizeValue = (_selectedIndex8 != null && _selectedIndex8! >= 0)
    ? ['좁다', '보통', '넓다'][_selectedIndex8!]
        : '';

    String chestValue = (_selectedIndex9 != null && _selectedIndex9! >= 0)
    ? ['얇다', '보통', '두껍다'][_selectedIndex9!]
        : '';

    String pelvisValue = (_selectedIndex10 != null && _selectedIndex10! >= 0)
    ? ['좁다', '보통', '넓다'][_selectedIndex10!]
        : '';
    //thigh
    String thighValue = (_selectedIndex11 != null && _selectedIndex11! >= 0)
    ? ['얇다', '보통', '두껍다'][_selectedIndex11!]
        : '';
    //calf
    String calfValue = (_selectedIndex12 != null && _selectedIndex12! >= 0)
    ? ['얇다', '보통', '두껍다'][_selectedIndex12!]
        : '';



    // 선택된 옵션을 배열로 정의
    List<String> options = [
    "상체가 하체에 비해 두꺼운 편이에요",
    "하체가 상체에 비해 두꺼운 편이에요",
    "뼈와 관절이 커요",
    "옷을 입으면 근육이 강조돼요",
    "골격이 전체적으로 얇아요",
    "프레임이 전체적으로 눈에 띄어요",
    "정사이즈 옷은 왠만하면 잘 맞아요"
    ];

    // 선택된 옵션을 가져오기
    List<String> selectedOptions = [];
    for (int i = 0; i < options.length; i++) {
    if (_selectedIndices4.contains(i)) {
    selectedOptions.add(options[i]);
    }
    }

    // 선택된 옵션들을 문자열로 변환
    String selectedOptionsValue = selectedOptions.join(', ');

    await _firestore.collection('users').doc(uid).set({
    'cm': cmValue,
    'kg': kgValue,
    'gender': genderValue,
    'birthDate': birthDateValue,
    'topsize': topsizeValue,
    'bottomsize': bottomsizeValue,
    'selectedOptions': selectedOptionsValue,
    'faceValue': faceValue,
    'facesizeValue':facesizeValue,
    'shoulderValue':shoulderValue,
    'shouldersizeValue':shouldersizeValue,
    'chestValue':chestValue,
    'pelvisValue':pelvisValue,
    'thighValue':thighValue,
    'calfValue':calfValue
    }, SetOptions(merge: true));
    }
  }




  void _loadCmValue() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        setState(() {
          var data = doc.data() as Map<String, dynamic>?; // Map으로 캐스팅

          _controller.text = data?['cm'] ?? '';
          _kgController.text = data?['kg'] ?? '';

          String gender = data?['gender'] ?? '';
          _selectedIndex = (gender == '남성') ? 0 : 1;

          _birthDateController.text = data?['birthDate'] ?? '';

          String topsize = data?['topsize'] ?? '';
          _selectedIndex2 = ['XS', 'S', 'M', 'L', 'XL', 'XXL', '기타'].indexOf(topsize);

          String bottomsize = data?['bottomsize'] ?? '';
          _selectedIndex3 = ['XS', 'S', 'M', 'L', 'XL', 'XXL', '기타'].indexOf(bottomsize);

          String faceValue = data?['faceValue'] ?? '';
          _selectedIndex5 = ['웜톤', '뉴트럴톤', '쿨톤', '모르겠어요'].indexOf(faceValue);

          String facesizeValue = data?['facesizeValue'] ?? '';
          _selectedIndex6 = ['긴형', '계란형', '둥근형', '하트형', '사각형'].indexOf(facesizeValue);

          // shoulderValue 추가
          String shoulderValue = data?['shoulderValue'] ?? '';
          _selectedIndex7 = ['상견', '증견', '하견'].indexOf(shoulderValue);

          // shoulderValue 추가
          String shouldersizeValue = data?['shouldersizeValue'] ?? '';
          _selectedIndex8 = ['좁다', '보통', '벏다'].indexOf(shouldersizeValue);


          String chestValue = data?['chestValue'] ?? '';
          _selectedIndex9 = ['얇다', '보통', '두껍다'].indexOf(chestValue);

          String pelvisValue = data?['pelvisValue'] ?? '';
          _selectedIndex10 = ['좁다', '보통', '넓다'].indexOf(pelvisValue);

          String thighValue = data?['thighValue'] ?? '';
          _selectedIndex11 = ['얇다', '보통', '두껍다'].indexOf(thighValue);

          //calfValue
          String calfValue = data?['calfValue'] ?? '';
          _selectedIndex11 = ['얇다', '보통', '두껍다'].indexOf(calfValue);

          // 선택된 옵션 로드
          String selectedOptions = data?['selectedOptions'] ?? '';
          List<String> options = selectedOptions.split(', ');

          _selectedIndices4.clear(); // 이전 선택 초기화
          for (int i = 0; i < options.length; i++) {
            if (options[i].isNotEmpty) {
              _selectedIndices4.add(i); // 해당 옵션이 선택되었다고 표시
            }
          }
        });
      }
    }
  }
















  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyStyleInfoAppBar(),
      body: SingleChildScrollView(
          child: Center(
        child: SizedBox(
          width: 360,
          child: Column(
            children: [
              Container(
                width: 360,
                height: 410,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '체형',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 1,
                          letterSpacing: -0.45,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '기장과 패턴을 고를 때 중요한 요인이 돼요',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '키',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 1,
                          letterSpacing: -0.45,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: 328,
                      height: 42,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF6F6F6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 274,
                            height: 14,
                            child: TextFormField(
                                controller: _controller,
                                onChanged: (text) {
                                  setState(() {});
                                },
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 1,
                                  letterSpacing: -0.35,
                                ),
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(bottom: 16),
                                  hintText: 'ex) 170',
                                  hintStyle: TextStyle(
                                    color: Color(0xFFB0B0B0),
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 1,
                                    letterSpacing: -0.35,
                                  ),
                                )),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'cm',
                              style: TextStyle(
                                color: Color(0xFF3D3D3D),
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1,
                                letterSpacing: -0.40,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '몸무게',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 1,
                          letterSpacing: -0.45,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: 328,
                      height: 42,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF6F6F6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 274,
                            height: 14,
                            child: TextFormField(
                                controller:_kgController,
                                onChanged: (text) {
                                  setState(() {});
                                },
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 1,
                                  letterSpacing: -0.35,
                                ),
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(bottom: 16),
                                  hintText: 'ex) 70',
                                  hintStyle: TextStyle(
                                    color: Color(0xFFB0B0B0),
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 1,
                                    letterSpacing: -0.35,
                                  ),
                                )),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'kg',
                              style: TextStyle(
                                color: Color(0xFF3D3D3D),
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1,
                                letterSpacing: -0.40,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '성별',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 1,
                          letterSpacing: -0.45,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '성별은 옷의 종류를 추천할 때 주요한 요인이 돼요',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        _buildButton(0, '남성'),
                        SizedBox(width: 8),
                        _buildButton(1, '여성'),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 360,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '의류 사이즈',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 1,
                          letterSpacing: -0.45,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '의류 사이즈는 고객님의 정사이즈를 기준으로 선택해주세요',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '상의',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1,
                              letterSpacing: -0.40,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.help_outline),
                          iconSize: 18,
                          color: Color(0xFF5D5D5D),
                          style:
                              OutlinedButton.styleFrom(minimumSize: Size.zero),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        _buildButton2(0, 'XS'),
                        SizedBox(width: 8),
                        _buildButton2(1, 'S'),
                        SizedBox(width: 8),
                        _buildButton2(2, 'M'),
                        SizedBox(width: 8),
                        _buildButton2(3, 'L'),
                        SizedBox(width: 8),
                        _buildButton2(4, 'XL'),
                        SizedBox(width: 8),
                        _buildButton2(5, 'XXL'),
                        SizedBox(width: 8),
                        _buildButton2(6, '기타'),
                      ],
                    ),
                    //'기타'칸 입력 추가
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '하의',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1,
                              letterSpacing: -0.40,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.help_outline),
                          iconSize: 18,
                          color: Color(0xFF5D5D5D),
                          style:
                              OutlinedButton.styleFrom(minimumSize: Size.zero),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        _buildButton3(0, 'XS'),
                        SizedBox(width: 8),
                        _buildButton3(1, 'S'),
                        SizedBox(width: 8),
                        _buildButton3(2, 'M'),
                        SizedBox(width: 8),
                        _buildButton3(3, 'L'),
                        SizedBox(width: 8),
                        _buildButton3(4, 'XL'),
                        SizedBox(width: 8),
                        _buildButton3(5, 'XXL'),
                        SizedBox(width: 8),
                        _buildButton3(6, '기타'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 360,
                height: 148,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '생년월일',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '무드에 맞는 옷을 고를 때 나이는 중요한 고려사항이예요',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: 328,
                      height: 42,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF6F6F6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: SizedBox(
                        width: 274,
                        height: 14,
                        child: TextFormField(
                            controller: _birthDateController,
                            onChanged: (text) {
                              setState(() {});
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 1,
                              letterSpacing: -0.35,
                            ),
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(bottom: 16),
                                hintText: 'ex) 20000816',
                                hintStyle: TextStyle(
                                  color: Color(0xFFB0B0B0),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                  letterSpacing: -0.35,
                                ),
                                suffixIcon: _textController.text.isNotEmpty
                                    ? IconButton(
                                        onPressed: () {
                                          _textController.clear();
                                          setState(() {});
                                        },
                                        padding: EdgeInsets.only(
                                            bottom: 10, left: 60),
                                        icon: Icon(Icons.cancel,
                                            color: Color(0xFF888888)))
                                    : null)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 360,
                height: 410,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '상세정보',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '키와 몸무게가 같아도 사람마다 체형이 조금씩 달라요',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '체구',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '본인에게 해당되는 문항을 모두 선택해주세요',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildButton4(0, '상체가 하체에 비해 두꺼운 편이에요'),
                        SizedBox(height: 8),
                        _buildButton4(1, '하체가 상체에 비해 두꺼운 편이에요'),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            _buildButton4(2, '뼈와 관절이 커요'),
                            SizedBox(height: 8),
                            _buildButton4(3, '옷을 입으면 근육이 강조돼요'),
                            SizedBox(height: 8),
                          ],
                        ),
                        SizedBox(height: 8),
                        _buildButton4(4, '골격이 전체적으로 얇아요'),
                        SizedBox(height: 8),
                        _buildButton4(5, '프레임이 전체적으로 눈에 띄어요'),
                        SizedBox(height: 8),
                        _buildButton4(6, '정사이즈 옷은 왠만하면 잘 맞아요'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 360,
                height: 112,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '피부톤',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        _buildButton5(0, '웜톤'),
                        SizedBox(width: 8),
                        _buildButton5(1, '뉴트럴톤'),
                        SizedBox(width: 8),
                        _buildButton5(2, '쿨톤'),
                        SizedBox(width: 8),
                        _buildButton5(3, '모르겠어요'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 360,
                height: 112,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '얼굴형',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        _buildButton6(0, '긴형'),
                        SizedBox(width: 8),
                        _buildButton6(1, '계란형'),
                        SizedBox(width: 8),
                        _buildButton6(2, '둥근형'),
                        SizedBox(width: 8),
                        _buildButton6(3, '하트형'),
                        SizedBox(width: 8),
                        _buildButton6(4, '사각형'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 360,
                height: 112,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '어깨 모양',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        _buildButton7(0, '상견'),
                        SizedBox(width: 8),
                        _buildButton7(1, '중견'),
                        SizedBox(width: 8),
                        _buildButton7(2, '하견'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 360,
                height: 112,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '어깨 넓이',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        _buildButton8(0, '좁다'),
                        SizedBox(width: 8),
                        _buildButton8(1, '보통'),
                        SizedBox(width: 8),
                        _buildButton8(2, '넓다'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 360,
                height: 112,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '흉부',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        _buildButton9(0, '얇다'),
                        SizedBox(width: 8),
                        _buildButton9(1, '보통'),
                        SizedBox(width: 8),
                        _buildButton9(2, '두껍다'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 360,
                height: 112,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '골반',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        _buildButton10(0, '좁다'),
                        SizedBox(width: 8),
                        _buildButton10(1, '보통'),
                        SizedBox(width: 8),
                        _buildButton10(2, '넓다'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 360,
                height: 112,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '허벅지',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        _buildButton11(0, '얇다'),
                        SizedBox(width: 8),
                        _buildButton11(1, '보통'),
                        SizedBox(width: 8),
                        _buildButton11(2, '두껍다'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 360,
                height: 112,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '종아리',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        _buildButton12(0, '얇다'),
                        SizedBox(width: 8),
                        _buildButton12(1, '보통'),
                        SizedBox(width: 8),
                        _buildButton12(2, '두껍다'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 360,
                height: 52,
                child: MaterialButton(
                  onPressed:_saveCmValue,
                  color: Color(0xFF5D5D5D),
                  child: Text(
                    '저장하기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      height: 1,
                      letterSpacing: -0.40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  //성별
  Widget _buildButton(int index, String text) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print('$text 버튼 클릭됨!');
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 11),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3D3D3D) : Colors.transparent,
          border: isSelected
              ? Border.all(width: 1, color: Color(0xFF3D3D3D)) // 다른 코드에 이거 추가 해야지 눌렀을 때 크기 차이 안남 + border 때문에 padding 1씩 줄여야 함
              : Border.all(width: 1, color: Color(0xFFE7E7E7)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.1,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ),
    );
  }

  //상의
  Widget _buildButton2(int index2, String text) {
    bool isSelected = _selectedIndex2 == index2;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex2 = index2;
        });
        print('$text 버튼 클릭됨!');
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 11),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3D3D3D) : Colors.transparent,
          border: isSelected
              ? Border.all(width: 1, color: Color(0xFF3D3D3D))
              : Border.all(width: 1, color: Color(0xFFE7E7E7)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.1,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ),
    );
  }

  //하의
  Widget _buildButton3(int index3, String text) {
    bool isSelected = _selectedIndex3 == index3;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex3 = index3;
        });
        print('$text 버튼 클릭됨!');
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 11),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3D3D3D) : Colors.transparent,
          border: isSelected
              ? Border.all(width: 1, color: Color(0xFF3D3D3D))
              : Border.all(width: 1, color: Color(0xFFE7E7E7)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.1,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ),
    );
  }

  //체구
  Widget _buildButton4(int index4, String text) {
    bool isSelected = _selectedIndices4.contains(index4);
    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedIndices4.remove(index4);
            print('$text 버튼 취소');
          } else {
            _selectedIndices4.add(index4);
            print('$text 버튼 선택');
          }
        });
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 11),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF3D3D3D) : Colors.transparent,
            border: isSelected
                ? Border.all(width: 1, color: Color(0xFF3D3D3D))
                : Border.all(width: 1, color: Color(0xFFE7E7E7)),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 1.1,
                letterSpacing: -0.35,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //피부톤
  Widget _buildButton5(int index5, String text) {
    bool isSelected = _selectedIndex5 == index5;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex5 = index5;
        });
        print('$text 버튼 클릭됨!');
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 11),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3D3D3D) : Colors.transparent,
          border: isSelected
              ? Border.all(width: 1, color: Color(0xFF3D3D3D))
              : Border.all(width: 1, color: Color(0xFFE7E7E7)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.1,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ),
    );
  }

  //얼굴형
  Widget _buildButton6(int index6, String text) {
    bool isSelected = _selectedIndex6 == index6;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex6 = index6;
        });
        print('$text 버튼 클릭됨!');
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 11),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3D3D3D) : Colors.transparent,
          border: isSelected
              ? Border.all(width: 1, color: Color(0xFF3D3D3D))
              : Border.all(width: 1, color: Color(0xFFE7E7E7)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.1,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ),
    );
  }

  //어깨 모양
  Widget _buildButton7(int index7, String text) {
    bool isSelected = _selectedIndex7 == index7;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex7 = index7;
        });
        print('$text 버튼 클릭됨!');
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 11),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3D3D3D) : Colors.transparent,
          border: isSelected
              ? Border.all(width: 1, color: Color(0xFF3D3D3D))
              : Border.all(width: 1, color: Color(0xFFE7E7E7)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.1,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ),
    );
  }

  //어깨 넓이
  Widget _buildButton8(int index8, String text) {
    bool isSelected = _selectedIndex8 == index8;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex8 = index8;
        });
        print('$text 버튼 클릭됨!');
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 11),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3D3D3D) : Colors.transparent,
          border: isSelected
              ? Border.all(width: 1, color: Color(0xFF3D3D3D))
              : Border.all(width: 1, color: Color(0xFFE7E7E7)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.1,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ),
    );
  }

  //흉부
  Widget _buildButton9(int index9, String text) {
    bool isSelected = _selectedIndex9 == index9;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex9 = index9;
        });
        print('$text 버튼 클릭됨!');
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 11),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3D3D3D) : Colors.transparent,
          border: isSelected
              ? Border.all(width: 1, color: Color(0xFF3D3D3D))
              : Border.all(width: 1, color: Color(0xFFE7E7E7)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.1,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ),
    );
  }

  //골반
  Widget _buildButton10(int index10, String text) {
    bool isSelected = _selectedIndex10 == index10;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex10 = index10;
        });
        print('$text 버튼 클릭됨!');
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 11),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3D3D3D) : Colors.transparent,
          border: isSelected
              ? Border.all(width: 1, color: Color(0xFF3D3D3D))
              : Border.all(width: 1, color: Color(0xFFE7E7E7)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.1,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ),
    );
  }

  //허벅지
  Widget _buildButton11(int index11, String text) {
    bool isSelected = _selectedIndex11 == index11;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex11 = index11;
        });
        print('$text 버튼 클릭됨!');
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 11),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3D3D3D) : Colors.transparent,
          border: isSelected
              ? Border.all(width: 1, color: Color(0xFF3D3D3D))
              : Border.all(width: 1, color: Color(0xFFE7E7E7)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.1,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ),
    );
  }

  //종아리
  Widget _buildButton12(int index12, String text) {
    bool isSelected = _selectedIndex12 == index12;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex12 = index12;
        });
        print('$text 버튼 클릭됨!');
      },
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 11),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3D3D3D) : Colors.transparent,
          border: isSelected
              ? Border.all(width: 1, color: Color(0xFF3D3D3D))
              : Border.all(width: 1, color: Color(0xFFE7E7E7)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.1,
              letterSpacing: -0.35,
            ),
          ),
        ),
      ),
    );
  }
}

//앱 바
class MyStyleInfoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyStyleInfoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.only(left: 8),
          width: 360,
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()), // Test3 화면으로 이동
                  );
                },
                icon: Icon(Icons.arrow_back),
                iconSize: 24,
                color: Colors.black,
                style: OutlinedButton.styleFrom(minimumSize: Size.zero),
              ),
              SizedBox(width: 8),
              SizedBox(
                  width: 256,
                  height: 56,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '나의 스타일 정보',
                      style: TextStyle(
                        color: Color(0xFF3D3D3D),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 1.4,
                        letterSpacing: -0.45,
                      ),
                    ),
                  )),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh),
                iconSize: 24,
                color: Colors.black,
                style: OutlinedButton.styleFrom(minimumSize: Size.zero),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(360, kToolbarHeight);
}
