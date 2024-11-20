package cofrinho;

public class Teste {
    public static void main(String[] args) {
        Cofrinho cofrinho1 = new Cofrinho("Aquisição de uma bicicleta nova", false);
        cofrinho1.depositar(15.0);
        cofrinho1.depositar(10.0);
        cofrinho1.quebrar();
        cofrinho1.agitar();

        System.out.println("----------------------------");

        Cofrinho cofrinho2 = new Cofrinho("Aquisição de um Playstation 5", false);
        cofrinho2.depositar(15.0);
        cofrinho2.agitar();
        cofrinho2.quebrar();

        System.out.println("----------------------------");

        Cofrinho cofrinho3 = new Cofrinho(false);
        cofrinho3.depositar(30.0);
        System.out.println(cofrinho3.getDinheiro());
        cofrinho3.setMeta("Aquisição de um computador");
    }
}
