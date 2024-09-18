package org.example;

public class Teste {
    public static void main(String[] args) {
        MetodosDivertidos metodosDivertidos = new MetodosDivertidos();

        Integer exercicio1 = metodosDivertidos.avaliandoSorte(2);
        if (exercicio1 <= 3) {
            System.out.println("Você é MUITO sortudo");
        } else if (exercicio1 <= 10) {
            System.out.println("Você é sortudo");
        } else {
            System.out.println("É melhor você parar de apostar e ir trabalhar");
        }

        Integer exercicio2 = metodosDivertidos.exibeSomaSorteio();
        System.out.println("A soma dos números é " + exercicio2);


        metodosDivertidos.exibeImpares();


        Integer exercicio4 = metodosDivertidos.posicaoSorteio(28);
        if (exercicio4 == -1) {
            System.out.println("O número escolhido não foi sorteado!");
        }
    }
}