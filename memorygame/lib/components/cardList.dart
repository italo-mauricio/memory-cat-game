import 'catcard.dart';
import 'package:flutter/material.dart';
import 'package:memorygame/models/memorygame.dart';
class CardList extends StatelessWidget {
  final int numCards;
  final MemoryGameManager _gameManager = MemoryGameManager();

  CardList({required this.numCards}) {
    if (numCards % 2 != 0) {
      throw Exception('Number of cards must be even.');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<int> images = _gameManager.generateImageList(numCards);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 120, // Define o tamanho máximo de cada card
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        childAspectRatio: 1.0, // Para manter os cards quadrados
      ),
      itemCount: numCards,
      itemBuilder: (context, index) {
        return CatCard(
          statusCode: images[index],
          index: index,
        );
      },
    );
  }
}
