package org.github.murilo20h;

public class Teste {
    public static void main(String[] args) {
        Faculdade faculdade01 = new Faculdade("SPTech");

        Aluno aluno01 = new Aluno("123", "Bob da Silva", 10.0, 7.5, 0);
        Aluno aluno02 = new Aluno("234", "Xampson de Souza", 5.0, 9.2, 4);

        faculdade01.matricular(aluno01);
        faculdade01.matricular(aluno02);

        Double somaNotas = faculdade01.somarNotasEntregas();
        System.out.println("A soma das notas é: " + somaNotas);
        System.out.println("A soma das notas maiores que 5 é: " + faculdade01.somarNotasEntregas(5.0));


//        Teste de Herança
        AlunoPos aluno03 = new AlunoPos("345", "Mel", 5.5, 7.3, 2, 7.1, 8.5);
        System.out.println("Nota do aluno pós: " + aluno03.calcularMedia());
    }
}
