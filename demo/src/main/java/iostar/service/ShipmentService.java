package iostar.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import iostar.entity.*;

import java.util.List;
import java.util.Optional;
public interface ShipmentService {
    Page<Shipment> findAll(Pageable pageable);
    List<Shipment> findAll(Sort sort);
    List<Shipment> findAllById(Iterable<Integer> ids);
    Optional<Shipment> findById(Integer id);
    Shipment save(Shipment shipment);
    void delete(Shipment shipment);
    void deleteAll();
    long count();
}
