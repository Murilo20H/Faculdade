package school.sptech.exemplo_curso.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import school.sptech.exemplo_curso.dto.CursoAtualizacaoDto;
import school.sptech.exemplo_curso.dto.CursoCadastroDto;
import school.sptech.exemplo_curso.dto.CursoListagemDto;
import school.sptech.exemplo_curso.dto.CursoMapper;
import school.sptech.exemplo_curso.entity.Aluno;
import school.sptech.exemplo_curso.entity.Curso;
import school.sptech.exemplo_curso.service.AlunoService;
import school.sptech.exemplo_curso.service.CursoService;

import java.util.List;

@RestController
@RequestMapping("/alunos")
@RequiredArgsConstructor
public class AlunoController {

    private final AlunoService alunoService;

    @GetMapping
    public ResponseEntity<List<Aluno>> listar() {
        List<Aluno> alunos = alunoService.listar();
        if (alunos.isEmpty()) return ResponseEntity.status(204).build();
        return ResponseEntity.status(200).body(alunos);
    }

    @GetMapping("/curso/nome")
    public ResponseEntity<List<Aluno>> listarPorCursoNome(@RequestParam String cursoNome) {
        List<Aluno> alunos = alunoService.buscarPorCursoNome(cursoNome);
        if (alunos.isEmpty()) return ResponseEntity.status(204).build();
        return ResponseEntity.status(200).body(alunos);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Aluno> listarPorId(@PathVariable Integer id) {
        Aluno aluno = alunoService.buscarPorId(id);
        return ResponseEntity.status(200).body(aluno);
    }

    @PostMapping
    public ResponseEntity<Aluno> cadastrar(@Valid @RequestBody Aluno aluno) {
        Aluno alunoSalvo = alunoService.cadastrar(aluno);
        return ResponseEntity.status(201).body(alunoSalvo);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Aluno> atualizar(@PathVariable Integer id, @Valid @RequestBody Aluno aluno) {
        Aluno alunoAtualizado = alunoService.atualizar(aluno);
        return ResponseEntity.status(200).body(alunoAtualizado);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> remover(@PathVariable Integer id) {
        alunoService.removerPorId(id);
        return ResponseEntity.status(204).build();
    }
}
