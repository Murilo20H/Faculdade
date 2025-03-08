package school.sptech.status_buscadores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/musicas")
public class MusicaController {
    @Autowired
    private MusicaRepository repository;

    @PostMapping
    public ResponseEntity<Musica> cadastrar(@RequestBody Musica musica) {
        return ResponseEntity.status(201).body(repository.save(musica));
    }

    @GetMapping
    public ResponseEntity<List<Musica>> listar() {
        List<Musica> musicas = repository.findAll();
        if (musicas.isEmpty()) return ResponseEntity.status(204).body(musicas);
        return ResponseEntity.status(200).body(repository.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Musica> buscarPorId(@PathVariable Integer id) {
        return ResponseEntity.of(repository.findById(id));
//        OUTRA FORMA:
//        Optional<Musica> musica = repository.findById(id);
//        return musica.isPresent() ? ResponseEntity.status(200).body(musica.get()) : ResponseEntity.status(404).build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<Musica> atualizar(@PathVariable Integer id, @RequestBody Musica musica) {
        if(repository.existsById(id)) {
            musica.setId(id);
            return ResponseEntity.status(200).body(repository.save(musica));
        }
        return ResponseEntity.status(404).build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletar(@PathVariable Integer id) {
        if(repository.existsById(id)) {
            repository.deleteById(id);
            return ResponseEntity.status(204).build();
        }
        return ResponseEntity.status(404).build();
    }

    @GetMapping("/titulo")
    public ResponseEntity<List<Musica>> pegarPorTitulo(@RequestParam String titulo) {
        List<Musica> musicas = repository.findByTituloContainingIgnoreCase(titulo);
        return musicas.isEmpty() ? ResponseEntity.status(204).build() : ResponseEntity.status(200).body(musicas);

//        OUTRA FORMA:
//        List<Musica> musicas = repository.findAll().stream().filter(musica ->
//                musica.getTitulo().toLowerCase().contains(titulo.toLowerCase())).toList();
//        return musicas.isEmpty() ? ResponseEntity.status(204).build() : ResponseEntity.status(200).body(musicas);


//        OUTRA FORMA:
//        List<Musica> musicas = repository.findAll();
//        List<Musica> musicasCertas = new ArrayList<>();
//        for (Musica musica : musicas) {
//            if (musica.getTitulo().toLowerCase().contains(titulo.toLowerCase())) {
//                musicasCertas.add(musica);
//            }
//        }
//
//        if(musicasCertas.isEmpty()) {
//            return ResponseEntity.status(204).build();
//        }
//        return ResponseEntity.status(200).body(musicasCertas);
    }

    @GetMapping("/recente")
    public ResponseEntity<Musica> pegarMaisRecente() {
        Musica musica = repository.findTopByOrderByDataLancamentoDesc();
        return musica == null ? ResponseEntity.status(204).build() : ResponseEntity.status(200).body(musica);
    }

    @GetMapping("/antes")
    public ResponseEntity<List<Musica>> pegarAntesData(@RequestParam LocalDate data) {
        List<Musica> musicas = repository.findByDataLancamentoLessThan(data );
        return musicas.isEmpty() ? ResponseEntity.status(204).build() : ResponseEntity.status(200).body(musicas);
    }
}
