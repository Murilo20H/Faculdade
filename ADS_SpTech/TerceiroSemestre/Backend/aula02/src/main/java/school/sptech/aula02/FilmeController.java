package school.sptech.aula02;

import org.springframework.boot.autoconfigure.web.client.RestTemplateAutoConfiguration;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/filmes")
public class FilmeController {
    private final RestTemplateAutoConfiguration restTemplateAutoConfiguration;
    private List<Filme> filmes = new ArrayList<>();

    public FilmeController(List<Filme> filmes, RestTemplateAutoConfiguration restTemplateAutoConfiguration) {
        this.filmes = filmes;
        this.restTemplateAutoConfiguration = restTemplateAutoConfiguration;
    }

    @PostMapping
    public Filme get(@RequestBody Filme filme) {
        filmes.add(filme);
        return filme;
    }

    @GetMapping
    public List<Filme> listar() {
        return filmes;
    }

    @GetMapping("/{index}")
    public Filme buscarPorIndex(@PathVariable Integer index) {
        return index >= 0 && index < filmes.size() ? filmes.get(index) : null;
    }

    @PutMapping("/{index}")
    public Filme atualizar(@PathVariable Integer index, @RequestBody Filme filme) {
        if(index >= 0 && index < filmes.size()) {
            filmes.set(index, filme);
            return filme;
        }
        return null;
    }

    @DeleteMapping("/{index}")
    public String deletar(@PathVariable int index) {
        filmes.remove(index);
        return "Removido com sucesso";
    }
}
