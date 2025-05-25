package iostar.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import iostar.entity.*;
import iostar.repository.*;
import iostar.service.*;

import java.util.List;
import java.util.Optional;

@Service
public class PromotionServiceImpl implements PromotionService {
    @Autowired private PromotionRepository promotionRepository;

    public Page<Promotion> findAll(Pageable pageable) { return promotionRepository.findAll(pageable); }
    public List<Promotion> findAll(Sort sort) { return promotionRepository.findAll(sort); }
    public List<Promotion> findAllById(Iterable<Integer> ids) { return promotionRepository.findAllById(ids); }
    public Optional<Promotion> findById(Integer id) { return promotionRepository.findById(id); }
    public Promotion save(Promotion promotion) { return promotionRepository.save(promotion); }
    public void delete(Promotion promotion) { promotionRepository.delete(promotion); }
    public void deleteAll() { promotionRepository.deleteAll(); }
    public long count() { return promotionRepository.count(); }
    
    public int calculateDiscountAmount(float f) {
        if (f >= 2_000_000) {
            return 100_000;
        } else if (f >= 200_000) {
            return 10_000;
        }
        return 0;
    }
    
    public int applyPromotion(Product product, Promotion promotion) {
        if (promotion == null || !"ACTIVE".equalsIgnoreCase(promotion.getStatus())) {
            return 0; 
        }
        return calculateDiscountAmount(product.getPrice());
    }

}
