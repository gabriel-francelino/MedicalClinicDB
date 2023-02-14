package clinica.api.entity;

import jakarta.persistence.*;
import lombok.*;

@Data @Getter @Setter @NoArgsConstructor @ToString
@Entity
@Table(name = "consultas")
public class Consulta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private java.sql.Timestamp dataHora;
    private String descricao;
    @ManyToOne
    @JoinColumn(name = "paciente_id")
    private Paciente paciente;
    @ManyToOne
    @JoinColumn(name = "medico_id")
    private Medico medico;
}
