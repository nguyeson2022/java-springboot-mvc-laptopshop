package vn.hoidanit.laptopshop.domain;

@Data
@NoArgsConstructor
public class SearchCriteria {
    private String brand;
    private String target;
    private Long minPrice;
    private Long maxPrice;
}