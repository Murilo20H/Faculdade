package school.sptech.testes.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import school.sptech.testes.entity.Empresa;
import school.sptech.testes.exception.EntidadeNaoEncontradaException;
import school.sptech.testes.repository.EmpresaRepository;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class EmpresaService {
    private final EmpresaRepository repository;

    public List<Empresa> listagem() {
        return repository.findAll();
    }

    public Empresa buscarPorId(Long id) {
        return repository.findById(id).orElseThrow(() ->
                new EntidadeNaoEncontradaException("Empresa com o ID %s não encontrado".formatted(id))
        );
//        Optional<Empresa> byId = repository.findById(id);
//        if (byId.isPresent()) return byId.get();
//        throw new EntidadeNaoEncontradaException("Empresa com o ID %s não encontrado".formatted(id));
    }

    public void removerPorId(Long id) {
        if (!repository.existsById(id))
            throw new EntidadeNaoEncontradaException("Empresa com o ID %s não encontrado".formatted(id));
        repository.deleteById(id);
    }

    public void criar(Empresa empresa) {
        if (!repository.existsByIdOrCnpj(empresa.getId(), empresa.getCnpj()))
            throw new EntidadeNaoEncontradaException("Empresa com o ID %s não encontrado".formatted(empresa.getId()));
        repository.save(empresa);
    } // TODO falta os testes

    public void atualizarPorId(Long id, Empresa novaEmpresa) {
        if (!repository.existsByCnpjAndIdNot(novaEmpresa.getCnpj(), id))
            throw new EntidadeNaoEncontradaException("Empresa com o ID %s não encontrado".formatted(novaEmpresa.getId()));
        novaEmpresa.setId(id);
        repository.save(novaEmpresa);
    } // TODO falta os testes
}
