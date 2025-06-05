package school.sptech.testes.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import school.sptech.testes.entity.Empresa;

public interface EmpresaRepository extends JpaRepository<Empresa, Long> {
    boolean existsByIdOrCnpj(Long id, String cnpj);
    boolean existsByCnpjAndIdNot(String cnpj, Long id);
}
