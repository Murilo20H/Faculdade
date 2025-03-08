package school.sptech.exemplo_banco;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public interface LivroRepository extends JpaRepository<Livro, Integer> {}
