package iostar.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import iostar.entity.*;
@Repository
public interface ShipmentRepository extends JpaRepository<Shipment, Integer> {}
