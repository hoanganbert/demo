package iostar.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PromotionModel implements Serializable {
    private int id;
    private String name;
    private Date startDate;
    private Date endDate;
    private String status;
}
