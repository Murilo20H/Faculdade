package school.sptech.exemplo_adapter;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping
    public ResponseEntity<List<UsuarioResponseDto>> listarUsuarios() {
        List<Usuario> usuarios = usuarioService.listarUsuarios();
        if (usuarios.isEmpty()) return ResponseEntity.status(204).build();

        return ResponseEntity.status(200).body(usuarios.stream()
                .map(u -> UsuarioResponseDto.toResponse(u))
                .toList());
    }

    @PostMapping
    public ResponseEntity<UsuarioResponseDto> criarUsuario(@Valid @RequestBody UsuarioRequestDto usuarioRequest) {
        Usuario usuarioCriado = usuarioService.criarUsuario(UsuarioRequestDto.toEntity(usuarioRequest));

        return ResponseEntity.status(201).body(UsuarioResponseDto.toResponse(usuarioCriado));
    }

    @PostMapping("/login")
    public ResponseEntity<String> autenticarUsuario(@Valid @RequestBody LoginRequestDto dto) {
        if(usuarioService.validarUsuario(dto.getUsuario(), dto.getSenha()))
            return ResponseEntity.status(200).body("Usuário autenticado com sucesso!");

        return ResponseEntity.status(401).body("Usuário e/ou senha inválidos!");
    }
}
