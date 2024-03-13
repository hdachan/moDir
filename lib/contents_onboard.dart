class OnboardContent {
  String image;
  String text;

  OnboardContent(
      {required this.image, required this.text});
}

List<OnboardContent> contents = [
  OnboardContent(
    image: "assets/image/on1.png",
    text: "쉽고 간단하게\n커뮤니티 정보를 제공",
  ),
  OnboardContent(
    image: "assets/image/on2.png",
    text: "당신을 위해 준비한\n맞춤형 교육 정보",
    ),
  OnboardContent(
    image: "assets/image/on3.png",
    text: "당신의 잠재력을\n모디랑과 함께 깨워 보세요",
    ),
];