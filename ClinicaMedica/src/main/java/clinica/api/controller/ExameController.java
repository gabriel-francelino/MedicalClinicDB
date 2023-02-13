package clinica.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import clinica.api.entity.Exame;
import clinica.api.service.ExameService;

import java.util.List;

@RestController
@RequestMapping("/api/exames")
public class ExameController {
    private ExameService exameService;

    @Autowired
    public ExameController(ExameService exameService) {
        this.exameService = exameService;
    }

    @GetMapping
    public List<Exame> findAll() {
        return exameService.findAll();
    }
    @PostMapping
    public Exame createExame(@RequestBody Exame exame) {
        return exameService.save(exame);
    }
    @PutMapping("/{id}")
    public ResponseEntity<Exame> updateExame(@PathVariable(value = "id") int exameId, @RequestBody Exame exame) {
        if(exameService.findById(exameId) == null) {
            return ResponseEntity.notFound().build();
        }
        exame.setId(exameId);
        Exame updatedExame = exameService.save(exame);
        return ResponseEntity.ok(updatedExame);
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteExame(@PathVariable(value = "id") int exameId) {
        Exame exameDeleted = exameService.findById(exameId);
        if(exameDeleted == null) {
            return ResponseEntity.notFound().build();
        }
        exameService.delete(exameDeleted);
        return ResponseEntity.noContent().build();
    }
}
