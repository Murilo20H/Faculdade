import java.util.ArrayList;
import java.util.List;

public class RelatorioMetodos {
    Integer buscarQuantidadeVendas(List<Double> precos) {
        return precos.size();
    }

    Double somarVendas(List<Double> precos) {
        Double total = 0.0;
        for (Double preco : precos) {
            total+=preco;
        }
        return total;
    }

    Boolean buscarPreco(List<Double> precos, Double precoPesquisado) {
//        return precos.contains(precoPesquisado);
        for (Double preco : precos) {
            if (preco.equals(precoPesquisado)) {
                return true;
            }
        }
        return false;
    }

    Double buscarMaiorPreco(List<Double> precos) {
        Double maiorPreco = 0.0;
        for (Double preco : precos) {
            if (preco > maiorPreco) {
                maiorPreco = preco;
            }
        }
        return maiorPreco;
    }

    Double buscarMenorPreco(List<Double> precos) {
        Double menorPreco = precos.get(0);
        for (Double preco : precos) {
            if (preco < menorPreco) {
                menorPreco = preco;
            }
        }
        return menorPreco;
    }

    List<Double> buscarPorPrecoMinimo(List<Double> precos, Double precoFiltro) {
        List<Double> listaNova = new ArrayList<>();
        for (Double preco : precos) {
            if (preco >= precoFiltro) {
                listaNova.add(preco);
            }
        }
        return listaNova;
    }
}
