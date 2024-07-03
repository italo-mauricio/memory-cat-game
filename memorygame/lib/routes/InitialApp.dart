import 'package:flutter/material.dart';
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
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),

      },
    );
  }
}