package sptech.school.exemplo_cache;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/jogos")
@RestController
public class JogoController {
    private JogoService service;

    public JogoController(JogoService service) {
        this.service = service;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Jogo> buscarPorId(@PathVariable int id) {
        long inicio = System.currentTimeMillis();
        Jogo jogo = service.buscarPorId(id);
        long fim = System.currentTimeMillis();
        System.out.println("Demorou " + (fim - inicio) + " Ms");
        return ResponseEntity.ok(jogo);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> removerPorId(@PathVariable int id) {
        service.removerPorId(id);
        return ResponseEntity.noContent().build();
    }
}
