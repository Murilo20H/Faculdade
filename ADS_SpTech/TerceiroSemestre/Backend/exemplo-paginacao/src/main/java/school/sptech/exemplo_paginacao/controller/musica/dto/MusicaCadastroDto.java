package school.sptech.exemplo_paginacao.controller.musica.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record MusicaCadastroDto(
        @NotBlank String nome,
        @NotNull Double duracao,
        @NotNull Integer idAlbum
) {
}
