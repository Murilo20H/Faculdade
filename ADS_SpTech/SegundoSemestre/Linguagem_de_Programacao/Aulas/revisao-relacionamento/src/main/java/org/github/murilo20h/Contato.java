package org.github.murilo20h;

import javax.swing.*;

public class Contato {
    private String nome;
    private String telefone;
    private Boolean bloqueado;
    private String tipoContato;
    private Double doacao;

    public Contato(String nome, String telefone, String tipoContato, Double doacao) {
        this.nome = nome;
        this.telefone = telefone;
        this.bloqueado = false;
        this.tipoContato = tipoContato;
        this.doacao = doacao;
    }

    public void bloquear() {
        bloqueado = true;
    }

    public void desbloquear() {
        bloqueado = false;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Boolean getBloqueado() {
        return bloqueado;
    }

    public String getTipoContato() {
        return tipoContato;
    }

    public void setTipoContato(String tipoContato) {
        this.tipoContato = tipoContato;
    }

    public Double getDoacao() {
        return doacao;
    }

    public void setDoacao(Double doacao) {
        this.doacao = doacao;
    }

    @Override
    public String toString() {
        return """
                Contato {
                    Nome: %s
                    Telefone: %s
                    Bloqueado: %s
                    Tipo de contato: %s
                    Doação: %s
                }
                """.formatted(nome, telefone, (bloqueado ? "sim" : "não"), tipoContato, doacao);
    }
}
