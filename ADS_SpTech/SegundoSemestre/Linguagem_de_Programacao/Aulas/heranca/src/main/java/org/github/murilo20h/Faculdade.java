package org.github.murilo20h;

import java.util.ArrayList;
import java.util.List;

public class Faculdade {
    private String nome;
    private List<Aluno> alunos;

    public Faculdade(String nome) {
        this.nome = nome;
        this.alunos = new ArrayList<>();
    }

    public void matricular(Aluno aluno) {
        alunos.add(aluno);
    }

    public Double somarNotasEntregas() {
        Double somatorio = 0.0;
        for (Aluno aluno : alunos) {
            somatorio += aluno.getNotaEntrega();
        }
        return somatorio;
    }

    public Double somarNotasEntregas(Double notaEntregaMinima) {
        Double somatorio = 0.0;
        for (Aluno aluno : alunos) {
            if (aluno.getNotaEntrega() >= notaEntregaMinima) {
                somatorio += aluno.getNotaEntrega();
            }
        }
        return somatorio;
    }

    public List<Aluno> buscarAlunoPorNome(String nomeBusca) {
        List<Aluno> alunosFiltrados = new ArrayList<>();
        for (Aluno aluno : alunos) {
            if (aluno.getNome().contains(nome)) {
                alunosFiltrados.add(aluno);
            }
        }
        return alunosFiltrados;
    }

    public void deletarAlunos() {
        alunos.clear();
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public List<Aluno> getAlunos() {
        return alunos;
    }

    public void setAlunos(List<Aluno> alunos) {
        this.alunos = alunos;
    }

    @Override
    public String toString() {
        return """
                
                Faculdade {
                    Nome: %s
                    Alunos: %s
                }
                
                """.formatted(nome, alunos);
    }
}
