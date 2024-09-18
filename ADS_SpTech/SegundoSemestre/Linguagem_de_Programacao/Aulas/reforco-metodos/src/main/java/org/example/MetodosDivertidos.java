package org.example;

import java.util.concurrent.ThreadLocalRandom;

public class MetodosDivertidos {

    public Integer avaliandoSorte(Integer numero) {
        Integer aleatorio = ThreadLocalRandom.current().nextInt(11);
        Integer tentativas = 1;
        while (aleatorio != numero) {
            aleatorio = ThreadLocalRandom.current().nextInt(11);
            tentativas++;
        }
        return tentativas;
    }

    public Integer exibeSomaSorteio() {
        Integer aleatorio = ThreadLocalRandom.current().nextInt(11);
        Integer soma = 0;
        while (aleatorio != 0) {
            soma += aleatorio;
            aleatorio = ThreadLocalRandom.current().nextInt(11);
        }
        return soma;
    }

    public void exibeImpares() {
        for (int i = 1; i <= 90; i+=2) {
            System.out.println(i);
        }
    }

    public Integer posicaoSorteio(Integer numero) {
        Integer aleatorio;
        Integer primeiraVez = -1;
        for (int i = 1; i <= 200; i++) {
            aleatorio = ThreadLocalRandom.current().nextInt(101);
            if (aleatorio == numero && primeiraVez == -1) {
                primeiraVez = aleatorio;
            }
        }
        return primeiraVez;
    }
}
