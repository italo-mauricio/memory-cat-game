# Memory cat game
O memory cat game é um projeto desenvolvido na matéria de POO2. Seu propósito é ser um jogo da memória para passar o tempo, desafie suas habilidades de memória enquanto se diverte com diferentes modalidades de jogo.

## Tabelas usadas

```mermaid
erDiagram
    JOGADOR {
        int id pk
        string nick
    }

    PARTIDA {
        int id pk
        int duracao
        int id_modalidade fk
    }

    JOGADOR_PARTIDA {
        int id pk
        int pontuacao
        int id_jogador fk
        int id_partida fk
    }

    MODALIDADE {
        int id pk
        string nome
        string descricao
    }

    JOGADOR ||--o{ JOGADOR_PARTIDA : "participa"

    PARTIDA ||--o{ JOGADOR_PARTIDA : "tem"

    MODALIDADE ||--o{ PARTIDA : "tem uma"
   
```

## Modalidades planejadas

- Clássico

Partidas normais com cartas viradas para baixo, o jogador precisa encontrar os pares correspondentes.

- Multiplayer Competitivo

Dois jogadores competem simultaneamente para encontrar pares, com cada jogador tendo seu próprio turno.