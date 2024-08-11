import 'dart:math';

class MemoryGameManager {
  final List<int> imagePaths = [100, 102, 200, 201, 204, 214, 400, 404];

  List<int> generateImageList(int numCards) {
    if (numCards % 2 != 0) {
      throw Exception('Number of cards must be even.');
    }

    List<int> images = [];
    Random rand = Random();
    while (images.length < numCards) {
      int index = rand.nextInt(imagePaths.length);
      images.add(imagePaths[index]);
      images.add(imagePaths[index]); 
    }
    images.shuffle();
    return images;
  }

}
