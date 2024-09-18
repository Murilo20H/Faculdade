package cofrinho;

public class Teste {
    public static void main(String[] args) {
        Cofrinho cofrinho1 = new Cofrinho();
        cofrinho1.meta = "Aquisição de uma bicicleta nova";
        cofrinho1.quebrado = false;
        cofrinho1.dinheiro = 0.0;
        cofrinho1.depositar(15.0);
        cofrinho1.depositar(10.0);
        cofrinho1.quebrar();
        cofrinho1.agitar();

        System.out.println("----------------------------");

        Cofrinho cofrinho2 = new Cofrinho();
        cofrinho2.meta = "Aquisição de um Playstation 5";
        cofrinho2.quebrado = false;
        cofrinho2.dinheiro = 0.0;
        cofrinho2.depositar(15.0);
        cofrinho2.agitar();
        cofrinho2.quebrar();
    }
}
