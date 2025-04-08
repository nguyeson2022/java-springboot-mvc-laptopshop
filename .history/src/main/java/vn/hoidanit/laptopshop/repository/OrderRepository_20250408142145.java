package vn.hoidanit.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.User;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query("SELECT COUNT(o) FROM Order o WHERE o.status = :status")
    Long countByStatus(@Param("status") String status);

    List<Order> findByUser(User user);

    @Query("SELECT o FROM Order o WHERE YEAR(o.createdAt) = YEAR(:date) AND MONTH(o.createdAt) = MONTH(:date)")
    List<Order> findByCreatedAtMonth(@Param("date") LocalDate date);

    @Query("SELECT COALESCE(SUM(o.totalPrice), 0) FROM Order o " +
            "WHERE o.status = 'COMPLETE' " +
            "AND YEAR(o.createdAt) = YEAR(:date) " +
            "AND MONTH(o.createdAt) = MONTH(:date)")
    Double getMonthlyRevenue(@Param("date") LocalDate date);
}
