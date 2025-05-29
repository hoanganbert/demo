package iostar.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import iostar.entity.*;
import iostar.repository.*;
import iostar.service.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired 
    private CategoryRepository categoryRepository;

    @Override
    public Page<Category> findAll(Pageable pageable) {
        return categoryRepository.findAll(pageable);
    }

    @Override
    public List<Category> findAll(Sort sort) {
        return categoryRepository.findAll(sort);
    }

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public List<Category> findAllById(Iterable<Integer> ids) {
        return categoryRepository.findAllById(ids);
    }

    @Override
    public Optional<Category> findById(Integer id) {
        return categoryRepository.findById(id);
    }

    @Override
    public Category save(Category category) {
        return categoryRepository.save(category);
    }

    @Override
    public void delete(Category category) {
        categoryRepository.delete(category);
    }

    @Override
    public void deleteAll() {
        categoryRepository.deleteAll();
    }

    @Override
    public long count() {
        return categoryRepository.count();
    }
    
    @Override
    public List<Category> searchByIdOrName(String keyword) {
        try {
            int id = Integer.parseInt(keyword);
            Category c = categoryRepository.findById(id).orElse(null);
            return c != null ? List.of(c) : new ArrayList<>();
        } catch (NumberFormatException e) {
            return categoryRepository.findByNameContainingIgnoreCase(keyword);
        }
    }
    
    @Override
    public Page<Category> searchByKeyword(String keyword, Pageable pageable) {
        return categoryRepository.findByIdContainingOrNameContainingIgnoreCase(keyword, keyword, pageable);
    }
    
    @Override
    public boolean existsByName(String name) {
        return categoryRepository.existsByName(name);
    }
    
    @Override
    public boolean existsByNameIgnoreCase(String name) {
        return categoryRepository.existsByNameIgnoreCase(name);
    }

    @Override
    public boolean existsByNameIgnoreCaseExceptId(String name, Integer id) {
        Category existing = categoryRepository.findByNameIgnoreCase(name);
        return existing != null && existing.getId() != id;
    }
    


}
