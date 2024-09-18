import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner leitor = new Scanner(System.in);

        Integer escolha = 0;
        while(escolha != 4) {
            System.out.format("""
                ========================
                1 - Somar
                2 - Subtrair
                3 - Multiplicar
                4 - Sair
                ========================
                """);
            escolha = leitor.nextInt();
            switch (escolha) {
                case 1 -> {
                    System.out.println("---------------------------\nOPERAÇÃO ESCOLHIDA: Soma");
                    System.out.println("Digite o primeiro valor: ");
                    Double n1 = leitor.nextDouble();
                    System.out.println("Digite o segundo valor: ");
                    Double n2 = leitor.nextDouble();
                    System.out.println("Resultado: " + (n1 + n2));
                }
                case 2 -> {
                    System.out.println("---------------------------\nOPERAÇÃO ESCOLHIDA: Subtração");
                    System.out.println("Digite o primeiro valor: ");
                    Double n1 = leitor.nextDouble();
                    System.out.println("Digite o segundo valor: ");
                    Double n2 = leitor.nextDouble();
                    System.out.println("Resultado: " + (n1 - n2));
                }
                case 3 -> {
                    System.out.println("---------------------------\nOPERAÇÃO ESCOLHIDA: Multiplicação");
                    System.out.println("Digite o primeiro valor: ");
                    Double n1 = leitor.nextDouble();
                    System.out.println("Digite o segundo valor: ");
                    Double n2 = leitor.nextDouble();
                    System.out.println("Resultado: " + (n1 * n2));
                }
                case 4 -> System.out.println("---------------------------\nAté mais!!");
                default -> System.out.println("---------------------------\nNúmero inválido, tente novamente:");
            }

        }
    }
}
