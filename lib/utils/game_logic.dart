class GameLogic {
  final String hiddenCardPath = 'assets/images/hidden.png';
  List<String>? gameImg;

  final int cardCount = 8;

  //init the Game
  void initGame() {
    gameImg = List.generate(cardCount, (index) => hiddenCardPath);
  }
}
