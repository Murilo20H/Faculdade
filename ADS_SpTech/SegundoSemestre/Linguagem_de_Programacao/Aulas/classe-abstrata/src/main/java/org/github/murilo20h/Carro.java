package org.github.murilo20h;

public class Carro extends Veiculo{
    private Double nivelOleo;
    private Boolean possuiEstepe;

    public Carro(String nomeCLiente, String marca, Integer anoFabricacao, Double nivelOleo, Boolean possuiEstepe) {
        super(nomeCLiente, marca, anoFabricacao);
        this.nivelOleo = nivelOleo;
        this.possuiEstepe = possuiEstepe;
    }

    @Override
    public void exibirRelatorio() {
        System.out.println("Relatório do carro de: " + nomeCLiente);

        if (possuiEstepe) {
            System.out.println("Estepe ok!");
        } else {
            System.out.println("Compra um estepe com a gente!");
        }

        if (nivelOleo < 0.5) {
            System.out.println("Nível de óleo baixo, complete aqui!");
        } else {
            System.out.println("Nível de óleo ok!");
        }
    }

    public Double getNivelOleo() {
        return nivelOleo;
    }

    public void setNivelOleo(Double nivelOleo) {
        this.nivelOleo = nivelOleo;
    }
}
