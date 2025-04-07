package vn.hoidanit.laptopshop.domain;

<<<<<<< HEAD
import java.io.Serializable;

=======
<<<<<<< HEAD
=======
import java.io.Serializable;

>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "order_detail")
<<<<<<< HEAD
public class OrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;
=======
<<<<<<< HEAD
public class OrderDetail {
=======
public class OrderDetail implements Serializable {

    private static final long serialVersionUID = 1L;
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private long quantity;
    private double price;

    // order_id: long
    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    // product_id: long
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

}
