package school.sptech.exemplo_clean_4b.core.application;

import school.sptech.exemplo_clean_4b.core.adapter.LivroGateway;
import school.sptech.exemplo_clean_4b.core.application.command.CriarLivroCommand;
import school.sptech.exemplo_clean_4b.core.application.exception.DuplicidadeException;
import school.sptech.exemplo_clean_4b.core.domain.Livro;

public class CriarLivroUseCase {

    private final LivroGateway gateway;

    public CriarLivroUseCase(LivroGateway gateway) {
        this.gateway = gateway;
    }

    public Livro executar(CriarLivroCommand command) {
        if(gateway.existePorIsbn(command.isbn()))
            throw new DuplicidadeException("Isbn já existe na base");

        Livro livro = new Livro();
        livro.setIsbn(command.isbn());
        livro.setTitulo(command.titulo());

        return gateway.cadastrar(livro);
    }
}
