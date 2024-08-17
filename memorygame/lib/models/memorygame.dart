import 'dart:math';

class MemoryGameManager {
  final List<int> imagePaths = [100, 102, 200, 201, 204, 214, 400, 404];

   List<Map<String, dynamic>>  generateImageList(int numCards) {
    if (numCards % 2 != 0) {
      throw Exception('Number of cards must be even.');
    }

    List<Map<String, dynamic>> images = [];
    int i = 0;

    Random rand = Random();
    while (images.length < numCards) {
      int index = rand.nextInt(imagePaths.length);
      images.add({'image': imagePaths[index], 'index': i});
      images.add({'image': imagePaths[index], 'index': i});

      i++;
    }
    images.shuffle();
    return images;
  }
}
