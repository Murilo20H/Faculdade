package org.example;

import java.util.ArrayList;
import java.util.List;

public class ExemploListas {
    public static void main(String[] args) {
        List listaEstranha = new ArrayList();
        listaEstranha.add(true);
        listaEstranha.add("Bob");
        listaEstranha.add(42);

        List<String> nomes = new ArrayList();
        nomes.add("Bob da Silva");
        nomes.add("José");
        nomes.add("Maria");

        System.out.println("Segundo nome da lista: %s".formatted(nomes.get(1)));

        MetodosComLista metodos = new MetodosComLista();
        metodos.exibeListaDeNomes(nomes);

//      Principais métodos da lista no java
//        add - adiciona elemento
//        size - retorna o tamanho
//        get - busca elemento por indice
//        set - altera elemento no indice
//        remove - remove elemento por indice
//        isEmpty - retorna true se a lista está vazia
//        clear - limpa a lista
    }
}