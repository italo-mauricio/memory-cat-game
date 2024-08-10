import 'package:flutter/material.dart';
import 'package:memorygame/components/myAppBar.dart';
class AboutScreen extends StatelessWidget {
  final Color backgroundColor = const Color(0xFFF2D680);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Memory Cat Game',
      ),
      body: Container(
        color: backgroundColor,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Memory Cat Game é um jogo da memória desenvolvido em Flutter. '
                'Ele combina diversão e desafio com uma adorável temática de gatos. '
                'O objetivo do jogo é encontrar todos os pares de cartas com imagens de gatos no menor tempo possível, '
                'testando a memória e a concentração dos jogadores. '
                'Os jogadores podem escolher entre diferentes níveis de dificuldade, tornando o jogo acessível para todas as idades e habilidades. '
                'Com gráficos atraentes e sons envolventes, Memory Cat Game oferece uma experiência de jogo agradável e viciante.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 20),
              Text(
                'Funcionalidades principais:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '- Interface intuitiva e fácil de usar.\n'
                '- Vários níveis de dificuldade para desafiar os jogadores.\n'
                '- Imagens encantadoras de gatos para tornar o jogo mais divertido.\n'
                '- Registro de pontuação e tempo para incentivar a melhoria contínua.\n'
                '- Efeitos sonoros e animações atraentes.\n'
                '- Modo multijogador para jogar com amigos e familiares.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 20),
              Text(
                'Desenvolvido por:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Italo Mauricio, Dayanne Xavier, Vinicius Maia, Lucas Mateus',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              Spacer(),
              Center(
                child: Text(
                  'Versão 1.0.0',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
