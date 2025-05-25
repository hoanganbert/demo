package iostar.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import iostar.entity.*;

import java.util.List;
import java.util.Optional;
public interface ProductService {
    Page<Product> findAll(Pageable pageable);
    List<Product> findAll(Sort sort);
    List<Product> findAllById(Iterable<Integer> ids);
    Optional<Product> findById(Integer id);
    Product save(Product product);
    void delete(Product product);
    void deleteAll();
    long count();
    
    Page<Product> findByKeyword(String keyword, Pageable pageable);
    Page<Product> findByCategoryId(Integer categoryId, Pageable pageable);
    Page<Product> findByCategoryIdAndKeyword(Integer categoryId, String keyword, Pageable pageable);

}
