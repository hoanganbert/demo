package iostar.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import iostar.entity.*;
@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

	List<Category> findByNameContainingIgnoreCase(String name);
	Page<Category> findByIdContainingOrNameContainingIgnoreCase(String idKeyword, String nameKeyword, Pageable pageable);
	boolean existsByName(String name);
	
	boolean existsByNameIgnoreCase(String name);
	Category findByNameIgnoreCase(String name);

}
