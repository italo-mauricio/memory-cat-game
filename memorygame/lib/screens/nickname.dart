import 'package:flutter/material.dart';

class NicknameScreen extends StatefulWidget {
  @override
  _NicknameScreenState createState() => _NicknameScreenState();
}

class _NicknameScreenState extends State<NicknameScreen> {
  final TextEditingController _nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register NickName',
          style: TextStyle(fontFamily: 'Cattie', fontSize: 30),
        ),
        backgroundColor: Color(0xFFF2D680),
        centerTitle: true, // Centraliza o título
        automaticallyImplyLeading: false,
        actions: const [
          SizedBox(width: 16),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF2D680),
              Color.fromARGB(255, 247, 192, 138)
            ], // Gradiente de cores para o fundo
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              const SizedBox(height: 20),
              TextField(
                controller: _nicknameController,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18), // Estilo do texto do nickname
                decoration: InputDecoration(
                  labelText: 'Digite seu nickname',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black87),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color.fromARGB(255, 31, 31, 31)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Exibir uma mensagem de feedback
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Nickname confirmado: ${_nicknameController.text.trim()}'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF2D680), // Cor do botão
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Confirmar',
                  style: TextStyle(fontSize: 18, color: Colors.black), // Cor do texto do botão
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
