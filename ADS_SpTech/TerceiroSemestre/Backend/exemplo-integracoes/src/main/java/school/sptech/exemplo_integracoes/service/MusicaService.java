package school.sptech.exemplo_integracoes.service;

import feign.FeignException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import school.sptech.exemplo_integracoes.dto.MusicaRequestDto;
import school.sptech.exemplo_integracoes.dto.MusicaResponseDto;
import school.sptech.exemplo_integracoes.integration.MusicaIntregation;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class MusicaService {

    private final MusicaIntregation intregation;

    public MusicaResponseDto buscarPorId(String id) {
        try {
            return intregation.buscarPorId(id);
        } catch (FeignException exception) {
            log.error("Erro ao consultar música {}", exception.getMessage());
            switch(exception.status()) {
                case 400:
                    throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
                case 404:
                    throw new ResponseStatusException(HttpStatus.NOT_FOUND);
                default:
                    throw new ResponseStatusException(HttpStatus.SERVICE_UNAVAILABLE);
            }
        }
    }

    public List<MusicaResponseDto> listagem() {
        try {
            return intregation.listagem();
        } catch (FeignException exception) {
            log.error("Erro ao listar: {}", exception.getMessage());
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }

    public MusicaResponseDto criar(MusicaRequestDto dto) {
        return intregation.criar(dto);
    }
}
