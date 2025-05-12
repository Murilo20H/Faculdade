package school.sptech.exemplo_paginacao.entity.musica;

import jakarta.persistence.*;
import lombok.*;
import school.sptech.exemplo_paginacao.entity.album.Album;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Musica {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String nome;
    private Double duracao;
    @ManyToOne
    @JoinColumn(name = "fk_album")
    private Album album;
}
