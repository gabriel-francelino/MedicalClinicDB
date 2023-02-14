package clinica.api.entity;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Date;

@Getter @Setter @NoArgsConstructor @ToString
@Entity
@Table(name = "Exames")
public class Exame {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Date data;
    private String descricao;
    private String resultados;
    @ManyToOne
    @JoinColumn(name = "paciente_id")
    private Paciente paciente;
    @ManyToOne
    @JoinColumn(name = "medico_id")
    private Medico medico;
}