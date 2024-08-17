import 'package:flutter/material.dart';

class AppBarGame extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int score;
  final Color backgroundColor = const Color(0xFFF2D680);

  AppBarGame({
    required this.title,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Cattie',
              fontSize: 50,
              color: Color.fromARGB(153, 2, 2, 2),
            ),
          ),
          // Pontuação
          Text(
            'Score: $score',
            style: const TextStyle(
              fontFamily: 'Cattie',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(153, 2, 2, 2),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
