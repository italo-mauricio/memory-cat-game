import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 252, 252, 252), // Cor de fundo personalizada para InitialScreen
      child: Center(
        child: Text(
          'Initial Screen',
          style: TextStyle(fontSize: 24, color: Colors.red),
        ),
      ),
    );
  }
}
