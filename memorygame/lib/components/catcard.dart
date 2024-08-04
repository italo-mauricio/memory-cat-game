import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class CatCard extends StatelessWidget {
  final int statusCode;

  CatCard({required this.statusCode});

  @override
  Widget build(BuildContext context) {
    String imagePath = '$statusCode.jpg';
    String backImagePath = 'catlogo.png';

    return FlipCard(
      direction: FlipDirection.HORIZONTAL, // ou FlipDirection.VERTICAL
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
