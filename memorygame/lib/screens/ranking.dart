import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  final Color backgroundColor;
  final Color appBarColor;
  final List<Map<String, dynamic>> rankings;


  RankingScreen({
    this.backgroundColor = const Color(0xFFF2D680),
    this.appBarColor = const Color(0xFFF2D680), 
    required this.rankings,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Ranking',
          style: TextStyle(
              fontFamily: 'Cattie',
              fontSize: 50,
              color: Color.fromARGB(153, 2, 2, 2),
            ),),
        ),
        backgroundColor: appBarColor, 
      ),
      backgroundColor: backgroundColor,
      body: ListView.builder(
        itemCount: rankings.length,
        itemBuilder: (context, index) {
          final item = rankings[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text((index + 1).toString(), 
              style: const TextStyle(
                  fontFamily: 'Cattie',
                  fontSize: 30,
                  color: Color.fromARGB(153, 2, 2, 2),
                ),),
            ),
            title: Text(item['nome_jogador'], 
            style: const TextStyle(
                fontFamily: 'Cattie',
                fontSize: 30,
                color: Color.fromARGB(153, 2, 2, 2),
              ),),
            trailing: Text(item['pontuacao'].toString(),
              style: const TextStyle(
                  fontFamily: 'Cattie',
                  fontSize: 30,
                  color: Color.fromARGB(153, 2, 2, 2),
                ),
              ),
          );
        },
      ),
    );
  }
}