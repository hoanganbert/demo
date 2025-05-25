package iostar.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Objects;

@Data
@NoArgsConstructor
public class ImportDetailId implements Serializable {
    private int anImport;
    private int product;

    public ImportDetailId(int anImport, int product) {
        this.anImport = anImport;
        this.product = product;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ImportDetailId)) return false;
        ImportDetailId that = (ImportDetailId) o;
        return anImport == that.anImport && product == that.product;
    }

    @Override
    public int hashCode() {
        return Objects.hash(anImport, product);
    }
}
