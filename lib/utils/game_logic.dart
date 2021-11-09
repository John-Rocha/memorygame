class GameLogic {
  final String hiddenCardPath = 'assets/images/hidden.png';
  List<String>? gameImg;

  final List<String> cardsList = [
    "assets/images/circle.png",
    "assets/images/heart.png",
    "assets/images/triangle.png",
    "assets/images/circle.png",
    "assets/images/heart.png",
    "assets/images/star.png",
    "assets/images/star.png",
    "assets/images/triangle.png",
    "assets/images/heart.png",
    "assets/images/circle.png",
    "assets/images/star.png",
    "assets/images/triangle.png",
    "assets/images/circle.png",
    "assets/images/triangle.png",
    "assets/images/heart.png",
    "assets/images/star.png",
  ];

  List<Map<int, String>> matchCheck = [];

  final int cardCount = 16;

  //init the Game
  void initGame() {
    gameImg = List.generate(cardCount, (index) => hiddenCardPath);
  }
}
