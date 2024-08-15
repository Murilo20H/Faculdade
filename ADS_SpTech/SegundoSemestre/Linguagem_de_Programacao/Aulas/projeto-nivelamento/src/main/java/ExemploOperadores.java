public class ExemploOperadores {
    public static void main(String[] args) {
        Double numero01 = 42.0;
        Double numero02 = 10.0;

        System.out.println("Soma: " + (numero01 + numero02));
        System.out.println("Multiplicação: " + (numero01 * numero02));

        Double resultadoPotencia = Math.pow(numero01, numero02);
        System.out.println("Resultado Potência: " + resultadoPotencia);
    }
}
