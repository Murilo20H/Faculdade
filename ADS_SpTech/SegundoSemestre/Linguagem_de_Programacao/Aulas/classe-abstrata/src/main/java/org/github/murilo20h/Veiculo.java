package org.github.murilo20h;

public abstract class Veiculo {
    protected String nomeCLiente;
    protected String marca;
    protected Integer anoFabricacao;

    public Veiculo(String nomeCLiente, String marca, Integer anoFabricacao) {
        this.nomeCLiente = nomeCLiente;
        this.marca = marca;
        this.anoFabricacao = anoFabricacao;
    }

    public Veiculo() {
    }

    public abstract void exibirRelatorio();

    public String getNomeCLiente() {
        return nomeCLiente;
    }

    public void setNomeCLiente(String nomeCLiente) {
        this.nomeCLiente = nomeCLiente;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public Integer getAnoFabricacao() {
        return anoFabricacao;
    }

    public void setAnoFabricacao(Integer anoFabricacao) {
        this.anoFabricacao = anoFabricacao;
    }
}
