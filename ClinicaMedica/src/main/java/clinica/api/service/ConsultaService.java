package clinica.api.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import clinica.api.entity.Consulta;
import clinica.api.repository.ConsultaRepository;

import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@Service
public class ConsultaService {
    private final ConsultaRepository consultaRepository;

    public Consulta save(Consulta consulta) {
        return consultaRepository.save(consulta);
    }
    public List<Consulta> findAll() {
        return (List<Consulta>)consultaRepository.findAll();
    }
    public void delete(Consulta consulta) {
        consultaRepository.delete(consulta);
    }
    public Consulta findById(int id) {
        return consultaRepository.findById(id);
    }
}
