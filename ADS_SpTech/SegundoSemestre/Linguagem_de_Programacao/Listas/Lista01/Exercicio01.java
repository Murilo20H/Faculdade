package school.sptech;

public class Exercicio01 {
    public static void main(String[] args) {
        Integer filhos0a3Anos = 3;
        Integer filhos4a16Anos = 5;
        Integer filhos17a18Anos = 2;
        Integer totalFilhos = filhos0a3Anos + filhos4a16Anos + filhos17a18Anos;
        Double totalBolsa = (filhos0a3Anos * 25.12) + (filhos4a16Anos * 15.88) + (filhos17a18Anos * 12.44);

        System.out.println("Você tem um total de " + totalFilhos + " filhos e vai receber R$" + totalBolsa + " de bolsa");
    }
}
