package school.sptech.exemplo_clean_4b.infrastructure.persistence.jpa;

import org.springframework.stereotype.Repository;
import school.sptech.exemplo_clean_4b.core.adapter.LivroGateway;
import school.sptech.exemplo_clean_4b.core.domain.Livro;

@Repository
public class LivroJpaAdapter implements LivroGateway {

    private final LivroJpaRepository repository;

    public LivroJpaAdapter(LivroJpaRepository repository) {
        this.repository = repository;
    }

    @Override
    public boolean existePorIsbn(String isbn) {
        return repository.existsByIsbn(isbn);
    }

    @Override
    public Livro cadastrar(Livro domain) {
        return LivroEntityMapper.toDomain(repository.save(LivroEntityMapper.toEntity(domain)));
    }
}
