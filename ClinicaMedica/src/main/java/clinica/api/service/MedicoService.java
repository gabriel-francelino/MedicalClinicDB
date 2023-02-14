package clinica.api.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import clinica.api.entity.Medico;
import clinica.api.repository.MedicoRepository;

import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@Service
public class MedicoService {
    private final MedicoRepository medicoRepository;

    public Medico save(Medico medico) {
        return medicoRepository.save(medico);
    }
    public List<Medico> findAll() {
        return (List<Medico>)medicoRepository.findAll();
    }
    public void delete(Medico receita) {
        medicoRepository.delete(receita);
    }
    public Medico findById(int id) {
        return medicoRepository.findById(id);
    }
}