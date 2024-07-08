import 'package:http/http.dart' as http;

class CatApi {
  var client = http.Client();
  var url = 'https://http.cat/';

  Future<void> search(int statusCode) async {
    try {
      var imageUrl = '$url$statusCode.jpg';
      var response = await client.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        // Sucesso na conexão
        print('sucesso! URL da imagem: $imageUrl');
      } else {
        // Falha na conexão
        print('Falha na conexão: ${response.statusCode}');
      }
    } catch (e) {
      // Tratamento de erro
      print('Erro ao conectar: $e');
    }
  }
}

