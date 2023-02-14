package clinica.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import clinica.api.entity.Receita;
import clinica.api.service.ReceitaService;

import java.util.List;

@RestController
@RequestMapping("/api/receitas")
public class ReceitaController {
    private ReceitaService receitaService;

    @Autowired
    public ReceitaController(ReceitaService receitaService) {
        this.receitaService = receitaService;
    }

    @GetMapping
    public List<Receita> findAll() {
        return receitaService.findAll();
    }
    @PostMapping
    public Receita createReceita(@RequestBody Receita receita) {
        return receitaService.save(receita);
    }
    @PutMapping("/{id}")
    public ResponseEntity<Receita> updateReceita(@PathVariable(value = "id") int receitaId, @RequestBody Receita receita) {
        if(receitaService.findById(receitaId) == null) {
            return ResponseEntity.notFound().build();
        }
        receita.setId(receitaId);
        Receita updatedReceita = receitaService.save(receita);
        return ResponseEntity.ok(updatedReceita);
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteReceita(@PathVariable(value = "id") int receitaId) {
        Receita receitaDeleted = receitaService.findById(receitaId);
        if(receitaDeleted == null) {
            return ResponseEntity.notFound().build();
        }
        receitaService.delete(receitaDeleted);
        return ResponseEntity.noContent().build();
    }

}
