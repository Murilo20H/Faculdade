package school.sptech.exemplo_integracoes.integration;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import school.sptech.exemplo_integracoes.dto.LogradouroResponseDto;

@FeignClient(name = "logradouroIntegration",url = "${logradouro.url}")

public interface LogradouroIntregation {

    @GetMapping("/{cep}/json")
    LogradouroResponseDto buscarPorCep(@PathVariable String cep);
}
