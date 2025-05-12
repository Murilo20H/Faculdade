package school.sptech.exemplo_paginacao.controller.musica.dto;

import jakarta.validation.constraints.NotBlank;

public record MusicaAtualizacaoDto(
        @NotBlank String nome,
        @NotBlank Double duracao
) {
}
