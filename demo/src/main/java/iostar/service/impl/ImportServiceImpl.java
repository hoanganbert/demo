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
public class ImportServiceImpl implements ImportService {
    @Autowired private ImportRepository importRepository;

    public Page<Import> findAll(Pageable pageable) { return importRepository.findAll(pageable); }
    public List<Import> findAll(Sort sort) { return importRepository.findAll(sort); }
    public List<Import> findAllById(Iterable<Integer> ids) { return importRepository.findAllById(ids); }
    public Optional<Import> findById(Integer id) { return importRepository.findById(id); }
    public Import save(Import anImport) { return importRepository.save(anImport); }
    public void delete(Import anImport) { importRepository.delete(anImport); }
    public void deleteAll() { importRepository.deleteAll(); }
    public long count() { return importRepository.count(); }
}
