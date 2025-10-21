package school.sptech.exemplo_clean_4b.infrastructure.persistence.jpa;

import school.sptech.exemplo_clean_4b.core.domain.Livro;

public class LivroEntityMapper {
    public static LivroEntity toEntity(Livro domain) {
        if (domain == null) return null;
        LivroEntity entity = new LivroEntity();
        entity.setIsbn(domain.getIsbn());
        entity.setTitulo(domain.getTitulo());
        return entity;
    }

    public static Livro toDomain(LivroEntity entity) {
        if (entity == null) return null;
        Livro domain = new Livro();
        domain.setIsbn(entity.getIsbn());
        domain.setTitulo(entity.getTitulo());
        domain.setId(entity.getId());
        return domain;
    }
}