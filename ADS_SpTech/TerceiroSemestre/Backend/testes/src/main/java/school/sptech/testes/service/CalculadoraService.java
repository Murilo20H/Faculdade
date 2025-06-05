package school.sptech.testes.service;

public class CalculadoraService {
    public double somar(Double a, Double b) {
        if (a == null || b == null) {
            throw new IllegalArgumentException("Não pode ser nulo");
        }
        return a + b;
    }
}
