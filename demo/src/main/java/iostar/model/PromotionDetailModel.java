package iostar.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PromotionDetailModel implements Serializable {
    private int promotionId;
    private int productId;
    private int discountAmount;
}
