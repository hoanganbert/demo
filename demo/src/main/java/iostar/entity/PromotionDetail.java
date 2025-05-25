package iostar.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.*;

@Entity
@Table(name = "PromotionDetail")
@Data
@NoArgsConstructor
@IdClass(PromotionDetailId.class)
public class PromotionDetail {
    @Id
    @ManyToOne
    @JoinColumn(name = "id_promotion")
    private Promotion promotion;

    @Id
    @ManyToOne
    @JoinColumn(name = "id_product")
    private Product product;

    @Column(nullable = false)
    private int discountAmount;
}
