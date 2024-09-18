import java.util.Scanner;

public class ExemploSwitch {
    public static void main(String[] args) {
        Scanner leitor = new Scanner(System.in);

        System.out.println("Digite um dia da semana (1-7)");
        Integer dia = leitor.nextInt();
//        switch(dia) {
//            case 1:
//                System.out.println("Domingo");
//                break;
//            case 2:
//                System.out.println("Segunda-feira");
//                break;
//            case 3:
//                System.out.println("Terça-feira");
//                break;
//            case 4:
//                System.out.println("Quarta-feira");
//                break;
//            case 5:
//                System.out.println("Quinta-feira");
//                break;
//            case 6:
//                System.out.println("Sexta-feira");
//                break;
//            case 7:
//                System.out.println("Sábado");
//                break;
//            default:
//                System.out.println("Dia da semana inválido");
//                break;
//        }


//        switch (dia) {
//            case 1 -> {
//                System.out.println("Domingo");
//            }
//            case 2 -> {
//                System.out.println("Segunda-feira");
//            }
//            case 3 -> {
//                System.out.println("Terça-feira");
//            }
//            case 4 -> {
//                System.out.println("Quarta-feira");
//            }
//            case 5 -> {
//                System.out.println("Quinta-feira");
//            }
//            case 6 -> {
//                System.out.println("Sexta-feira");
//            }
//            case 7 -> {
//                System.out.println("Sábado");
//            }
//            default -> {
//                System.out.println("Dia da semana inválido");
//            }
//        }


//        switch (dia) {
//            case 1 -> System.out.println("Domingo");
//            case 2 -> System.out.println("Segunda-feira");
//            case 3 -> System.out.println("Terça-feira");
//            case 4 -> System.out.println("Quarta-feira");
//            case 5 -> System.out.println("Quinta-feira");
//            case 6 -> System.out.println("Sexta-feira");
//            case 7 -> System.out.println("Sábado");
//            default -> System.out.println("Dia da semana inválido");
//        }


        String texto = switch (dia) {
            case 1 -> "Domingo";
            case 2 -> "Segunda-feira";
            case 3 -> "Terça-feira";
            case 4 -> "Quarta-feira";
            case 5 -> "Quinta-feira";
            case 6 -> "Sexta-feira";
            case 7 -> "Sábado";
            default -> "Dia da semana inválido";
        };
        System.out.println(texto);
    }
}
