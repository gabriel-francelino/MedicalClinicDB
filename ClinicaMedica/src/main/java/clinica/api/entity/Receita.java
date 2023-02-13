package clinica.api.entity;

import jakarta.persistence.*;
import lombok.*;

@Data @Getter @Setter @NoArgsConstructor @ToString
@Entity
@Table(name = "receitas")
public class Receita {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private java.sql.Date data;
    private String descricao;
    private String medicamentos;
    @ManyToOne
    @JoinColumn(name = "paciente_id")
    private Paciente paciente;
    @ManyToOne
    @JoinColumn(name = "medico_id")
    private Medico medico;
}