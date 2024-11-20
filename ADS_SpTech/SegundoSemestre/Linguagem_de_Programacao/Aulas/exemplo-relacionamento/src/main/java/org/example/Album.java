package org.example;

import java.util.ArrayList;
import java.util.List;

public class Album {
    private String nome;
    private Integer qtdPremios;
    private List<Musica> musicas;

    public Album(String nome, Integer qtdPremios) {
        this.nome = nome;
        this.qtdPremios = qtdPremios;
        this.musicas = new ArrayList<>();
    }

    public void adicionarMusica(Musica musica) {
        musicas.add(musica);
    }

    public void exibirMusicaPorQtdLikes(Integer qtdFiltro) {
//        For tradicional
//        for (int i = 0; i < musicas.size(); i++) {
//            if (musicas.get(i).getQtdLikes() >= qtdFiltro) {
//                System.out.println(musicas.get(i));
//            }
//        }

//        Enhanced for
//        Não use para remover, remova pelo indice (i)
        for (Musica musica : musicas) {
            if (musica.getQtdLikes() >= qtdFiltro) {
                System.out.println(musica);
            }
        }
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getQtdPremios() {
        return qtdPremios;
    }

    public void setQtdPremios(Integer qtdPremios) {
        this.qtdPremios = qtdPremios;
    }

    public List<Musica> getMusicas() {
        return musicas;
    }

    public void setMusicas(List<Musica> musicas) {
        this.musicas = musicas;
    }
}
