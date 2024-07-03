import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {

  const DrawerApp();

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromRGBO(35, 131, 51, 1.0);

    return Drawer(
      child: Column(
        children: [
          Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset('lib/assets/logo.png'),
                ),
                accountName: const Text('Usuário'),
                accountEmail: const Text('teste12@gmail.com'),
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}