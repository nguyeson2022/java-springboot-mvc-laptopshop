package vn.hoidanit.laptopshop.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Product;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
    Page<Product> findAll(Pageable page);

    Page<Product> findAll(Specification<Product> spec, Pageable page);

    @Query("SELECT DISTINCT p FROM Product p WHERE " +
            "LOWER(p.name) LIKE %:keyword% OR " +
            "LOWER(p.factory) LIKE %:keyword% OR " +
            "LOWER(p.target) LIKE %:keyword% OR " +
            "LOWER(p.shortDesc) LIKE %:keyword% OR " +
            "LOWER(p.keyword) LIKE %:keyword%")
    Page<Product> searchByKeyword(@Param("keyword") String keyword, Pageable pageable);

    @Query("SELECT DISTINCT p FROM Product p WHERE " +
            "(:keyword IS NULL OR (" +
            "LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(p.factory) LIKE LOWER(CONCAT('%', :searchFactory, '%')) OR " +
            "LOWER(p.target) LIKE LOWER(CONCAT('%', :searchTarget, '%'))" +
            ")) AND " +
            "(:minPrice IS NULL OR p.price >= :minPrice) AND " +
            "(:maxPrice IS NULL OR p.price <= :maxPrice)")
    Page<Product> searchProducts(
            @Param("keyword") String keyword,
            @Param("searchFactory") String searchFactory,
            @Param("searchTarget") String searchTarget,
            @Param("minPrice") Double minPrice,
            @Param("maxPrice") Double maxPrice,
            Pageable pageable);
}
