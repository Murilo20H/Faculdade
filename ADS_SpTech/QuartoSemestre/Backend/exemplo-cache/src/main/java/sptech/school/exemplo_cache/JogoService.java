package sptech.school.exemplo_cache;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.Random;

@Service
public class JogoService {
    private final JogoRepository repository;

    public JogoService(JogoRepository repository) {
        this.repository = repository;
    }

    @Cacheable(cacheNames = "jogoPorId", key = "#id")
    public Jogo buscarPorId(int id) {
        simularLatencia();
        return repository.findById(id)
                .orElseThrow(() ->
                        new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @CacheEvict(cacheNames = "jogoPorId", key = "#id")
    public void removerPorId(int id) {
        if (!repository.existsById(id))
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        repository.deleteById(id);
    }

    private void simularLatencia() {
        Random random = new Random();
        int atraso = random.nextInt(3, 9);
        try {
            Thread.sleep(atraso * 1000L);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
