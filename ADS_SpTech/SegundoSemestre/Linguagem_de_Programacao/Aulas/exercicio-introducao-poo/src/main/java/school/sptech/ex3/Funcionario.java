package school.sptech.ex3;

public class Funcionario {
    String nome;
    String cargo;
    Double salario;

    void reajustarSalario(Integer valorReajuste) {
        salario += (salario * valorReajuste / 100);
    }

    Double calcularValorHora() {
        return salario / 220;
    }

    Double calcularHoraExtra(Integer horasTrabalhadas, Integer percentualAdicional) {
        Double valorHoraExtra = 1 + (percentualAdicional / 100.0);
        Double valorHoraNormal = (salario / 220.0);
        return valorHoraNormal * valorHoraExtra * horasTrabalhadas;
    }
}
