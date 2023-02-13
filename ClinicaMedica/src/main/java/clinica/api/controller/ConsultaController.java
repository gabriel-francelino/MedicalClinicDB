package clinica.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import clinica.api.entity.Consulta;
import clinica.api.service.ConsultaService;

import java.util.List;

@RestController
@RequestMapping("/api/consultas")
public class ConsultaController {
    private ConsultaService consultaService;

    @Autowired
    public ConsultaController(ConsultaService consultaService) {
        this.consultaService = consultaService;
    }

    @GetMapping
    public List<Consulta> findAll() {
        return consultaService.findAll();
    }
    @PostMapping
    public Consulta createConsulta(@RequestBody Consulta consulta) {
        return consultaService.save(consulta);
    }
    @PutMapping("/{id}")
    public ResponseEntity<Consulta> updateConsulta(@PathVariable(value = "id") int consultaId, @RequestBody Consulta consulta) {
        if(consultaService.findById(consultaId) == null) {
            return ResponseEntity.notFound().build();
        }
        consulta.setId(consultaId);
        Consulta updatedConsulta = consultaService.save(consulta);
        return ResponseEntity.ok(updatedConsulta);
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteConsulta(@PathVariable(value = "id") int consultaId) {
        Consulta consultaDeleted = consultaService.findById(consultaId);
        if(consultaDeleted == null) {
            return ResponseEntity.notFound().build();
        }
        consultaService.delete(consultaDeleted);
        return ResponseEntity.noContent().build();
    }
}
