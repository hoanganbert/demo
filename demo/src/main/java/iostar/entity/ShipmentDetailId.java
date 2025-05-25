package iostar.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Objects;

@Data
@NoArgsConstructor
public class ShipmentDetailId implements Serializable {
    private int order;
    private int shipment;

    public ShipmentDetailId(int order, int shipment) {
        this.order = order;
        this.shipment = shipment;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ShipmentDetailId)) return false;
        ShipmentDetailId that = (ShipmentDetailId) o;
        return order == that.order && shipment == that.shipment;
    }

    @Override
    public int hashCode() {
        return Objects.hash(order, shipment);
    }
}
