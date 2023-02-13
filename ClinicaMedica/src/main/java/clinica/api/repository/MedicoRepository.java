package clinica.api.repository;

import org.springframework.data.repository.CrudRepository;
import clinica.api.entity.Medico;

public interface MedicoRepository extends CrudRepository<Medico, Integer> {
    public Medico findById(int id);
}
