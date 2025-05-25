package iostar.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShipmentDetailModel implements Serializable {
    private int shipmentId;
    private int orderId;
    private Date date;
}
