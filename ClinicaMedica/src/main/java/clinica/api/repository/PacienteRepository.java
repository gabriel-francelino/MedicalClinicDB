package clinica.api.repository;

import org.springframework.data.repository.CrudRepository;
import clinica.api.entity.Paciente;

public interface PacienteRepository extends CrudRepository<Paciente, Integer> {
    public Paciente findById(int id);
}
