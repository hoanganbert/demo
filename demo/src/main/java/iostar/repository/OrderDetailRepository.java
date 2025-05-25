package iostar.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import iostar.entity.*;
@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, OrderDetailId> {
	List<OrderDetail> findByOrderId(Integer orderId);
}
