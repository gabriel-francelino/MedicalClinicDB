package clinica.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HistoricoController {
    // Histórico do paciente
    @GetMapping("/historico")
    public String historico() {
        return "historico";
    }
}
