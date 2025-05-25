package iostar.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import iostar.entity.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

    @Query("SELECT o FROM Order o WHERE LOWER(o.user.fullname) LIKE LOWER(CONCAT('%', :fullname, '%'))")
    Page<Order> findByUserFullnameContainingIgnoreCase(@Param("fullname") String fullname, Pageable pageable);

}
