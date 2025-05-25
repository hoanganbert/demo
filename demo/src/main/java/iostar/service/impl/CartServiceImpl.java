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
public class CartServiceImpl implements CartService {
    @Autowired private CartRepository cartRepository;

    public Page<Cart> findAll(Pageable pageable) { return cartRepository.findAll(pageable); }
    public List<Cart> findAll(Sort sort) { return cartRepository.findAll(sort); }
    public List<Cart> findAllById(Iterable<Integer> ids) { return cartRepository.findAllById(ids); }
    public Optional<Cart> findById(Integer id) { return cartRepository.findById(id); }
    public Cart save(Cart cart) { return cartRepository.save(cart); }
    public void delete(Cart cart) { cartRepository.delete(cart); }
    public void deleteAll() { cartRepository.deleteAll(); }
    public long count() { return cartRepository.count(); }
}
