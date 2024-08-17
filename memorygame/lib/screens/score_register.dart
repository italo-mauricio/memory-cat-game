import 'package:flutter/material.dart';

class ScoreRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtendo o argumento passado para esta tela
    final int score = ModalRoute.of(context)?.settings.arguments as int? ?? 0;
    final TextEditingController _nicknameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Salvar pontuação'),
        backgroundColor: Color(0xFFF2D680),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF2D680),
              Color.fromARGB(255, 247, 192, 138),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Parabéns!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Sua pontuação: $score',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _nicknameController,
                decoration: InputDecoration(
                  labelText: 'Digite seu nickname',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Pontuação  ${score.toString()} salva com sucesso para o jogador  ${_nicknameController.text.trim()}!'),
                    ),
                  );

                  Navigator.pushNamed(context, '/');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF2D680),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Confirmar',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
