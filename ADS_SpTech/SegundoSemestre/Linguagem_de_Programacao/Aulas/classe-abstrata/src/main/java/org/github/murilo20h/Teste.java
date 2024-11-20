package org.github.murilo20h;

public class Teste {
    public static void main(String[] args) {
        Carro carro01 = new Carro("Bob", "Fiat", 2013, 0.5, false);
        Bicicleta bike01 = new Bicicleta("Rodolfo", "Caloi", 2000, 3.5);
        Moto moto01 = new Moto("Mel", "Top", 1750, false);

//        Classe abstrata não permite instância
        carro01.exibirRelatorio();
        bike01.exibirRelatorio();
        moto01.exibirRelatorio();
    }
}