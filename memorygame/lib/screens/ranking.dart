import 'package:flutter/material.dart';
import 'package:memorygame/components/myAppBar.dart';
class RankingScreen extends StatelessWidget {
  final Color backgroundColor;
  final List<Map<String, dynamic>> rankings;

  RankingScreen({
    this.backgroundColor = const Color(0xFFF2D680),
    required this.rankings,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Ranking',
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