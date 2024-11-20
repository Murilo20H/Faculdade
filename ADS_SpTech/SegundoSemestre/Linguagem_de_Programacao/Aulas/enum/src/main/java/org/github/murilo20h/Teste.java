package org.github.murilo20h;

public class Teste {
    public static void main(String[] args) {
        Cliente cliente01 = new Cliente("Bob", 3, Plano.OURO);

        System.out.println("O plano do cliente 1 é: " + cliente01.getPlano());

        //Mostre todas as opções de plano para que o usuário escolha
        for (Plano planoDaVez : Plano.values()) {
            System.out.println("OPÇÃO DE PLANO:");
            System.out.println(planoDaVez);
            System.out.println(planoDaVez.getDescricao());
            System.out.println(planoDaVez.getValor());
        }
    }
}
