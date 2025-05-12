package school.sptech.exemplo_curso.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import school.sptech.exemplo_curso.entity.Aluno;
import school.sptech.exemplo_curso.entity.Curso;
import school.sptech.exemplo_curso.exception.EntidadeNaoEncontradaException;
import school.sptech.exemplo_curso.repository.AlunoRepository;
import school.sptech.exemplo_curso.repository.CursoRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AlunoService {

    private final AlunoRepository alunoRepository;

    public Aluno cadastrar(Aluno aluno) {
        return alunoRepository.save(aluno);
    }

    public List<Aluno> buscarPorCursoNome(String nomeCurso) {
        return alunoRepository.findByCursoNomeContainingIgnoreCase(nomeCurso);
    }

    public Aluno buscarPorId(Integer id) {
        return alunoRepository.findById(id)
                .orElseThrow(() -> new EntidadeNaoEncontradaException("Aluno de id %d não encontrado".formatted(id)));
    }

    public List<Aluno> listar() {
        return alunoRepository.findAll();
    }

    public Aluno atualizar(Aluno aluno) {
        if (alunoRepository.existsById(aluno.getId())) {
            aluno.setId(aluno.getId());
            return alunoRepository.save(aluno);
        } else {
            throw new EntidadeNaoEncontradaException("Aluno de id %d não encontrado".formatted(aluno.getId()));
        }
    }

    public void removerPorId(Integer id) {
        if (alunoRepository.existsById(id)) {
            alunoRepository.deleteById(id);
        } else {
            throw new EntidadeNaoEncontradaException("Aluno de id %d não encontrado".formatted(id));
        }
    }
}
