package school.sptech.primeira_aula;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController // Anotação => controladora
public class FrasesController { // obj gerenciado pelo framework

    // localhost:8080 no browser
    @GetMapping("/saudacao") // endpoint != rota (node)
    public String saudacao() {
        return "Olá mundo!";
    }

    @GetMapping("/ola/{nome}") // => URI
    public String saudacao(@PathVariable String nome) {
        return "Olá %s".formatted(nome);
    }
}
