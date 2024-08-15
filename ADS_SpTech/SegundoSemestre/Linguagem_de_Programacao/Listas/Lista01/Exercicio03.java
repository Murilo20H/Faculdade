package school.sptech;

public class Exercicio03 {
    public static void main(String[] args) {
        Double valorProduto = 12.00;
        Integer quantidadeVendida = 2;
        Double valorPagoCliente = 50.00;
        Double troco = valorPagoCliente - (valorProduto * quantidadeVendida);

        System.out.println("Seu troco será de R$" + troco);
    }
}
