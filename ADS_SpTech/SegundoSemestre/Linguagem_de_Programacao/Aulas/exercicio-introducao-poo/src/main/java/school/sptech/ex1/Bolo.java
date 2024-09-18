package school.sptech.ex1;

public class Bolo {
    String sabor;
    Double valor;
    Integer quantidadeVendida;
    Integer quantidadeEmEstoque;

    void venderBolo(Integer quantidadeDesejada) {
        if (quantidadeDesejada >= 0 && quantidadeDesejada <= quantidadeEmEstoque) {
            quantidadeVendida += quantidadeDesejada;
            quantidadeEmEstoque -= quantidadeDesejada;
        }
    }

    void aumentarEstoque(Integer quantidadeAdicionado) {
        if (quantidadeAdicionado >= 0) {
            quantidadeEmEstoque += quantidadeAdicionado;
        }
    }

    Integer quantidadeDisponivel() {
        return quantidadeEmEstoque;
    }

    Double totalVendido() {
        return quantidadeVendida * valor;
    }
}
