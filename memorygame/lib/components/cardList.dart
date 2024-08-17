import 'catcard.dart';
import 'package:flutter/material.dart';
import 'package:memorygame/models/memorygame.dart';

class CardList extends StatefulWidget {
  final int numCards;

  CardList({required this.numCards}) {
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
  final List<int> _flippedCards = []; // Lista para armazenar os índices das cartas viradas

  @override
  void initState() {
    super.initState();
    _images = _gameManager.generateImageList(widget.numCards); // Gera as imagens uma vez
  }

  void _handleFlip(int index) {
    if (_flippedCards.length < 2 && !_flippedCards.contains(index)) {
      setState(() {
        _flippedCards.add(index);
      });

      final imagePath = _images[index]['image'];
      final label = _images[index]['index'];
      print('Card at index $index flipped with image path $imagePath and label $label');
      print('Flipped cards: $_flippedCards');
    }

    else if (_flippedCards.contains(index)) {
      setState(() {
        _flippedCards.remove(index);
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
          flipEnabled: _flippedCards.length < 2 || _flippedCards.contains(index), // Permite virar apenas duas cartas
        );
      },
    );
  }
}
