package school.sptech.exemplo_strategy.controller;

import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import school.sptech.exemplo_strategy.controller.dto.FreteRequestDto;
import school.sptech.exemplo_strategy.controller.dto.FreteResponseDto;
import school.sptech.exemplo_strategy.entity.Frete;
import school.sptech.exemplo_strategy.service.FreteService;

import java.util.List;

@RestController
@RequestMapping("/fretes")
public class FreteController {

    private final FreteService freteService;

    public FreteController(FreteService freteService) {
        this.freteService = freteService;
    }

    @PostMapping
    public ResponseEntity<FreteResponseDto> calcularFrete(@Valid @RequestBody FreteRequestDto request) {
        return ResponseEntity.status(201).body(FreteResponseDto.toResponse(freteService.registrarCotacao(FreteRequestDto.toEntity(request))));
    }

    @GetMapping
    public ResponseEntity<List<Frete>> listarFretes() {
        List<Frete> cotacoes = freteService.listarCotacoes();
        if (cotacoes.isEmpty()) return ResponseEntity.status(204).build();

        return ResponseEntity.status(200).body(cotacoes);
    }
}
