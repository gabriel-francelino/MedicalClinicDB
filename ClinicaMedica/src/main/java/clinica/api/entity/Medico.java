package clinica.api.entity;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Time;

@Data @Getter @Setter @NoArgsConstructor @ToString
@Entity
@Table(name = "medicos")
public class Medico {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String nome;
    private String especialidade;
    private Time horarioInicio;
    private Time horarioFim;
}