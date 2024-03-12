class OnboardContent {
  String image;
  String text;

  OnboardContent(
      {required this.image, required this.text});
}

List<OnboardContent> contents = [
  OnboardContent(
    image: "assets/image/on1.png",
    text: "쉽고 간단하게\n커뮤니티 정보를 제공합니다.",
  ),
  OnboardContent(
    image: "assets/image/on2.png",
    text: "Pantalla 2",
    ),
  OnboardContent(
    image: "assets/image/on3.png",
    text: "Pantalla 3",
    ),
];