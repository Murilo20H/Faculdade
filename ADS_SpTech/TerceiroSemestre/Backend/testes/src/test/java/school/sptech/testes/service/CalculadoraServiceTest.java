package school.sptech.testes.service;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class CalculadoraServiceTest {
    @Test
    @DisplayName("Somar qdo acionado com os valores 2 e 2, deve retornar 4")
    void somarQuandoAcionadoComValoresValidosDeveRetornarCorretamente(){
         var input1 = 2.0;
         var input2 = 2.0;
         var resultadoEsperado = 4.0;
         CalculadoraService service = new CalculadoraService();
         double resposta = service.somar(input1, input2);
         assertEquals(resultadoEsperado, resposta);
    }

    @Test
    @DisplayName("Somar qdo acionado com os valores 20 e 12, deve retornar 4")
    void somarQuandoAcionadoComValoresValidosDeveRetornarCorretamente2(){
        var input1 = 20.0;
        var input2 = 12.0;
        var resultadoEsperado = 32.0;
        CalculadoraService service = new CalculadoraService();
        double resposta = service.somar(input1, input2);
        assertEquals(resultadoEsperado, resposta);
    }

    @Test
    @DisplayName("Somar qdo acionado com algum valor nulo deve lançar IllegalArgumentException")
    void lancarIllegalArgumentExceptionTest(){
        Double input1 = null;
        var input2 = 12.0;
        CalculadoraService service = new CalculadoraService();
        assertThrows(IllegalArgumentException.class, () -> service.somar(input1, input2));
    }
}