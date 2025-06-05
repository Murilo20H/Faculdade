package school.sptech.testes.service;

public class Atividade {

    boolean isPalindromo(String texto) {
        for (int i = 1; i <= (texto.length() / 2); i++) {
            if (texto.charAt(i) != texto.charAt(texto.length() - i)) {
                return false;
            }
        }
        return true;
    }
}
