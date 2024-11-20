package org.github.murilo20h;

public class Teste {
    public static void main(String[] args) {
        Contato contato01 = new Contato("Bob da Silva", "11987654321", "padrão", 5.0);
        Contato contato02 = new Contato("Jorge", "11111111111", "padrão", 12.5);
        Contato contato03 = new Contato("Joelinton", "1123232323", "padrão", 20.5);
        Contato contato04 = new Contato("Pedro", "1199887766", "empresarial", 40.0);

        contato01.bloquear();
        contato02.bloquear();
        contato04.bloquear();
        contato04.desbloquear();

        System.out.println("======================================================");
        System.out.println(contato01.toString());
        System.out.println("---*---*---*---*---*---*");
        System.out.println(contato02.toString());
        System.out.println("---*---*---*---*---*---*");
        System.out.println(contato03.toString());
        System.out.println("---*---*---*---*---*---*");
        System.out.println(contato04.toString());
        System.out.println("======================================================");

        Grupo grupo01 = new Grupo("Faculdade");
        grupo01.adicionarContato(contato01);
        grupo01.adicionarContato(contato03);
        grupo01.adicionarContato(contato02);

        Grupo grupo02 = new Grupo("Trabalho");
        grupo02.adicionarContato(contato01);
        grupo02.adicionarContato(contato04);
        grupo02.adicionarContato(contato02);
        grupo02.removerContato(contato02);
        grupo02.removerPorTipo("empresarial");

        System.out.println("\n\n======================================================");
        System.out.println(grupo01.toString());
        System.out.println("---*---*---*---*---*---*");
        System.out.println(grupo02.toString());
        System.out.println("======================================================");
    }
}