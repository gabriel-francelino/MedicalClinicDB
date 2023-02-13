package clinica.api.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import clinica.api.entity.Exame;
import clinica.api.repository.ExameRepository;

import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@Service
public class ExameService {
    private ExameRepository exameRepository;

    public Exame save(Exame exame) {
        return exameRepository.save(exame);
    }
    public List<Exame> findAll() {
        return (List<Exame>)exameRepository.findAll();
    }
    public void delete(Exame exame) {
        exameRepository.delete(exame);
    }
    public Exame findById(int id) {
        return exameRepository.findById(id);
    }
}
