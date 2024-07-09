import 'package:http/http.dart' as http;

class CatApi {
  var client = http.Client();
  var url = 'https://rickandmortyapi.com/api/character/avatar/';

  Future<String> getCatImageUrl(int statusCode) async {
    var imageUrl = '$url$statusCode.jpeg';
    var response = await client.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      return imageUrl;
    } else {
      throw Exception('Failed to load image: ${response.statusCode}');
    }
  }
}
