import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
class ConnetionFirebase {

  Future<void> getModalidade() async {
    try {
      QuerySnapshot querySnapshot = await db.collection('modalidade').get();

      for (var doc in querySnapshot.docs) {
        print('ID: ${doc.id}');
        print('Nome: ${doc['nome']}');
        print('Descrição: ${doc['descricao']}');
      }
    } catch (e) {
      print('Erro ao consultar modalidades: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getPontuacao() async {
    List<Map<String, dynamic>> results = [];

    try {
      QuerySnapshot querySnapshot = await db.collection('jogador_partida').get();

      for (var pontuacao in querySnapshot.docs) {
        String idJogador = pontuacao['id_jogador'];

        DocumentSnapshot jogador = await db.collection('jogador').doc(idJogador).get();

        if (jogador.exists) {
          DocumentSnapshot jogadorDoc = await db.collection('jogador').doc(idJogador).get();
            results.add({
              'pontuacao': pontuacao['pontuacao'],
              'nome_jogador': jogadorDoc['nick'],
            });

        } else {
          print('Jogador não encontrado.');
        }
      }

      results.sort((a, b) => b['pontuacao'].compareTo(a['pontuacao']));
      return results;

    } catch (e) {
      print('Erro ao consultar pontuações e jogadores: $e');
      return [];
    }
  }

}

ConnetionFirebase connection = ConnetionFirebase();