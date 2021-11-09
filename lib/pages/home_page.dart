// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:memory_game/utils/game_logic.dart';
import 'package:memory_game/widgets/score_board.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Let's start by initite the game
  GameLogic _game = GameLogic();
  int tries = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0XFFe55870),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Jogo da Memória',
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              scoreBoard('Tentativas', "${tries}"),
              scoreBoard('Pontos', "${score}"),
            ],
          ),
          SizedBox(
            height: screenWidth,
            width: screenWidth,
            child: GridView.builder(
              itemCount: _game.gameImg!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              padding: EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //aqui iremos colocar toda a lógica do game
                    setState(() {
                      tries++;
                      _game.gameImg![index] = _game.cardsList[index];
                      _game.matchCheck.add(
                        {
                          index: _game.cardsList[index],
                        },
                      );
                    });
                    if (_game.matchCheck.length == 2) {
                      if (_game.matchCheck[0].values.first ==
                          _game.matchCheck[1].values.first) {
                        score += 100;
                        _game.matchCheck.clear();
                      } else {
                        Future.delayed(Duration(milliseconds: 500), () {
                          setState(() {
                            _game.gameImg![_game.matchCheck[0].keys.first] =
                                _game.hiddenCardPath;
                            _game.gameImg![_game.matchCheck[1].keys.first] =
                                _game.hiddenCardPath;
                            _game.matchCheck.clear();
                          });
                        });
                      }
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFFFB46A),
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(_game.gameImg![index]),
                          fit: BoxFit.cover,
                        )),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
