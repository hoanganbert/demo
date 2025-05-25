package iostar.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.*;

@Entity
@Table(name = "CartDetail")
@Data
@NoArgsConstructor
@IdClass(CartDetailId.class)
public class CartDetail {
    @Id
    @ManyToOne
    @JoinColumn(name = "id_cart")
    private Cart cart;

    @Id
    @ManyToOne
    @JoinColumn(name = "id_product")
    private Product product;

    @Column(nullable = false)
    private int quantity;
}