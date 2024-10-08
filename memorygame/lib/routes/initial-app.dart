import 'package:flutter/material.dart';
import 'package:memorygame/screens/about.dart';
import 'package:memorygame/screens/nickname.dart';
import 'package:memorygame/screens/game.dart';
import 'package:memorygame/screens/ranking.dart';
import 'package:memorygame/screens/score_register.dart';
import '../screens/home-page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/account': (context) => NicknameScreen(),
        '/about': (context) => AboutScreen(),
        '/game': (context) => CatGame(initialNumCards: 8, initialScore: 0),
        '/ranking': (context) => RankingScreen(),
        '/score_register': (context) => ScoreRegister(),
      },
    );
  }
}
