package iostar.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Objects;

@Data
@NoArgsConstructor
public class PromotionDetailId implements Serializable {
    private int promotion;
    private int product;

    public PromotionDetailId(int promotion, int product) {
        this.promotion = promotion;
        this.product = product;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof PromotionDetailId)) return false;
        PromotionDetailId that = (PromotionDetailId) o;
        return promotion == that.promotion && product == that.product;
    }

    @Override
    public int hashCode() {
        return Objects.hash(promotion, product);
    }
}
