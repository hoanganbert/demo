package iostar.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import iostar.entity.*;

import java.util.List;
import java.util.Optional;
public interface PromotionService {
    Page<Promotion> findAll(Pageable pageable);
    List<Promotion> findAll(Sort sort);
    List<Promotion> findAllById(Iterable<Integer> ids);
    Optional<Promotion> findById(Integer id);
    Promotion save(Promotion promotion);
    void delete(Promotion promotion);
    void deleteAll();
    long count();
    
    int applyPromotion(Product product, Promotion promotion);

}
