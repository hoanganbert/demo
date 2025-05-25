package iostar.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImportModel implements Serializable {
    private int id;
    private int staffId;
    private Date createdAt;
    private float totalPrice;
}
