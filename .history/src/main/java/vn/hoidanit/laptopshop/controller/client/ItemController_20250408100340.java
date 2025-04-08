package vn.hoidanit.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.hoidanit.laptopshop.domain.Cart;
import vn.hoidanit.laptopshop.domain.CartDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.Product_;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.ProductCriteriaDTO;
import vn.hoidanit.laptopshop.service.ProductService;

@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        Product pr = this.productService.fetchProductById(id).get();
        model.addAttribute("product", pr);
        model.addAttribute("id", id);
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        long productId = id;
        String email = (String) session.getAttribute("email");

        this.productService.handleAddProductToCart(email, productId, session, 1);

        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        model.addAttribute("cart", cart);

        return "client/cart/show";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleRemoveCartDetail(cartDetailId, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("selectedItems") String selectedItems) {

        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        // Parse selected item IDs
        List<Long> selectedItemIds = new ArrayList<>();
        if (selectedItems != null && !selectedItems.isEmpty()) {
            String[] idStrings = selectedItems.split(",");
            for (String idStr : idStrings) {
                selectedItemIds.add(Long.parseLong(idStr));
            }
        }

        this.productService.handlePlaceOrder(currentUser, session, receiverName,
                receiverAddress, receiverPhone, selectedItemIds);

        return "redirect:/thanks";
    }

    @GetMapping("/thanks")
    public String getThankYouPage(Model model) {

        return "client/cart/thanks";
    }

    @PostMapping("/add-product-from-view-detail")
    public String handleAddProductFromViewDetail(
            @RequestParam("id") long id,
            @RequestParam("quantity") long quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session, quantity);
        return "redirect:/product/" + id;
    }

    @GetMapping("/products")
    public String getProductPage(Model model,
            ProductCriteriaDTO productCriteriaDTO,
            @RequestParam(required = false) String keyword,
            HttpServletRequest request) {

        // Xử lý keyword trước khi query
        if (keyword != null) {
            keyword = keyword.trim();
            if (!keyword.isEmpty()) {
                productCriteriaDTO.setKeyword(keyword);
            }
        }

        // Reset page về 1 khi có keyword mới
        int page = 1;
        String previousKeyword = (String) request.getSession().getAttribute("previousKeyword");
        if (keyword != null && !keyword.equals(previousKeyword)) {
            request.getSession().setAttribute("previousKeyword", keyword);
        } else {
            try {
                page = productCriteriaDTO.getPage().map(Integer::parseInt).orElse(1);
            } catch (Exception e) {
                // page defaults to 1
            }
        }

        // Cấu hình pageable với sort
        Pageable pageable = getConfiguredPageable(page, productCriteriaDTO);

        // Query sản phẩm
        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, productCriteriaDTO);
        List<Product> products = prs.hasContent() ? prs.getContent() : new ArrayList<>();

        // Build query string giữ nguyên các tham số
        String queryString = buildQueryString(request.getQueryString(), keyword);

        // Add attributes
        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", queryString);
        model.addAttribute("keyword", keyword);

        return "client/product/show";
    }

    private String buildQueryString(String originalQs, String keyword) {
        if (originalQs == null || originalQs.isBlank()) {
            return keyword != null && !keyword.isEmpty() ? "keyword=" + keyword : "";
        }

        // Remove page param
        String qs = originalQs.replaceAll("&?page=[0-9]+", "");

        // Add keyword if not exists
        if (keyword != null && !keyword.isEmpty() && !qs.contains("keyword=")) {
            qs += (qs.isEmpty() ? "" : "&") + "keyword=" + keyword;
        }

        return qs;
    }

    private Pageable getConfiguredPageable(int page, ProductCriteriaDTO criteria) {
        // Default page size
        int size = 12;

        // Default sort by ID descending if no sort criteria provided
        if (criteria.getSort().isEmpty()) {
            return PageRequest.of(page - 1, size, Sort.by(Sort.Direction.DESC, "id"));
        }

        // Get sort direction from criteria
        Sort.Direction direction = criteria.getSort()
                .map(sort -> sort.equalsIgnoreCase("asc") ? Sort.Direction.ASC : Sort.Direction.DESC)
                .orElse(Sort.Direction.DESC);

        // Create pageable with sort
        return PageRequest.of(page - 1, size, Sort.by(direction, "id"));
    }

}
