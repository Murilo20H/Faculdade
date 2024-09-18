import java.util.ArrayList;
import java.util.List;

public class RevisaoListas {
    public static void main(String[] args) {
        List<String> frutas = new ArrayList<>();
        frutas.add("Morango");
        frutas.add("Banana");
        frutas.add("Laranja");
        System.out.println("ArrayList 1: " + frutas);


        List<String> frutas2 = List.of("Morango", "Banana", "Laranja");
        System.out.println("List 2: " + frutas2);


        List<String> frutas3 = new ArrayList<>(
                List.of("Morango", "Banana", "Laranja")
        );
        frutas3.add("Uva");
        frutas3.set(1, "Melão");
        System.out.println("ArrayList 3: " + frutas3);


        List<Integer> numeros = new ArrayList<>(
                List.of(10, 25, -6, 12)
        );
        Integer valor = 10;
        numeros.remove(valor);
        System.out.println("ArrayList 4: " + numeros);

        System.out.println("Números da Lista:\n=============================");
        for (int i = 0; i < numeros.size(); i++) {
            System.out.println(numeros.get(i));
        }
        System.out.println("=============================");
        for (Integer numero : numeros) {
            System.out.println(numero);
        }
        System.out.println("=============================");
    }
}
