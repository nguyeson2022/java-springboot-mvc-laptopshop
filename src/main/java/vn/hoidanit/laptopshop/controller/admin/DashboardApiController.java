package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/dashboard")
public class DashboardApiController {

    @Autowired
    private vn.hoidanit.laptopshop.service.OrderService orderService;

    @GetMapping("/revenue")
    public ResponseEntity<Map<String, Object>> getRevenueData() {
        Map<String, Object> response = new HashMap<>();
        List<Double> revenueData = orderService.getMonthlyRevenue();
        response.put("data", revenueData);
        return ResponseEntity.ok(response);
    }

    @GetMapping("/orders/status")
    public ResponseEntity<Map<String, Object>> getOrderStatusData() {
        Map<String, Object> response = new HashMap<>();
        List<Long> statusData = orderService.getOrderStatusStatistics();
        response.put("data", statusData);
        return ResponseEntity.ok(response);
    }
}