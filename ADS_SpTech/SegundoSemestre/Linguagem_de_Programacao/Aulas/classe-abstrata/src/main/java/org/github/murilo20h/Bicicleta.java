package org.github.murilo20h;

public class Bicicleta extends Veiculo {
    private Double calibragemPneu;

    public Bicicleta(String nomeCLiente, String marca, Integer anoFabricacao, Double calibragemPneu) {
        super(nomeCLiente, marca, anoFabricacao);
        this.calibragemPneu = calibragemPneu;
    }

    @Override
    public void exibirRelatorio() {
        System.out.println("Relatório da bicicleta de: " + nomeCLiente);

        if (calibragemPneu < 0.2) {
            System.out.println("Precisa calibrar o pneu da bike!");
        } else {
            System.out.println("Tudo certo com a calibragem!");
        }
    }

    public Double getCalibragemPneu() {
        return calibragemPneu;
    }

    public void setCalibragemPneu(Double calibragemPneu) {
        this.calibragemPneu = calibragemPneu;
    }
}
