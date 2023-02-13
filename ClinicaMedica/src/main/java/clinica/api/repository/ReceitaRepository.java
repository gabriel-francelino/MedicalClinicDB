package clinica.api.repository;

import org.springframework.data.repository.CrudRepository;
import clinica.api.entity.Receita;

public interface ReceitaRepository extends CrudRepository<Receita, Integer> {
    public Receita findById(int id);
}
