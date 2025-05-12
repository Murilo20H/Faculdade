package school.sptech.exemplo_adapter;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class UsuarioService {
    private List<Usuario> usuarios = new ArrayList();

    public List<Usuario> listarUsuarios() {
        return usuarios;
    }

    public Usuario criarUsuario(Usuario usuario) {
        usuario.setId(UUID.randomUUID());
        usuarios.add(usuario);
        return usuario;
    }

    public boolean validarUsuario(String usuario, String senha) {
        for (Usuario usuarioDaVez : usuarios) {
            if(usuarioDaVez.isValido(usuario, senha)) {
                usuarioDaVez.setAutenticado(true);
                return true;
            }
        }
        return false;
    }
}
