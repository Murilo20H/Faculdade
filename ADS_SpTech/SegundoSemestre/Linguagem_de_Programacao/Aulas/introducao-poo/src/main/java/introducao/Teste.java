package introducao;

public class Teste {
    public static void main(String[] args) throws Exception {
        BilheteUnico bilhete1 = new BilheteUnico();
        bilhete1.nomeTitular = "Bob";
        bilhete1.saldo = 0.0;
        bilhete1.codigo = "B001";
        bilhete1.quantidadeVezesUsada = 0;

        BilheteUnico bilhete2 = new BilheteUnico();
        bilhete2.nomeTitular = "José";
        bilhete2.saldo = 0.0;
        bilhete2.codigo = "B002";
        bilhete2.quantidadeVezesUsada = 0;

        bilhete1.carregar(42.1);
        System.out.println("Saldo do B1: " + bilhete1.saldo);
        Boolean deuCerto = bilhete1.usar();
        System.out.println("Uso deu certo? " + deuCerto);
    }
}
