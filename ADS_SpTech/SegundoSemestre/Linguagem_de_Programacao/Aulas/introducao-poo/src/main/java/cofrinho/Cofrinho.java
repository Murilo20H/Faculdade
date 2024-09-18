package cofrinho;

import java.util.concurrent.ThreadLocalRandom;

public class Cofrinho {
    String meta;
    Boolean quebrado;
    Double dinheiro;

    void depositar(Double valor) {
        if (quebrado) {
            System.out.println("O cofrinho já está quebrado");
        } else if (valor <= 0) {
            System.out.println("Valor inválido");
        } else {
            dinheiro += valor;
            System.out.println("Foi depositado R$" + valor);
        }
    }

    Double agitar() {
        if (quebrado) {
            System.out.println("O cofrinho já está quebrado");
            return null;
        }

        Double numeroAleatorio = ThreadLocalRandom.current().nextDouble(0.0, dinheiro);
        System.out.println("Número retirado: " + numeroAleatorio);
        dinheiro -= numeroAleatorio;
        return numeroAleatorio;
    }

    Double quebrar() {
        Double valor = dinheiro;
        if (quebrado) {
            System.out.println("O cofrinho já está quebrado");
        } else {
            quebrado = true;
            System.out.println("O cofrinho tinha R$ " + dinheiro);
            dinheiro = 0.0;
        }
        return valor;
    }
}