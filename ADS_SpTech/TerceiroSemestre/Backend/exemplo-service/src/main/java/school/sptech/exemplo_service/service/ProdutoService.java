package school.sptech.exemplo_service.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import school.sptech.exemplo_service.entity.Produto;
import school.sptech.exemplo_service.exception.EntidadeConflitoException;
import school.sptech.exemplo_service.exception.EntidadeNaoEncontradaException;
import school.sptech.exemplo_service.repository.ProdutoRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ProdutoService {
    @Autowired
    private ProdutoRepository repository;

    public List<Produto> listar() {
        return repository.findAll();
    }

    public Produto buscarPorId(Integer id) {
        return repository.findById(id).orElseThrow(
                () -> new EntidadeNaoEncontradaException("Produto de id: %d não encontrado.".formatted(id))
        );
    }

    public Produto cadastrar(Produto produto) {
        if(repository.existsByCodigoIgnoreCase(produto.getCodigo()))
            throw new EntidadeConflitoException("Produto com codigo %s ja cadastrado.".formatted(produto.getCodigo()));

        return repository.save(produto);
    }

    public void deletar(Integer id) {
        if (!repository.existsById(id))
            throw new EntidadeNaoEncontradaException("Produto de id: %d não encontrado.".formatted(id));
        repository.deleteById(id);
    }
}
