import java.util.ArrayList;
import java.util.List;

public class TesteVendas {
    public static void main(String[] args) {
        RelatorioMetodos relatorioMetodos = new RelatorioMetodos();
        List<Double> precos = new ArrayList<>(
                List.of(12.90, 5.70, 99.99, 15.00, 17.50, 1.99, 23.40, 50.00, 49.99, 130.00)
        );

        System.out.println("1: " + relatorioMetodos.buscarQuantidadeVendas(precos));
        System.out.println("2: " + relatorioMetodos.somarVendas(precos));
        System.out.println("3: " + relatorioMetodos.buscarPreco(precos, 15.00));
        System.out.println("4: " + relatorioMetodos.buscarMaiorPreco(precos));
        System.out.println("5: " + relatorioMetodos.buscarMenorPreco(precos));
        System.out.println("6: " + relatorioMetodos.buscarPorPrecoMinimo(precos, 12.00));
    }
}
