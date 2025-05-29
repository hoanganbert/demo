package iostar.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import iostar.entity.*;
@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
	@EntityGraph(attributePaths = "variants")
    Page<Product> findAll(Pageable pageable);

    @EntityGraph(attributePaths = "variants")
    Page<Product> findByNameContainingIgnoreCase(String keyword, Pageable pageable);

    @EntityGraph(attributePaths = "variants")
    Page<Product> findByCategory_Id(Integer categoryId, Pageable pageable);

    @EntityGraph(attributePaths = "variants")
    Page<Product> findByCategory_IdAndNameContainingIgnoreCase(Integer categoryId, String keyword, Pageable pageable);

	List<Product> findByCategoryId(Integer categoryId);
	
	@EntityGraph(attributePaths = {"variants"})
	@Query("SELECT p FROM Product p")
	List<Product> findAllWithVariants();
	
	@Query("SELECT p FROM Product p JOIN FETCH p.variants WHERE p.id IN :ids")
	List<Product> findAllWithVariantsByIdIn(List<Integer> ids);


}
