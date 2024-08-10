import 'package:flutter/material.dart';
import 'package:memorygame/components/myAppBar.dart';
import 'package:memorygame/services/firebase.dart';

class RankingScreen extends StatelessWidget {
  final Color backgroundColor = const Color(0xFFF2D680);

  Future<List<Map<String, dynamic>>> fetchRankings() async {
    return await connection.getPontuacao();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Ranking',
      ),
      backgroundColor: backgroundColor,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchRankings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text(
              'Erro ao carregar pontuação',
              style: TextStyle(
                fontFamily: 'Cattie',
                fontSize: 18,
                color: Colors.black87,
              ),
            ));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
              'Sem pontuações para exibir',
              style: TextStyle(
                fontFamily: 'Cattie',
                fontSize: 18,
                color: Colors.black87,
              ),
            ));
          } else {
            final rankings = snapshot.data!;
            return ListView.builder(
              itemCount: rankings.length,
              itemBuilder: (context, index) {
                final item = rankings[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      (index + 1).toString(),
                      style: const TextStyle(
                        fontFamily: 'Cattie',
                        fontSize: 30,
                        color: Color.fromARGB(153, 2, 2, 2),
                      ),
                    ),
                  ),
                  title: Text(
                    item['nome_jogador'],
                    style: const TextStyle(
                      fontFamily: 'Cattie',
                      fontSize: 30,
                      color: Color.fromARGB(153, 2, 2, 2),
                    ),
                  ),
                  trailing: Text(
                    item['pontuacao'].toString(),
                    style: const TextStyle(
                      fontFamily: 'Cattie',
                      fontSize: 30,
                      color: Color.fromARGB(153, 2, 2, 2),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
