package clinica.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RelatorioController {
    // Relatório do médico
    @GetMapping("/relatorio")
    public String relatorio() {
        return "relatorio";
    }
}
