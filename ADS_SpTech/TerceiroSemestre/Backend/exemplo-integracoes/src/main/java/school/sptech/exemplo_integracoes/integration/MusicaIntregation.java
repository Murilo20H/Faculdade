package school.sptech.exemplo_integracoes.integration;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import school.sptech.exemplo_integracoes.dto.LogradouroResponseDto;
import school.sptech.exemplo_integracoes.dto.MusicaRequestDto;
import school.sptech.exemplo_integracoes.dto.MusicaResponseDto;

import java.util.List;

@FeignClient(name = "musicaIntegration",url = "${musica.url}")

public interface MusicaIntregation {

    @GetMapping("/{id}")
    MusicaResponseDto buscarPorId(@PathVariable String id);

    @GetMapping
    List<MusicaResponseDto> listagem();

    @PostMapping
    MusicaResponseDto criar(@RequestBody MusicaRequestDto dto);
}
