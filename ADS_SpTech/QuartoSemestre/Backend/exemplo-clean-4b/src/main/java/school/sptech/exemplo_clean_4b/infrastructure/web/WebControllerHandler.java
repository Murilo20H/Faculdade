package school.sptech.exemplo_clean_4b.infrastructure.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import school.sptech.exemplo_clean_4b.core.application.exception.DuplicidadeException;

import java.util.Map;

@RestControllerAdvice
public class WebControllerHandler {

    @ExceptionHandler(DuplicidadeException.class)
    public ResponseEntity<Map<String, String>> duplicidadeHandler(DuplicidadeException exception) {
        return ResponseEntity.status(409).body(Map.of(
                "Error", "Mensagem de erro: %s".formatted(exception.getMessage())
        ));
    }

}
