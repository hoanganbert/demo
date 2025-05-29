package iostar.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.*;

@Entity
@Table(name = "Product")
@Data
@NoArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, length = 100)
    private String name;
    
    @Column(nullable = false, columnDefinition = "float default 0")
    private float price;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(nullable = false, length = 255)
    private String image;

    @ManyToOne
    @JoinColumn(name = "id_category", nullable = false)
    private Category category;

    @OneToMany(mappedBy = "product")
    private List<OrderDetail> orderDetail;

    @OneToMany(mappedBy = "product")
    private List<CartDetail> cartDetail;

    @OneToMany(mappedBy = "product")
    private List<ImportDetail> importDetail;

    @OneToMany(mappedBy = "product")
    private List<PromotionDetail> promotionDetail;

    // ⚠️ Không rely vào cascade để tránh lỗi product_id=null
    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY, orphanRemoval = true)
    private List<ProductVariant> variants = new ArrayList<>();
    
    public int getTotalStockQuantity() {
        return variants.stream().mapToInt(ProductVariant::getQuantity).sum();
    }
    
	public List<ProductVariant> getVariants() {
		return variants;
	}

	public void setVariants(List<ProductVariant> variants) {
		this.variants = variants;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
    public void addVariant(ProductVariant variant) {
        variant.setProduct(this); // 👈 Gán lại product cho variant
        variants.add(variant);
    }
}
