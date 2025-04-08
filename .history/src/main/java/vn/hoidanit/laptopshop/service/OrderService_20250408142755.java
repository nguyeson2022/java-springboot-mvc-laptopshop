package vn.hoidanit.laptopshop.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;
import vn.hoidanit.laptopshop.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(
            OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
    }

    public Page<Order> fetchAllOrders(Pageable page) {
        return this.orderRepository.findAll(page);
    }

    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void deleteOrderById(long id) {
        // delete order detail
        Optional<Order> orderOptional = this.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
        }

        this.orderRepository.deleteById(id);
    }

    public void updateOrder(Order order) {
        Optional<Order> orderOptional = this.fetchOrderById(order.getId());
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }

    public List<Order> fetchOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

    public List<Double> getMonthlyRevenue() {
        List<Double> monthlyRevenue = new ArrayList<>();
        int currentYear = LocalDate.now().getYear();

        for (int month = 1; month <= 12; month++) {
            LocalDate date = LocalDate.of(currentYear, month, 1);
            Double revenue = orderRepository.getMonthlyRevenue(date);

            // Null safety và làm tròn 2 chữ số thập phân
            if (revenue == null) {
                revenue = 0.0;
            }

            // Convert to millions and round to 2 decimal places
            revenue = Math.round((revenue / 1000000.0) * 100.0) / 100.0;

            monthlyRevenue.add(revenue);
        }

        return monthlyRevenue;
    }

    public List<Long> getOrderStatusStatistics() {
        List<Long> statusCounts = new ArrayList<>();

        // Count orders for each status: PENDING, PROCESSING, COMPLETED, CANCELLED
        Long pendingCount = orderRepository.countByStatus("PENDING");
        Long processingCount = orderRepository.countByStatus("PROCESSING");
        Long completedCount = orderRepository.countByStatus("COMPLETE");
        Long cancelledCount = orderRepository.countByStatus("CANCELLE");

        statusCounts.add(pendingCount);
        statusCounts.add(processingCount);
        statusCounts.add(completedCount);
        statusCounts.add(cancelledCount);

        return statusCounts;
    }

}
