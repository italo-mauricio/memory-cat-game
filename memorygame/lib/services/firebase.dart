import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class ConnetionFirebase {

  Future<void> getModalidade() async {
    try {
      QuerySnapshot querySnapshot = await db.collection('modalidade').get();

      // Itera pelos documentos
      for (var doc in querySnapshot.docs) {
        print('ID: ${doc.id}');
        print('Nome: ${doc['nome']}');
        print('Descrição: ${doc['descricao']}');
      }
    } catch (e) {
      print('Erro ao consultar modalidades: $e');
    }
  }

}