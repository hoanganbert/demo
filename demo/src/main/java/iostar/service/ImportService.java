package iostar.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import iostar.entity.*;

import java.util.List;
import java.util.Optional;
public interface ImportService {
    Page<Import> findAll(Pageable pageable);
    List<Import> findAll(Sort sort);
    List<Import> findAllById(Iterable<Integer> ids);
    Optional<Import> findById(Integer id);
    Import save(Import anImport);
    void delete(Import anImport);
    void deleteAll();
    long count();
}
