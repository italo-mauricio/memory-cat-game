import 'package:flutter/material.dart';
import 'package:memorygame/components/cardList.dart';
// import 'package:memorygame/components/catcard.dart';

class CatGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Memory Cat Game',
          style: TextStyle(
            fontFamily: 'Cattie',
            fontSize: 50,
            color: Color.fromARGB(153, 2, 2, 2), // Define a cor da letra aqui
          ),
        ),
        backgroundColor: Color(0xFFF2D680),
        centerTitle: true,
      ),
      body: Center(
          child: CardList(
              numCards: 30) // Exemplo de uso com o código de status 404
          ),
    );
  }
}
