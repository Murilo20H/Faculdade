package school.sptech.exemplo_curso.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
public class Aluno {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String ra;
    private String nome;

    @ManyToOne
    @JoinColumn(name = "curso_id")
    private Curso curso;
}
