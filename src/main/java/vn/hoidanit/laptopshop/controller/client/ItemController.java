package vn.hoidanit.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;

<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
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
<<<<<<< HEAD
import vn.hoidanit.laptopshop.domain.Product_;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.ProductCriteriaDTO;
=======
<<<<<<< HEAD
import vn.hoidanit.laptopshop.domain.User;
=======
import vn.hoidanit.laptopshop.domain.Product_;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.ProductCriteriaDTO;
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
import vn.hoidanit.laptopshop.service.ProductService;

@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
<<<<<<< HEAD
=======
<<<<<<< HEAD

=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
    public String getProductPage(Model model, @PathVariable long id) {
        Product pr = this.productService.fetchProductById(id).get();
        model.addAttribute("product", pr);
        model.addAttribute("id", id);
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
<<<<<<< HEAD
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
=======
<<<<<<< HEAD

    public String addProductToCart(Model model, @PathVariable long id, HttpServletRequest request) {
=======
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
        HttpSession session = request.getSession(false);

        long productId = id;
        String email = (String) session.getAttribute("email");
<<<<<<< HEAD

        this.productService.handleAddProductToCart(email, productId, session, 1);

=======
<<<<<<< HEAD
        this.productService.handleAddProductToCart(email, productId, session, 1);
=======

        this.productService.handleAddProductToCart(email, productId, session, 1);

>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
<<<<<<< HEAD
        User currentUser = new User();// null
=======
<<<<<<< HEAD
        User currentUser = new User();
=======
        User currentUser = new User();// null
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

<<<<<<< HEAD
        Cart cart = this.productService.fetchByUser(currentUser);
=======
<<<<<<< HEAD
        Cart cart = this.productService.fecthByUser(currentUser);
=======
        Cart cart = this.productService.fetchByUser(currentUser);
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        model.addAttribute("cart", cart);
<<<<<<< HEAD

=======
<<<<<<< HEAD
=======

>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
        return "client/cart/show";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
<<<<<<< HEAD
=======
<<<<<<< HEAD
        // TODO: process POST request
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
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

<<<<<<< HEAD
        Cart cart = this.productService.fetchByUser(currentUser);
=======
<<<<<<< HEAD
        Cart cart = this.productService.fecthByUser(currentUser);
=======
        Cart cart = this.productService.fetchByUser(currentUser);
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7

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
<<<<<<< HEAD
=======
<<<<<<< HEAD
            @RequestParam("receiverPhone") String receiverPhone) {
        User currentUser = new User();// null
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("selectedItems") String selectedItems) {

        User currentUser = new User();
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

<<<<<<< HEAD
=======
<<<<<<< HEAD
        this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone);
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
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
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7

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

<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
    @GetMapping("/products")
    public String getProductPage(Model model,
            ProductCriteriaDTO productCriteriaDTO,
            HttpServletRequest request) {
        int page = 1;
        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                // convert from String to int
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
            // TODO: handle exception
        }

        // check sort price
        Pageable pageable = PageRequest.of(page - 1, 12);

        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 10, Sort.by(Product_.PRICE).descending());
            }
        }

        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, productCriteriaDTO);

        List<Product> products = prs.getContent().size() > 0 ? prs.getContent()
                : new ArrayList<Product>();

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            // remove page
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", qs);
        return "client/product/show";
    }

<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
}
