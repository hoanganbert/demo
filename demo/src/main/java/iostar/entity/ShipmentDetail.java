package iostar.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.*;

@Entity
@Table(name = "ShipmentDetail")
@Data
@NoArgsConstructor
@IdClass(ShipmentDetailId.class)
public class ShipmentDetail {
    @Id
    @OneToOne
    @JoinColumn(name = "id_order")
    private Order order;

    @Id
    @ManyToOne
    @JoinColumn(name = "id_shipment")
    private Shipment shipment;

    @Column(nullable = false)
    private Date date;
}
