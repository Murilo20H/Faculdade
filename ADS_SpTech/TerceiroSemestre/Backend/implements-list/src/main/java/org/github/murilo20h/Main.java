package org.github.murilo20h;

public class Main {
    public static void main(String[] args) {
        ListaEstatica lista = new ListaEstatica(5);

        System.out.println("\nAdd =======================\n");
        System.out.println(lista.toString());
        lista.add("aaa");
        lista.add("bbb");
        lista.add("ccc");
        lista.add("ddd");
        lista.add("eee");
        lista.add("fff");
        System.out.println(lista.toString());

        System.out.println("\nGet by Element=======================\n");

        System.out.println(lista.toString());
        System.out.println(lista.get("aaa"));
        System.out.println(lista.get("ccc"));
        System.out.println(lista.get("eee"));
        System.out.println(lista.toString());

        System.out.println("\nGet by Index =======================\n");

        System.out.println(lista.toString());
        System.out.println(lista.get(0));
        System.out.println(lista.get(2));
        System.out.println(lista.get(4));
        System.out.println(lista);

        System.out.println("\nRemove by Index =======================\n");

        System.out.println(lista.toString());
        System.out.println(lista.remove(0));
        System.out.println(lista.toString());
        System.out.println(lista.remove(2));
        System.out.println(lista.toString());
        System.out.println(lista.remove(4));
        System.out.println(lista.toString());

        System.out.println("\nRemove by Element =======================\n");

        lista.add("ccc");
        lista.add("aaa1");
        System.out.println(lista.toString());
        System.out.println(lista.remove("ccc"));
        System.out.println(lista.toString());

        System.out.println("\nSize =======================\n");

        System.out.println(lista.toString());
        System.out.println(lista.size());
        lista.add("aaa2");
        lista.add("aaa3");
        System.out.println(lista.toString());
        System.out.println(lista.size());
    }
}