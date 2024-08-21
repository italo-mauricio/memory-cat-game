import 'dart:async';
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
  double _timeRemaining = 1.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _numCards = widget.initialNumCards;
    _score = widget.initialScore;

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _timeRemaining -= 0.03;
        if (_timeRemaining <= 0) {
          _timeRemaining = 0;
          timer.cancel();

          Navigator.pushNamed(context, '/score_register', arguments: _score);
         
        }
      });
    });
  }

  void _updateScore(int newScore) {
    setState(() {
      _score = newScore;
    });
  }

  void _onGameFinished() {
    // Se o jogo terminou normalmente, reinicia o jogo
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
  void dispose() {
    _timer.cancel(); // Cancela o temporizador quando o widget é removido
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGame(
        title: 'Memory Game',
        score: _score,
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: _timeRemaining, // O valor da barra de progresso (0 a 1)
            backgroundColor: Colors.grey[300],
            color: Colors.blue,
            minHeight: 8.0,
          ),
          Expanded(
            child: Center(
              child: CardList(
                numCards: _numCards,
                onScoreChanged: _updateScore,
                onGameFinished: _onGameFinished,
                initialScore: _score,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
