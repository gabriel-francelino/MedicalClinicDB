package clinica.api.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import clinica.api.entity.Paciente;
import clinica.api.repository.PacienteRepository;

import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@Service
public class PacienteService {
    private PacienteRepository pacienteRepository;

    public Paciente save(Paciente paciente) {
        return pacienteRepository.save(paciente);
    }
    public List<Paciente> findAll() {
        return (List<Paciente>)pacienteRepository.findAll();
    }
    public void delete(Paciente paciente) {
        pacienteRepository.delete(paciente);
    }
    public Paciente findById(int id) {
        return pacienteRepository.findById(id);
    }
}