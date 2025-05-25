package iostar.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import iostar.entity.*;

import java.util.List;
import java.util.Optional;
public interface CartService {
    Page<Cart> findAll(Pageable pageable);
    List<Cart> findAll(Sort sort);
    List<Cart> findAllById(Iterable<Integer> ids);
    Optional<Cart> findById(Integer id);
    Cart save(Cart cart);
    void delete(Cart cart);
    void deleteAll();
    long count();
}
