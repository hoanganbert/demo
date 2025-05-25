package iostar.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Objects;

@Data
@NoArgsConstructor
public class CartDetailId implements Serializable {
    private int cart;
    private int product;

    public CartDetailId(int cart, int product) {
        this.cart = cart;
        this.product = product;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CartDetailId)) return false;
        CartDetailId that = (CartDetailId) o;
        return cart == that.cart && product == that.product;
    }

    @Override
    public int hashCode() {
        return Objects.hash(cart, product);
    }
}
