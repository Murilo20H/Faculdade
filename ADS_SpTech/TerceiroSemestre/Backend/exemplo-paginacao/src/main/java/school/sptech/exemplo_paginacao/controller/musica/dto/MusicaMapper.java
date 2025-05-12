package school.sptech.exemplo_paginacao.controller.musica.dto;

import org.springframework.data.domain.Page;
import school.sptech.exemplo_paginacao.controller.album.dto.AlbumMapper;
import school.sptech.exemplo_paginacao.entity.album.Album;
import school.sptech.exemplo_paginacao.entity.musica.Musica;

import java.util.List;

public class MusicaMapper {

    public static MusicaListagemDto toListagemDto(Musica entity) {
        if (entity == null) {
            return null;
        }
        return new MusicaListagemDto(
                entity.getId(), entity.getNome(), AlbumMapper.toListagemMusicaDto(entity.getAlbum())
        );
    }

    public static List<MusicaListagemDto> toListagemDto(List<Musica> entities) {
        if (entities == null) {
            return null;
        }
        return entities.stream()
                .map(MusicaMapper::toListagemDto)
                .toList();
    }

    public static List<MusicaListagemDto> toListagemDto(Page<Musica> entities) {
        if (entities == null) {
            return null;
        }
        return entities.stream()
                .map(MusicaMapper::toListagemDto)
                .toList();
    }

    public static MusicaPorIdDto toPorIdDto(Musica entity) {
        if (entity == null) {
            return null;
        }
        return new MusicaPorIdDto(
                entity.getId(),
                entity.getNome(),
                entity.getDuracao()
        );
    }

    public static Musica toEntity(MusicaCadastroDto dto) {
        if (dto == null) {
            return null;
        }
        return Musica.builder()
                .nome(dto.nome())
                .duracao(dto.duracao())
                .album(new Album(dto.idAlbum(), null, null, 0.0, null))
                .build();
    }

    public static Musica toEntity(MusicaAtualizacaoDto dto, int id) {
        if (dto == null) {
            return null;
        }
        return Musica.builder()
                .id(id)
                .nome(dto.nome())
                .duracao(dto.duracao())
                .build();
    }
}
