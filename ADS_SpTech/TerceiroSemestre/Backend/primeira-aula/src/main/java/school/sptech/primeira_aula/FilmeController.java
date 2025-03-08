package school.sptech.primeira_aula;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/filmes")
public class FilmeController {

    private List<Filme> filmes = new ArrayList<>();

    public FilmeController() {
        filmes.add(new Filme("Titanic", "James Cameron"));
        filmes.add(new Filme("Shrek 2", "Aderbal"));
        filmes.add(new Filme("Enrolados", "Epaminondas"));
    }

    @GetMapping("/{nomeFilme}")
    public String buscarFilme(@PathVariable String nomeFilme) {
        for (Filme filme : filmes) {
            if (filme.getNome().equalsIgnoreCase(nomeFilme)) {
                return "O filme %s existe na lista".formatted(filme.getNome());
            }
        }
        return "Não existe na lista";
    }

    @GetMapping
    public List<Filme> listar() {
        return filmes;
    }

    @GetMapping("/aleatorio")
    public Filme getFilmeAleatorio() {
        Filme filme = new Filme("Matrix", "Irmas....");
        return filme;
    }
}
