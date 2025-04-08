package vn.hoidanit.laptopshop.domain;

public class SearchCriteria {
    private String brand;
    private String target;
    private Long minPrice;
    private Long maxPrice;
}

    public SearchCriteria(String brand, String target, Long minPrice, Long maxPrice) {
        this.brand = brand;
        this.target = target;
        this.minPrice = minPrice;
        this.maxPrice = maxPrice;
    }

    // Getters and Setters
    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public Long getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Long minPrice) {
        this.minPrice = minPrice;
    }

    public Long getMaxPrice() {
        return maxPrice;
    }
}