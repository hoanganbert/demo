package iostar.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.*;

@Entity
@Table(name = "Import")
@Data
@NoArgsConstructor
public class Import {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "id_user", nullable = false)
    private User staff;

    @Column(nullable = false)
    private Date created_at;

    @Column(nullable = false)
    private float total_price;

    @OneToMany(mappedBy = "anImport")
    private List<ImportDetail> importDetail;
}