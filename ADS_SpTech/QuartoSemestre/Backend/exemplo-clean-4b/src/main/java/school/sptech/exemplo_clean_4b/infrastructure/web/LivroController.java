package school.sptech.exemplo_clean_4b.infrastructure.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import school.sptech.exemplo_clean_4b.core.application.command.CriarLivroCommand;
import school.sptech.exemplo_clean_4b.core.application.CriarLivroUseCase;
import school.sptech.exemplo_clean_4b.core.domain.Livro;

@RestController
@RequestMapping("/livros")
public class LivroController {

    private final CriarLivroUseCase criarLivroUseCase;


    public LivroController(CriarLivroUseCase criarLivroUseCase) {
        this.criarLivroUseCase = criarLivroUseCase;
    }

    @PostMapping
    ResponseEntity<Livro> cadastrar(@RequestBody CriarLivroCommand command) {
        return ResponseEntity.status(201).body(criarLivroUseCase.executar(command));
    }
}
