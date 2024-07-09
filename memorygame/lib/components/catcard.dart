import 'package:memorygame/services/api.dart';
import 'package:flutter/material.dart';

class CatCard extends StatelessWidget {
  final int statusCode;

  CatCard({required this.statusCode});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: CatApi().getCatImageUrl(statusCode),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                snapshot.data!,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          );
        } else {
          return Text('Image not found');
        }
      },
    );
  }
}
