package school.sptech.primeira_aula;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/calculos")
public class CalculadoraController {
    private Integer contador = 0;

    @GetMapping("/somar/{numero1}/{numero2}") // endpoint != rota (node)
    public Integer somar(@PathVariable Integer numero1, @PathVariable Integer numero2) {
        return numero1 + numero2;
    }

    @GetMapping("/subtrair/{numero1}/{numero2}") // endpoint != rota (node)
    public Integer subtrair(@PathVariable Integer numero1, @PathVariable Integer numero2) {
        return numero1 - numero2;
    }

    @GetMapping("/contar") // endpoint != rota (node)
    public Integer contador() {
        return ++contador;
    }
}
