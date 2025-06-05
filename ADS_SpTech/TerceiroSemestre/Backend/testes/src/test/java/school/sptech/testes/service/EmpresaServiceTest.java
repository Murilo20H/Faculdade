package school.sptech.testes.service;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import school.sptech.testes.entity.Empresa;
import school.sptech.testes.exception.EntidadeNaoEncontradaException;
import school.sptech.testes.repository.EmpresaRepository;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@ExtendWith(MockitoExtension.class)
class EmpresaServiceTest {
    @InjectMocks
    private EmpresaService service;
    @Mock
    private EmpresaRepository repository;

    @Test
    @DisplayName("Listagem quando acionado deve retornar empresas")
    public void listagem() {
        List<Empresa> empresas = List.of(new Empresa(1L, "Arcos Dourados", "McDonalds", "12345678901234"), new Empresa(2L, "Teste1", "Teste1A", "12345678901232"), new Empresa(3L, "Teste2", "Teste2A", "12345678901231"));

        Mockito.when(repository.findAll()).thenReturn(empresas);

        var resposta = service.listagem();
        assertEquals(3, resposta.size());
        assertEquals(resposta, empresas);
    }

    @Test
    @DisplayName("Listagem quando acionado não deve retornar nenhuma empresa")
    public void listagemCom0() {
        Mockito.when(repository.findAll()).thenReturn(Collections.emptyList());
        assertTrue(service.listagem().isEmpty());
    }

    @Test
    @DisplayName("Buscar por id quando acionado deve retornar empresa")
    public void buscarPorId() {
        Long id = 1L;
        Optional<Empresa> empresa = Optional.of(new Empresa(id, "Arcos Dourados", "McDonalds", "12345678901234"));
        Mockito.when(repository.findById(Mockito.anyLong())).thenReturn(empresa);
        assertEquals(service.buscarPorId(id), empresa.get());
    }

    @Test
    @DisplayName("Buscar por id quando acionado deve lançar uma EntidadeNaoEncontradaException")
    public void buscarPorIdInvalido() {
        Long id = 1L;
        Mockito.when(repository.findById(id)).thenReturn(Optional.empty());
        assertThrows(EntidadeNaoEncontradaException.class, () -> service.buscarPorId(id));
    }

    @Test
    @DisplayName("Remover por id quando acionado deve remover a empresa")
    public void removerPorId() {
        Long id = 1L;

        Mockito.when(repository.existsById(Mockito.anyLong())).thenReturn(true);
        Mockito.doNothing().when(repository).deleteById(Mockito.anyLong());

        assertDoesNotThrow(() -> service.removerPorId(id));
        Mockito.verify(repository, Mockito.times(1)).existsById(Mockito.anyLong());
        Mockito.verify(repository, Mockito.times(1)).deleteById(Mockito.anyLong());
    }

    @Test
    @DisplayName("Remover por id quando acionado deve lançar uma EntidadeNaoEncontradaException")
    public void removerPorIdInvalido() {
        Long id = 1L;

        Mockito.when(repository.existsById(id)).thenReturn(false);

        assertThrows(EntidadeNaoEncontradaException.class, () -> service.removerPorId(id));
        Mockito.verify(repository, Mockito.times(1)).existsById(Mockito.anyLong());
        Mockito.verify(repository, Mockito.times(0)).deleteById(Mockito.anyLong());
    }
}