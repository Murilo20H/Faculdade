package introducao;

public class BilheteUnico {
    //Atributos = Características do objeto
    String nomeTitular;
    Double saldo;
    String codigo;
    Integer quantidadeVezesUsada;

    //Métodos = Comportamentos
    void carregar(Double valorRecarga){
        if (valorRecarga > 0.0) {
            saldo += valorRecarga;
            System.out.println("Recarga de " + valorRecarga + " efetuada!");
        } else {
            System.out.println("Valor inválido!");
        }
    }

    Boolean usar(){
        if (saldo >= 5.0) {
            saldo -= 5.0;
            quantidadeVezesUsada++;
            System.out.println("Saldo restante: " + saldo);
            return true;
        } else {
            System.out.println("Saldo insuficiente!");
            return false;
        }
    }
}
