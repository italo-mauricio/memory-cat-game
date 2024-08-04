import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp();

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFF2D680);

    return Drawer(
      elevation: 0, // Remover elevação para evitar sombra
      child: Container(
        color: Colors.transparent, // Tornar o fundo transparente
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Usuário',
                    style: TextStyle(
                      color: Color.fromARGB(255, 48, 47, 47),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Fechar o drawer
                // Navegar para a tela inicial
                Navigator.pushNamed(context, '/'); // Ajuste de acordo com suas rotas
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context); // Fechar o drawer
                Navigator.pushNamed(context, '/about');
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
