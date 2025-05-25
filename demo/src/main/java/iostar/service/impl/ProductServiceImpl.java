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
}
