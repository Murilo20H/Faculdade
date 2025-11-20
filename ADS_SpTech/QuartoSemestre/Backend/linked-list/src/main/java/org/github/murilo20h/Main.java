package org.github.murilo20h;

public class Main {
    public static void main(String[] args) {
        MyLinkedList<String> listaEncadeada = new MyLinkedList<>();

        listaEncadeada.addLast("Diego");
        listaEncadeada.addLast("Murilo");
        listaEncadeada.addLast("Teste");
        listaEncadeada.addLast("Olá");
        listaEncadeada.addLast("Outro");

        listaEncadeada.print();
        System.out.println("...");
        listaEncadeada.add(1, "Testando");
        listaEncadeada.print();
    }
}