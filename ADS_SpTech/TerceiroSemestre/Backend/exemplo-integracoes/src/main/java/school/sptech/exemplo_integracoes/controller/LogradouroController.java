package school.sptech.exemplo_integracoes.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import school.sptech.exemplo_integracoes.dto.LogradouroResponseDto;
import school.sptech.exemplo_integracoes.service.LogradouroService;

@RestController
@RequiredArgsConstructor
@RequestMapping("/logradouros")
public class LogradouroController {

    private final LogradouroService service;

    @GetMapping("/{cep}")
    public ResponseEntity<LogradouroResponseDto> buscarPorCep(@PathVariable String cep) {
        return ResponseEntity.ok(service.buscarPorCep(cep));
    }
}
