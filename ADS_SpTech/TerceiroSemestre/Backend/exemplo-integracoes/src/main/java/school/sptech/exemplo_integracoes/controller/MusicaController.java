package school.sptech.exemplo_integracoes.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import school.sptech.exemplo_integracoes.dto.MusicaRequestDto;
import school.sptech.exemplo_integracoes.dto.MusicaResponseDto;
import school.sptech.exemplo_integracoes.service.MusicaService;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/musicas")
public class MusicaController {

    private final MusicaService service;

    @GetMapping("/{id}")
    public ResponseEntity<MusicaResponseDto> buscarPorId(@PathVariable String id) {
        return ResponseEntity.ok(service.buscarPorId(id));
    }

    @GetMapping
    public ResponseEntity<List<MusicaResponseDto>> listagem() {
        List<MusicaResponseDto> musicas = service.listagem();
        if (musicas.isEmpty()) return ResponseEntity.noContent().build();
        return ResponseEntity.ok(musicas);
    }

    @PostMapping
    public ResponseEntity<MusicaResponseDto> listagem(@RequestBody MusicaRequestDto dto) {
        return ResponseEntity.status(201).body(service.criar(dto));
    }
}
