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

  @override
  void initState() {
    super.initState();
    _images = _gameManager.generateImageList(widget.numCards); // Gera as imagens uma vez
  }

  void _handleFlip(int index) {
    final imagePath = _images[index]['image'];
    final label = _images[index]['index'];
    print('Card at index $index flipped with image path $imagePath and label $label');
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
          
        );
      },
    );
  }
}
