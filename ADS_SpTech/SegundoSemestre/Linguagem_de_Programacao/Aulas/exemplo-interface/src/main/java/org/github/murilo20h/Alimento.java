package org.github.murilo20h;

public class Alimento extends Produto {
    private Integer qtdVitaminas;

    public Alimento(String nome, String codigo, Double valor, Integer qtdVitaminas) {
        super(nome, codigo, valor);
        this.qtdVitaminas = qtdVitaminas;
    }

    @Override
    public Double calcularImposto() {
        return qtdVitaminas * 0.1;
    }

    public Integer getQtdVitaminas() {
        return qtdVitaminas;
    }

    public void setQtdVitaminas(Integer qtdVitaminas) {
        this.qtdVitaminas = qtdVitaminas;
    }
}
