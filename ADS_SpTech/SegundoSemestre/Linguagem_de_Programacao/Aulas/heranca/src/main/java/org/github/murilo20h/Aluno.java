package org.github.murilo20h;

public class Aluno {
    private String ra;
    private String nome;
    protected Double notaEntrega;
    protected Double notaPratica;
    private Integer qtdFaltas;

    public Aluno(String ra, String nome, Double notaEntrega, Double notaPratica, Integer qtdFaltas) {
        this.ra = ra;
        this.nome = nome;
        this.notaEntrega = notaEntrega;
        this.notaPratica = notaPratica;
        this.qtdFaltas = qtdFaltas;
    }

    public Double calcularMedia() {
        return (notaEntrega +notaPratica) / 2.0;
    }

    public String getRa() {
        return ra;
    }

    public void setRa(String ra) {
        this.ra = ra;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Double getNotaEntrega() {
        return notaEntrega;
    }

    public void setNotaEntrega(Double notaEntrega) {
        this.notaEntrega = notaEntrega;
    }

    public Double getNotaPratica() {
        return notaPratica;
    }

    public void setNotaPratica(Double notaPratica) {
        this.notaPratica = notaPratica;
    }

    public Integer getQtdFaltas() {
        return qtdFaltas;
    }

    public void setQtdFaltas(Integer qtdFaltas) {
        this.qtdFaltas = qtdFaltas;
    }

    @Override
    public String toString() {
        return """
                
                Aluno {
                    RA: %s
                    Nome: %s
                    Nota Entrega: %.2f
                    Nota Prática: %.2f
                    Faltas: %d
                }
                
                """.formatted(ra, nome, notaEntrega, notaPratica, qtdFaltas);
    }
}
