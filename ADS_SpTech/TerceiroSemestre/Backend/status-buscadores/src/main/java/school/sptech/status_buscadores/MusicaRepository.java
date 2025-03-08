package school.sptech.status_buscadores;

import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface MusicaRepository extends JpaRepository<Musica, Integer> {
    List<Musica> findByTituloContainingIgnoreCase(String titulo);
    Musica findTopByOrderByDataLancamentoDesc();
    List<Musica> findByDataLancamentoLessThan(LocalDate data);
}
