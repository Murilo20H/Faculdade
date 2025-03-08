package school.sptech.exemplo_banco;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/livros")
public class LivroController {
    @Autowired
    private LivroRepository repository;

    @PostMapping
    public Livro cadastrar(@RequestBody Livro livro) {
        return repository.save(livro);
    }

    @GetMapping
    public List<Livro> listar() {
        return repository.findAll();
    }

    @GetMapping("/{id}")
    public Livro buscarPorId(@PathVariable Integer id) {
        return repository.findById(id).orElse(null);
    }

    @PutMapping("/{id}")
    public Livro atualizar(@PathVariable Integer id, @RequestBody Livro livro) {
        if(repository.existsById(id)) {
            livro.setId(id);
            return repository.save(livro);
        } else {
            return null;
        }
    }

    @DeleteMapping("/{id}")
    public String atualizar(@PathVariable Integer id) {
        if(repository.existsById(id)) {
            repository.deleteById(id);
            return "Removido com sucesso!";
        } else {
            return "ID não encontrado";
        }
    }

    @GetMapping("/contagem")
    public Long contar() {
        return repository.count();
    }
}
