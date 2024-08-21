import 'dart:async';

import 'catcard.dart';
import 'package:flutter/material.dart';
import 'package:memorygame/models/memorygame.dart';
import 'package:flip_card/flip_card_controller.dart';
class CardList extends StatefulWidget {
  final int numCards;
  final void Function(int) onScoreChanged;
  final void Function() onGameFinished;
  final int initialScore; 

  CardList({required this.numCards, required this.onScoreChanged, required this.onGameFinished, required this.initialScore}) {
    if (numCards % 2 != 0) {
      throw Exception('Number of cards must be even.');
    }
  }

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  final MemoryGameManager _gameManager = MemoryGameManager();

  late List<Map<String, dynamic>> _images;
  final List<int> _flippedCards = [];
  final List<int> _matchedCards = []; 
  late List<FlipCardController> _controllers;
  bool _processing = false;
  late int _score;

  @override
  void initState() {
    super.initState();
    _images = _gameManager.generateImageList(widget.numCards); // Gera as imagens uma vez
    _controllers = List.generate(widget.numCards, (_) => FlipCardController());
    _score = widget.initialScore;
  }

  void _handleFlip(int index) {
    if (_processing  || _matchedCards.contains(index)) {
      return;
    }

    if (_flippedCards.length < 2 && !_flippedCards.contains(index)) {
      setState(() {
        _flippedCards.add(index);
      });

    }
    
    if (_flippedCards.length == 2) {
      setState(() {
          _processing = true;
      });

      Future.delayed(const Duration(seconds: 1), () {
        final firstIndex = _flippedCards[0];
        final secondIndex = _flippedCards[1];
        
        if (_images[firstIndex]['index'] != _images[secondIndex]['index']) {
          _controllers[firstIndex].toggleCard();
          _controllers[secondIndex].toggleCard();
          
          _score -= 10;
          widget.onScoreChanged(_score);
        }
        else {
          _score += 100;
          widget.onScoreChanged(_score);
          _matchedCards.add(firstIndex);
          _matchedCards.add(secondIndex);
        }
        
        setState(() {
          _flippedCards.clear();
          _processing = false;

          if (_matchedCards.length == widget.numCards) {
            if (widget.numCards == 16) {
              Navigator.pushNamed(context, '/score_register', arguments: _score);
            }
            else {
              widget.onGameFinished();
            }
          }
        });
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 120, // Define o tamanho máximo de cada card
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        childAspectRatio: 1.0, // Para manter os cards quadrados
      ),
      itemCount: widget.numCards,
      itemBuilder: (context, index) {
        return CatCard(
          statusCode: _images[index]['image'],
          index: index,
          onFlip: _handleFlip,
          flipEnabled: (_flippedCards.length < 2 || _flippedCards.contains(index)) && !_matchedCards.contains(index), 
          controller: _controllers[index],
        );
      },
    );
  }
}
