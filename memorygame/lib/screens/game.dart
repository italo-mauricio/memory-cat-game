import 'package:flutter/material.dart';
import 'package:memorygame/components/appBarGame.dart';
import 'package:memorygame/components/cardList.dart';

class CatGame extends StatefulWidget {
  final int initialNumCards;
  final int initialScore;

  CatGame({required this.initialNumCards, required this.initialScore});

  @override
  _CatGameState createState() => _CatGameState();
}

class _CatGameState extends State<CatGame> {
  int _score = 0;
  late int _numCards;

  @override
  void initState() {
    super.initState();
    _numCards = widget.initialNumCards;
    _score = widget.initialScore;
  }

  void _updateScore(int newScore) {
    setState(() {
      _score = newScore;
    });
  }

  void _onGameFinished() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CatGame(
          initialNumCards: _numCards + 4,
          initialScore: _score,
        ),
      ),
    );
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
          numCards: _numCards,
          onScoreChanged: _updateScore,
          onGameFinished: _onGameFinished,
          initialScore: _score,
      )),
    );
  }
}
