package school.sptech.exemplo_clean_4b.infrastructure.persistence.jpa;

import org.springframework.data.jpa.repository.JpaRepository;

public interface LivroJpaRepository extends JpaRepository<LivroEntity, Integer  > {
    boolean existsByIsbn(String isbn);
}
