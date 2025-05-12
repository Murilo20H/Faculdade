package school.sptech.exemplo_paginacao.service.musica;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import school.sptech.exemplo_paginacao.entity.album.Album;
import school.sptech.exemplo_paginacao.entity.musica.Musica;
import school.sptech.exemplo_paginacao.entity.musica.MusicaRepository;
import school.sptech.exemplo_paginacao.exception.EntidadeNaoEncontradaException;
import school.sptech.exemplo_paginacao.service.album.AlbumService;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MusicaService {

    private final MusicaRepository musicaRepository;

    private final AlbumService albumService;

    public Musica cadastrar(Musica musica) {
        Album album = albumService.buscarPorId(musica.getAlbum().getId());
        musica.setAlbum(album);
        return musicaRepository.save(musica);
    }

    public List<Musica> listar() {
        return musicaRepository.findAll();
    }

    public Musica buscarPorId(Integer id) {
        return musicaRepository.findById(id)
                .orElseThrow(() -> new EntidadeNaoEncontradaException("Música não encontrado"));
    }

    public void removerPorId(Integer id) {
        if (!musicaRepository.existsById(id))
            throw new EntidadeNaoEncontradaException("Música não encontrado");
        musicaRepository.deleteById(id);
    }

    public Musica atualizar(Musica musica) {
        if (!musicaRepository.existsById(musica.getId()))
            throw new EntidadeNaoEncontradaException("Música não encontrado");
        return musicaRepository.save(musica);
    }
}
