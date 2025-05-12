package school.sptech.exemplo_paginacao.controller.musica;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import school.sptech.exemplo_paginacao.controller.musica.dto.*;
import school.sptech.exemplo_paginacao.entity.musica.Musica;
import school.sptech.exemplo_paginacao.service.musica.MusicaService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/musicas")
public class MusicaController {

    private final MusicaService musicaService;

    @GetMapping
    public ResponseEntity<List<MusicaListagemDto>> listar() {
        List<Musica> listar = musicaService.listar();
        if (listar.isEmpty()) return ResponseEntity.noContent().build();
        return ResponseEntity.ok(MusicaMapper.toListagemDto(listar));
    }

    @GetMapping("/{id}")
    public ResponseEntity<MusicaPorIdDto> buscarPorId(@PathVariable Integer id) {
        return ResponseEntity.ok(MusicaMapper.toPorIdDto(musicaService.buscarPorId(id)));
    }

    @Value("${app.nome}")
    private String nomeDoApp;

    @PostMapping
    public ResponseEntity<MusicaPorIdDto> cadastrar(@RequestBody MusicaCadastroDto cadastroDto) {
        return ResponseEntity.status(201).body(MusicaMapper.toPorIdDto(
                musicaService.cadastrar(MusicaMapper.toEntity(cadastroDto))
        ));
    }

    @PutMapping("/{id}")
    public ResponseEntity<MusicaPorIdDto> atualizar(
            @PathVariable Integer id, @RequestBody MusicaAtualizacaoDto atualizacaoDto
    ) {
        return ResponseEntity.ok(MusicaMapper.toPorIdDto(
                musicaService.atualizar(MusicaMapper.toEntity(atualizacaoDto, id))
        ));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> remover(@PathVariable Integer id) {
        musicaService.removerPorId(id);
        return ResponseEntity.noContent().build();
    }
}
