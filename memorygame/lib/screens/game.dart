import 'package:flutter/material.dart';
import 'package:memorygame/components/appBarGame.dart';
import 'package:memorygame/components/cardList.dart';

class CatGame extends StatefulWidget {
  @override
  _CatGameState createState() => _CatGameState();
}

class _CatGameState extends State<CatGame> {
  int _score = 0;

  void _updateScore(int newScore) {
    setState(() {
      _score = newScore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGame(
        title: 'Memory Game',
        score: _score,
      ),
      body: Center(
          child: CardList(
              numCards: 4,
              onScoreChanged: _updateScore
            ) // Exemplo de uso com o código de status 404
          ),
    );
  }
}
