package org.example;

import java.util.List;

public class Teste {
    public static void main(String[] args) {
        Musica musica01 = new Musica("Billie Jean", "Michael J.", 4.5);
        musica01.curtir();
        musica01.curtir();
        musica01.curtir();

        Musica musica02 = new Musica("Exagerado", "Cazuza", 2.7);
        musica02.curtir();

        Album album01 = new Album("Tops 90s", 3);
        album01.adicionarMusica(musica01);

        Album album02 = new Album("Favoritas", 5);
        album02.adicionarMusica(musica01);
        album02.adicionarMusica(musica02);

        System.out.println(musica01);
        System.out.println(musica02);

        System.out.println("===============================");
        System.out.println("Exibindo por likes:");
        album02.exibirMusicaPorQtdLikes(2);
    }
}
