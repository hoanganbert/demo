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
public class ShipmentServiceImpl implements ShipmentService {
    @Autowired private ShipmentRepository shipmentRepository;

    public Page<Shipment> findAll(Pageable pageable) { return shipmentRepository.findAll(pageable); }
    public List<Shipment> findAll(Sort sort) { return shipmentRepository.findAll(sort); }
    public List<Shipment> findAllById(Iterable<Integer> ids) { return shipmentRepository.findAllById(ids); }
    public Optional<Shipment> findById(Integer id) { return shipmentRepository.findById(id); }
    public Shipment save(Shipment shipment) { return shipmentRepository.save(shipment); }
    public void delete(Shipment shipment) { shipmentRepository.delete(shipment); }
    public void deleteAll() { shipmentRepository.deleteAll(); }
    public long count() { return shipmentRepository.count(); }
}
