package school.sptech.exemplo_paginacao.controller.musica.dto;

import school.sptech.exemplo_paginacao.controller.album.dto.AlbumMusicaListagemDto;

public record MusicaListagemDto(
        Integer id,
        String nome,
        AlbumMusicaListagemDto album
) {
}
