import 'package:flutter/material.dart';
import 'package:memorygame/screens/about.dart';
import 'package:memorygame/screens/nickname.dart';
import '../home/home-page.dart';



class AppWidget extends StatelessWidget {
  const AppWidget({Key? key});

  void logoutCallback(BuildContext context) {
  Navigator.pushReplacementNamed(context, '/'); 
}


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
        'account': (context) => NicknameScreen(),
        'about': (context) => AboutScreen(),

      },
    );
  }
}