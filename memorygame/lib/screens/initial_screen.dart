import 'package:flutter/material.dart';
import 'package:memorygame/screens/ranking.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 252, 252), // Cor de fundo personalizada para InitialScreen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RankingScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60), 
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), 
                textStyle: TextStyle(fontSize: 18), 
              ),
              child: const Text('Pontuações'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RankingScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 60), 
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: const Text('Jogar'),
            ),
          ],
        ),
      ),
    );
  }
}
