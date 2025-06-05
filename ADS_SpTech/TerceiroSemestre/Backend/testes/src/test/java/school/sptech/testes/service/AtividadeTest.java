package school.sptech.testes.service;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class AtividadeTest {
    @Test
    @DisplayName("Deve receber arara e retornar true")
    void arara() {
        String input = "arara";
        Atividade atividade = new Atividade();
        boolean resultado = atividade.isPalindromo(input);
        assertTrue(resultado);
    }
    
    @Test
    @DisplayName("Deve receber arara e retornar true")
    void abc() {
        String input = "abc";
        Atividade atividade = new Atividade();
        boolean resultado = atividade.isPalindromo(input);
        assertFalse(resultado);
    }
}