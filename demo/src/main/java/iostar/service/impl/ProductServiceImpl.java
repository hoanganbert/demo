package iostar.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import iostar.entity.*;
import iostar.repository.*;
import iostar.service.*;
import jakarta.transaction.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
    @Autowired private ProductRepository productRepository;

    public Page<Product> findAll(Pageable pageable) { return productRepository.findAll(pageable); }
    public List<Product> findAll(Sort sort) { return productRepository.findAll(sort); }
    public List<Product> findAllById(Iterable<Integer> ids) { return productRepository.findAllById(ids); }
    public Optional<Product> findById(Integer id) { return productRepository.findById(id); }
    public Product save(Product product) { return productRepository.save(product); }
    public void delete(Product product) { productRepository.delete(product); }
    public void deleteAll() { productRepository.deleteAll(); }
    public long count() { return productRepository.count(); }
    
    @Override
    public Page<Product> findByKeyword(String keyword, Pageable pageable) {
        return productRepository.findByNameContainingIgnoreCase(keyword, pageable);
    }

    @Override
    public Page<Product> findByCategoryId(Integer categoryId, Pageable pageable) {
        return productRepository.findByCategory_Id(categoryId, pageable);
    }

    @Override
    public Page<Product> findByCategoryIdAndKeyword(Integer categoryId, String keyword, Pageable pageable) {
        return productRepository.findByCategory_IdAndNameContainingIgnoreCase(categoryId, keyword, pageable);
    }
    
    @Override
    public List<Product> findByCategoryId(Integer categoryId) {
        return productRepository.findByCategoryId(categoryId);
    }
    
    @Override
    public Page<Product> findAllWithVariants(Pageable pageable) {
        Page<Product> page = productRepository.findAll(pageable);
        fetchVariants(page.getContent());
        return page;
    }

    @Override
    public Page<Product> findByKeywordWithVariants(String keyword, Pageable pageable) {
        Page<Product> page = productRepository.findByNameContainingIgnoreCase(keyword, pageable);
        fetchVariants(page.getContent());
        return page;
    }

    @Override
    public Page<Product> findByCategoryIdWithVariants(Integer categoryId, Pageable pageable) {
        Page<Product> page = productRepository.findByCategory_Id(categoryId, pageable);
        fetchVariants(page.getContent());
        return page;
    }

    @Override
    public Page<Product> findByCategoryIdAndKeywordWithVariants(Integer categoryId, String keyword, Pageable pageable) {
        Page<Product> page = productRepository.findByCategory_IdAndNameContainingIgnoreCase(categoryId, keyword, pageable);
        fetchVariants(page.getContent());
        return page;
    }

    private void fetchVariants(List<Product> products) {
        if (products.isEmpty()) return;
        List<Integer> ids = products.stream().map(Product::getId).toList();
        List<Product> withVariants = productRepository.findAllWithVariantsByIdIn(ids);

        Map<Integer, Product> map = withVariants.stream()
                .collect(Collectors.toMap(Product::getId, p -> p));
        products.forEach(p -> {
            Product loaded = map.get(p.getId());
            if (loaded != null) {
                p.setVariants(loaded.getVariants());
            }
        });
    }
}
