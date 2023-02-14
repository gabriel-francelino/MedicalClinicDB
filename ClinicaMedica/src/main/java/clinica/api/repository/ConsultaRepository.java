package clinica.api.repository;

import org.springframework.data.repository.CrudRepository;
import clinica.api.entity.Consulta;

public interface ConsultaRepository extends CrudRepository<Consulta, Integer> {
    public Consulta findById(int id);
}
