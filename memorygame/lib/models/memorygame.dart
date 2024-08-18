import 'dart:math';

class MemoryGameManager {
  final List<int> imagePaths = [100, 102, 200, 201, 202, 204, 205, 206, 207,300,
    301,302,303,304,305,307,308,400,401,402,403,404,405,406,407,408,409,410,411,
    412,413,414,415,416,417,418,421,422,423,424,426,428,429,431,451,500,501,502,
    503,504,507,508,510
  ];
  
  List<Map<String, dynamic>> generateImageList(int numCards) {
    imagePaths.shuffle();

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
