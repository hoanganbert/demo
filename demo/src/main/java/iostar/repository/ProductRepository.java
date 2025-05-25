package iostar.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import iostar.entity.*;
@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
	Page<Product> findByNameContainingIgnoreCase(String keyword, Pageable pageable);
	Page<Product> findByCategory_Id(Integer categoryId, Pageable pageable);
	Page<Product> findByCategory_IdAndNameContainingIgnoreCase(Integer categoryId, String keyword, Pageable pageable);

}
