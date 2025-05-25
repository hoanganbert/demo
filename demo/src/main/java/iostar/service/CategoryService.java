package iostar.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import iostar.entity.*;

import java.util.List;
import java.util.Optional;

public interface CategoryService {
    Page<Category> findAll(Pageable pageable);
    List<Category> findAll(Sort sort);
    List<Category> findAll();
    List<Category> findAllById(Iterable<Integer> ids);
    Optional<Category> findById(Integer id);
    Category save(Category category);
    void delete(Category category);
    void deleteAll();
    long count();
    
    List<Category> searchByIdOrName(String keyword);
    Page<Category> searchByKeyword(String keyword, Pageable pageable);
    
    boolean existsByName(String name);

}
