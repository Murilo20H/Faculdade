package school.sptech.exemplo_clean_4b.core.adapter;

import school.sptech.exemplo_clean_4b.core.domain.Livro;

public interface LivroGateway {
    boolean existePorIsbn(String isbn);
    Livro cadastrar(Livro domain);
}
