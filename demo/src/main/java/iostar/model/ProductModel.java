package iostar.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductModel implements Serializable {
    private int id;
    private String name;
    private float price;
    private String description;
    private int stockQuantity;
    private String size;
    private String color;
    private String image;
    private int categoryId;
}
