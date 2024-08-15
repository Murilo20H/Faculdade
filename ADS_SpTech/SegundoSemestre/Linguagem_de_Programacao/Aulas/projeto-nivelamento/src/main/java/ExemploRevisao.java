public class ExemploRevisao {
    public static void main(String[] args) {
        //Tipos Wrapper = classes | com métodos | valor inicial = null
        String nome = "Bob da Silva";
        Integer idade = 42;
        Double altura = 1.55;
        Boolean bloqueado = false;

        //Tipos Primitivos = sem métodos | sempre tem valor inicial
        int idade2 = 42;
        boolean bloqueado2 = false;

        System.out.println("Meu nome é " + nome + " minha altura é " + altura + " e minha idade é " + idade);
        System.out.println("Meu nome é %s minha altura é %.2f e minha idade é %d".formatted(nome, altura, idade));
    }
}
