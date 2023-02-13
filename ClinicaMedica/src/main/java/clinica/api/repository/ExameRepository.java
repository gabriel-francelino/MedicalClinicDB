package clinica.api.repository;

import org.springframework.data.repository.CrudRepository;
import clinica.api.entity.Exame;

public interface ExameRepository extends CrudRepository<Exame, Integer> {
    public Exame findById(int id);
}
