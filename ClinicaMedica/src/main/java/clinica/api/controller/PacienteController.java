package clinica.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import clinica.api.entity.Paciente;
import clinica.api.service.PacienteService;

import java.util.List;

@RestController
@RequestMapping("/api/pacientes")
public class PacienteController {
    private PacienteService pacienteService;

    @Autowired
    public PacienteController(PacienteService pacienteService) {
        this.pacienteService = pacienteService;
    }

    @GetMapping
    public List<Paciente> findAll() {
        return pacienteService.findAll();
    }
    @GetMapping("/{id}")
    public Paciente findById(@PathVariable(value = "id") int pacienteId) {
        return pacienteService.findById(pacienteId);
    }
    @PostMapping
    public Paciente createPaciente(@RequestBody Paciente paciente) {
        return pacienteService.save(paciente);
    }
    @PutMapping("/{id}")
    public ResponseEntity<Paciente> updatePaciente(@PathVariable(value = "id") int pacienteId, @RequestBody Paciente paciente) {
        if(pacienteService.findById(pacienteId) == null) {
            return ResponseEntity.notFound().build();
        }
        paciente.setId(pacienteId);
        Paciente updatedPaciente = pacienteService.save(paciente);
        return ResponseEntity.ok(updatedPaciente);
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePaciente(@PathVariable(value = "id") int pacienteId) {
        Paciente pacienteDeleted = pacienteService.findById(pacienteId);
        if(pacienteDeleted == null) {
            return ResponseEntity.notFound().build();
        }
        pacienteService.delete(pacienteDeleted);
        return ResponseEntity.noContent().build();
    }
}
