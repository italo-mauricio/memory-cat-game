import 'package:flutter/material.dart';
import 'package:memorygame/components/catcard.dart';

class CatGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat API Example'),
      ),
      body: Center(
        child: CatCard(
            statusCode: 200), // Exemplo de uso com o código de status 404
      ),
    );
  }
}
