package cofrinho;

import java.util.concurrent.ThreadLocalRandom;

public class Cofrinho {
    private String meta;
    private Boolean quebrado;
    private Double dinheiro;

    // Método vs. Construtor
    // Diferente:
    // Precisa especificar retorno X construtor não possui
    // Padrão de nomes: camelCase X PascalCase
    // Qualquer nome X mesmo nome da classe
    // Chama quando quiser X chama na instância

    // Parecido:
    // Estrutura: recebe argumentos e faz algo
    // Também pode ser sobrecarregado
    public Cofrinho(String meta, Boolean quebrado) {
        this.meta = meta;
        this.quebrado = quebrado;
        this.dinheiro = 0.0;
    }

    public Cofrinho(Boolean quebrado) {
        this.meta = "Não possui";
        this.quebrado = quebrado;
        this.dinheiro = 0.0;
    }

    void depositar(Double valor) {
        if (quebrado) {
            System.out.println("O cofrinho já está quebrado");
        } else if (valor <= 0) {
            System.out.println("Valor inválido");
        } else {
            dinheiro += valor;
            System.out.println("Foi depositado R$" + valor);
        }
    }

    // Método sobrecarregado
    void depositar(Double valor, Double desconto) {
        if (quebrado) {
            System.out.println("O cofrinho já está quebrado");
        } else if (valor <= 0) {
            System.out.println("Valor inválido");
        } else {
            dinheiro += (valor - desconto);
            System.out.println("Foi depositado R$" + valor);
        }
    }

    Double agitar() {
        if (quebrado) {
            System.out.println("O cofrinho já está quebrado");
            return null;
        }

        Double numeroAleatorio = ThreadLocalRandom.current().nextDouble(0.0, dinheiro);
        System.out.println("Número retirado: " + numeroAleatorio);
        dinheiro -= numeroAleatorio;
        return numeroAleatorio;
    }

    Double quebrar() {
        Double valor = dinheiro;
        if (quebrado) {
            System.out.println("O cofrinho já está quebrado");
        } else {
            quebrado = true;
            System.out.println("O cofrinho tinha R$ " + dinheiro);
            dinheiro = 0.0;
        }
        return valor;
    }

    public String getMeta() {
        return meta;
    }

    public void setMeta(String meta) {
        this.meta = meta;
    }

    public Boolean getQuebrado() {
        return quebrado;
    }

    public Double getDinheiro() {
        return dinheiro;
    }
}