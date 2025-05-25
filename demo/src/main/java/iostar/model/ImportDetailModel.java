package iostar.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImportDetailModel implements Serializable {
    private int importId;
    private int productId;
    private int quantity;
    private float price;
}
