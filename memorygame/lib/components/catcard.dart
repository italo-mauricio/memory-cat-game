import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';

class CatCard extends StatelessWidget {
  final int statusCode;
  final int index;
  final Function(int) onFlip;
  final bool flipEnabled;
  final FlipCardController? controller;

  CatCard({
    required this.statusCode,
    required this.index,
    required this.onFlip,
    required this.flipEnabled,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    String imagePath = '$statusCode.jpg';
    String backImagePath = 'back/catlogo.png';

    return FlipCard(
      flipOnTouch: flipEnabled,
      controller: controller,
      direction: FlipDirection.HORIZONTAL, // ou FlipDirection.VERTICAL
      onFlip: () {
        onFlip(index); // Chama o callback passando o índice da carta
      },
      front: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            backImagePath,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ),
      back: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imagePath,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
