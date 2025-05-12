package school.sptech.exemplo_curso.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import school.sptech.exemplo_curso.entity.Curso;

public interface CursoRepository extends JpaRepository<Curso, Integer> {
    @Query("SELECT COALESCE(AVG(c.preco), 0) FROM Curso c")
    double buscarMedia();

    @Modifying
    @Transactional
    @Query("DELETE FROM Curso c WHERE c.preco < :preco")
    int removerComPrecoMenorQue(Double preco);
}
