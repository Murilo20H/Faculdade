package org.github.murilo20h;

public class Moto extends Veiculo {
    private Boolean possuiCapacete;

    public Moto(String nomeCLiente, String marca, Integer anoFabricacao, Boolean possuiCapacete) {
        super(nomeCLiente, marca, anoFabricacao);
        this.possuiCapacete = possuiCapacete;
    }

    @Override
    public void exibirRelatorio() {
        System.out.println("Relatório da moto de: " + nomeCLiente);

        if (possuiCapacete) {
            System.out.println("Temos capacetes melhores que o seu!");
        } else {
            System.out.println("Compre um capacete aqui, saia do perigo!");
        }
    }

    public Boolean getPossuiCapacete() {
        return possuiCapacete;
    }

    public void setPossuiCapacete(Boolean possuiCapacete) {
        this.possuiCapacete = possuiCapacete;
    }
}
