package iostar.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.*;

@Entity
@Table(name = "ImportDetail")
@Data
@NoArgsConstructor
@IdClass(ImportDetailId.class)
public class ImportDetail {
    @Id
    @ManyToOne
    @JoinColumn(name = "id_import")
    private Import anImport;

    @Id
    @ManyToOne
    @JoinColumn(name = "id_product")
    private Product product;

    @Column(nullable = false)
    private int quantity;

    @Column(nullable = false)
    private float price;
}
