import 'package:flutter/material.dart';
import 'package:memorygame/components/cardList.dart';
import 'package:memorygame/components/myAppBar.dart'; 
// import 'package:memorygame/components/catcard.dart';

class CatGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Memory Cat Game'),
      body: Center(
          child: CardList(
              numCards: 30) // Exemplo de uso com o código de status 404
          ),
    );
  }
}
