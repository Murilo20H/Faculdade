package school.sptech.exemplo_clean_4b.infrastructure.di;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import school.sptech.exemplo_clean_4b.core.application.CriarLivroUseCase;
import school.sptech.exemplo_clean_4b.infrastructure.persistence.jpa.LivroJpaAdapter;

@Configuration
public class LivroBeanConfig {

    @Bean
    public CriarLivroUseCase criarLivroUseCase(LivroJpaAdapter adapter) {
        return new CriarLivroUseCase(adapter);
    }
}
