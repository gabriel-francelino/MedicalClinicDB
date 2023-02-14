package clinica.api.controller;

import clinica.api.entity.MedicoRequest;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import clinica.api.entity.Medico;
import clinica.api.service.MedicoService;

import java.util.List;

@RestController
@RequestMapping("/api/medicos")
public class MedicoController {
    private MedicoService medicoService;

    @Autowired
    public MedicoController(MedicoService medicoService) {
        this.medicoService = medicoService;
    }

    @GetMapping
    public List<Medico> findAll() {
        return medicoService.findAll();
    }
    @GetMapping("/{id}")
    public Medico findById(@PathVariable(value = "id") int medicoId) {
        return medicoService.findById(medicoId);
    }
    @PostMapping
    public Medico createMedico(@RequestBody Medico medico) {
        System.out.println(medico);
        return medicoService.save(medico);
    }
    @PutMapping("/{id}")
    public ResponseEntity<Medico> updateMedico(@PathVariable(value = "id") int medicoId, @RequestBody MedicoRequest medico) {
        System.out.println(medico);
        System.out.println(medicoId);
        if(medicoService.findById(medicoId) == null) {
            return ResponseEntity.notFound().build();
        }
        Medico medico1 = new Medico();
        BeanUtils.copyProperties(medico, medico1);
        medico1.setId(medicoId);
        //medico.setId(medicoId);
        Medico updatedMedico = medicoService.save(medico1);

        return ResponseEntity.ok(updatedMedico);
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteMedico(@PathVariable(value = "id") int medicoId) {
        Medico medicoDeleted = medicoService.findById(medicoId);
        if(medicoDeleted == null) {
            return ResponseEntity.notFound().build();
        }
        medicoService.delete(medicoDeleted);
        return ResponseEntity.noContent().build();
    }
}
