package org.github.murilo20h;

import java.util.ArrayList;
import java.util.List;

public class Grupo {
    private String nome;
    private List<Contato> contatos;

    public Grupo(String nome) {
        this.nome = nome;
        this.contatos = new ArrayList<>();
    }

    public void adicionarContato(Contato contato) {
        contatos.add(contato);
    }

    public void removerContato(Contato contato) {
        contatos.remove(contato);
    }

    public void removerPorNome(String nome) {
        for (int i = 0; i < contatos.size(); i++) {
            if (contatos.get(i).getNome().equals(nome)) {
                contatos.remove(i);
            }
        }
    }

    public void removerPorTipo(String tipo) {
        for (int i = 0; i < contatos.size(); i++) {
            if (contatos.get(i).getTipoContato().equals(tipo)) {
                contatos.remove(i);
            }
        }
    }

    public Integer getQuantidadeBloqueados() {
        Integer quantidadeBloqueados = 0;
        for (Contato contato : contatos) {
            quantidadeBloqueados += contato.getBloqueado() ? 1 : 0;
        }
        return quantidadeBloqueados;
    }

    public Double somaValorDoacoes() {
        Double somatorioDoacoes = 0.0;
        for (Contato contato : contatos) {
            somatorioDoacoes += contato.getDoacao();
        }
        return somatorioDoacoes;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public List<Contato> getContatos() {
        return contatos;
    }

    @Override
    public String toString() {
        String contatosFormatados = "";
        for (int i = 0; i < contatos.size(); i++) {
            contatosFormatados += "\t\tContato " + (i + 1) + " { \n\t\t\tNome: " + contatos.get(i).getNome()
                    + "\n\t\t\tTelefone: " + contatos.get(i).getTelefone()
                    + "\n\t\t\tBloqueado: " + (contatos.get(i).getBloqueado() ? "sim" : "não")
                    + "\n\t\t\tTipo de contato: " + contatos.get(i).getTipoContato()
                    + "\n\t\t\tDoação: " + contatos.get(i).getDoacao() + "\n\t\t},\n";
        }
        return """
                Grupo {
                    Nome: %s
                    Integrantes: 
                %s}
                """.formatted(nome, contatosFormatados);
    }
}
