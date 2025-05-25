package iostar.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import iostar.entity.*;
import iostar.model.OrderModel;

import java.util.List;
import java.util.Optional;
public interface OrderService {
    Page<Order> findAll(Pageable pageable);
    List<Order> findAll(Sort sort);
    List<Order> findAllById(Iterable<Integer> ids);
    Optional<Order> findById(Integer id);
    Order save(Order order);
    void delete(Order order);
    void deleteAll();
    long count();
    
    Page<Order> getAllOrders(int page, String keyword);
    
    Order getOrderById(Integer id);
    void updateOrderStatus(Integer orderId, String status);
    List<OrderDetail> getOrderDetailsByOrderId(Integer orderId); 
    
    Order placeOrder(OrderModel orderModel, User user);

}
