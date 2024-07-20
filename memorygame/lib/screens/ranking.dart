import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  final Color backgroundColor;
  final Color appBarColor;

  RankingScreen({
    this.backgroundColor = const Color(0xFFF2D680),
    this.appBarColor = const Color(0xFFF2D680), 
  });

  final List<RankingItem> rankings = [
    RankingItem(name: 'Alice', score: 1500),
    RankingItem(name: 'Bob', score: 1200),
    RankingItem(name: 'Vivane', score: 1100),
    RankingItem(name: 'Diana', score: 900),
    RankingItem(name: 'Eve', score: 850),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking'),
        backgroundColor: appBarColor, 
      ),
      backgroundColor: backgroundColor,
      body: ListView.builder(
        itemCount: rankings.length,
        itemBuilder: (context, index) {
          final item = rankings[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text((index + 1).toString()),
            ),
            title: Text(item.name),
            trailing: Text(item.score.toString()),
          );
        },
      ),
    );
  }
}

class RankingItem {
  final String name;
  final int score;

  RankingItem({required this.name, required this.score});
}
