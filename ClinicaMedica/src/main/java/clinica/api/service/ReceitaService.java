package clinica.api.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import clinica.api.entity.Receita;
import clinica.api.repository.ReceitaRepository;

import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@Service
public class ReceitaService {
    private final ReceitaRepository receitaRepository;

    public Receita save(Receita receita) {
        return receitaRepository.save(receita);
    }
    public List<Receita> findAll() {
        return (List<Receita>)receitaRepository.findAll();
    }
    public void delete(Receita receita) {
        receitaRepository.delete(receita);
    }
    public Receita findById(int id) {
        return receitaRepository.findById(id);
    }
}