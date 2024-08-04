import 'catcard.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CardList extends StatelessWidget {
  final int numCards;
  final List<int> imagePaths = [100, 102, 200, 201, 204, 214, 400, 404];

  CardList({required this.numCards}) {
    if (numCards % 2 != 0) {
      throw Exception('Number of cards must be even.');
    }
  }

  List<int> generateImageList(int numCards) {
    List<int> images = [];
    Random rand = Random();
    while (images.length < numCards) {
      int index = rand.nextInt(imagePaths.length);
      images.add(imagePaths[index]);
      images.add(imagePaths[index]); // Add the pair
    }
    images.shuffle();
    return images;
  }

  @override
  Widget build(BuildContext context) {
    List<int> images = generateImageList(numCards);

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
        );
      },
    );
  }
}
