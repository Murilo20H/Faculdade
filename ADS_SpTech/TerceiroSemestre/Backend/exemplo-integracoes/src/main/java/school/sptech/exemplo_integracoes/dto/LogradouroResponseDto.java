package school.sptech.exemplo_integracoes.dto;

public record LogradouroResponseDto(
        String cep,
        String logradouro,
        String complemento,
        String unidade,
        String bairro,
        String localidade,
        String uf,
        String estado,
        String regiao
) {
}
