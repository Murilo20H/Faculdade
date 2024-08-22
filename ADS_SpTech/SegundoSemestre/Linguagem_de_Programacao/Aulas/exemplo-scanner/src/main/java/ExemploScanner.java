import java.util.Scanner;

public class ExemploScanner {
    public static void main(String[] args) {
        //Parametros = argumentos
        Scanner leitor = new Scanner(System.in);

        System.out.println("Digite seu nome:");
        String nomeUsuario = leitor.nextLine();

        System.out.println("Digite sua idade:");
        Integer idadeUsuario = leitor.nextInt();

        System.out.println("Digite sua altura:");
        Double alturaUsuario = leitor.nextDouble();

        System.out.println("""
                Olá %s, você tem %d anos e %.2f m de altura"""
                .formatted(nomeUsuario, idadeUsuario, alturaUsuario));
    }
}
