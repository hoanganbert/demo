package iostar.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import iostar.entity.*;
import iostar.model.OrderDetailModel;
import iostar.model.OrderModel;
import iostar.repository.*;
import iostar.service.OrderService;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Autowired
    private ProductRepository productRepository;

    @Override
    public Page<Order> findAll(Pageable pageable) {
        return orderRepository.findAll(pageable);
    }

    @Override
    public List<Order> findAll(Sort sort) {
        return orderRepository.findAll(sort);
    }

    @Override
    public List<Order> findAllById(Iterable<Integer> ids) {
        return orderRepository.findAllById(ids);
    }

    @Override
    public java.util.Optional<Order> findById(Integer id) {
        return orderRepository.findById(id);
    }

    @Override
    public Order save(Order order) {
        return orderRepository.save(order);
    }

    @Override
    public void delete(Order order) {
        orderRepository.delete(order);
    }

    @Override
    public void deleteAll() {
        orderRepository.deleteAll();
    }

    @Override
    public long count() {
        return orderRepository.count();
    }

    @Override
    public Page<Order> getAllOrders(int page, String keyword) {
        Pageable pageable = PageRequest.of(page, 10, Sort.by("id").descending());
        if (keyword == null || keyword.trim().isEmpty()) {
            return orderRepository.findAll(pageable);
        } else {
            return orderRepository.findByUserFullnameContainingIgnoreCase(keyword, pageable);
        }
    }


    @Override
    public Order getOrderById(Integer id) {
        return orderRepository.findById(id).orElse(null);
    }

    @Override
    public void updateOrderStatus(Integer orderId, String status) {
        Order order = orderRepository.findById(orderId).orElse(null);
        if (order != null) {
            order.setStatus(status);
            orderRepository.save(order);
        }
    }

    @Override
    public List<OrderDetail> getOrderDetailsByOrderId(Integer orderId) {
        return orderDetailRepository.findByOrderId(orderId);
    }

    @Override
    public Order placeOrder(OrderModel orderModel, User user) {
        Order order = new Order();
        order.setUser(user);
        order.setStatus("Đang xử lý");
        order.setPayment_method(orderModel.getPaymentMethod());
        order.setAddress(orderModel.getAddress());

        float total = 0f;
        for (OrderDetailModel detailModel : orderModel.getOrderDetails()) {
            total += detailModel.getPrice() * detailModel.getQuantity();
        }
        order.setTotal_price(total);

        Order savedOrder = orderRepository.save(order);

        for (OrderDetailModel detailModel : orderModel.getOrderDetails()) {
            OrderDetail detail = new OrderDetail();
            detail.setOrder(savedOrder);

            Product product = productRepository.findById(detailModel.getProductId()).orElse(null);
            if (product == null) {
                throw new RuntimeException("Product không tồn tại với id = " + detailModel.getProductId());
            }
            detail.setProduct(product);
            detail.setQuantity(detailModel.getQuantity());
            detail.setPrice(detailModel.getPrice());

            orderDetailRepository.save(detail);
        }

        return savedOrder;
    }
}
