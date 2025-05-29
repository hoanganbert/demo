package iostar.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import iostar.entity.User;

import java.util.List;
import java.util.Optional;

public interface UserService {

    Optional<User> findByUsername(String username);
    Page<User> findAll(Pageable pageable);
    List<User> findAll(Sort sort);
    List<User> findAllById(Iterable<Integer> ids);
    Optional<User> findById(Integer id);
    User save(User user);
    void delete(User user);
    void deleteAll();
    long count();

}

