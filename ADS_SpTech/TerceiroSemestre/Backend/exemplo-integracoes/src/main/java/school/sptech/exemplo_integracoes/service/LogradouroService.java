package school.sptech.exemplo_integracoes.service;

import feign.FeignException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import school.sptech.exemplo_integracoes.dto.LogradouroResponseDto;
import school.sptech.exemplo_integracoes.integration.LogradouroIntregation;

@Slf4j
@Service
@RequiredArgsConstructor
public class LogradouroService {

    private final LogradouroIntregation intregation;

    public LogradouroResponseDto buscarPorCep(String cep) {
        try {
            return intregation.buscarPorCep(cep);
        } catch (FeignException exception) {
            log.error("Erro ao consultar o cep: {}", exception.getMessage());
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
