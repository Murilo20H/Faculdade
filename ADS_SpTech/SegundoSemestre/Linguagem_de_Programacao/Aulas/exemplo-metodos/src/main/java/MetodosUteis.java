public class MetodosUteis {

    //Metodo
    //  Retorno: esse é void, sem retorno
    //  nome: exibirUsuario
    //  argumentos: nomeUsuario
    //  corpo: faz um print com o nome
    void exibirUsuario(String nomeUsuario) {
        System.out.println("""
        *----------*----------*----------*----------*
                Usuario logado: %s
        *----------*----------*----------*----------*""".formatted(nomeUsuario));
    }

    Double somar(Double num01, Double num02) {
        return num01 + num02;
    }

}
