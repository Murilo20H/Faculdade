import java.util.concurrent.ThreadLocalRandom;

public class ExemploNumerosAleatorios {
    public static void main(String[] args) {
        Integer inteiroAleatorio = ThreadLocalRandom.current().nextInt(1, 11);
        System.out.println("Inteiro Sorteado: " + inteiroAleatorio);
    }
}
