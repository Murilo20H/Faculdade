import java.util.concurrent.ThreadLocalRandom;

public class ExemploLacosDeRepeticao {
    public static void main(String[] args) {
        System.out.println("========== FOR ==========");
        for (int i = 0; i <= 10; i++) {
            System.out.println(i);
        }

        System.out.println("========== WHILE ==========");
        Integer contador = 0;
        while(contador <= 10) {
            System.out.println(contador);
            contador++;
        }

        System.out.println("========== WHILE ==========");
        Integer inteiroAleatorio = ThreadLocalRandom.current().nextInt(1, 11);
        while(inteiroAleatorio != 3) {
            inteiroAleatorio = ThreadLocalRandom.current().nextInt(1, 11);
            System.out.println("Não sorteou, sorteado: " + inteiroAleatorio);
        }
        System.out.println("Número sorteado");
    }
}
