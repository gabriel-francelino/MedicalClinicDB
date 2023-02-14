package clinica.api.entity;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Date;

@Getter @Setter @NoArgsConstructor @ToString
@Entity
@Table(name = "Pacientes")
public class Paciente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String nome;
    private Date dataNascimento;
    private String endereco;
    private String telefone;
}