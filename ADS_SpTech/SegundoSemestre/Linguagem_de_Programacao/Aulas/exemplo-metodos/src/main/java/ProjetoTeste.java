import java.util.Scanner;

public class ProjetoTeste {
    public static void main(String[] args) {
        //Criando um objeto para utilizar seus métodos
        MetodosUteis util = new MetodosUteis();
        Scanner leitor = new Scanner(System.in);

        System.out.println("Digite seu nome:");
        String nomeScanner = leitor.nextLine();

        util.exibirUsuario(nomeScanner);
    }
}
