package clinica.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClinicaController {
    @GetMapping
    public String clinica() {
        return "index";
    }
}
