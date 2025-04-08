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
            "LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(p.factory) LIKE LOWER(CONCAT('%', :searchFactory, '%')) OR " +
            "LOWER(p.target) LIKE LOWER(CONCAT('%', :searchTarget, '%')) OR " +
            "LOWER(CONCAT(p.factory, ' ', p.target)) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(CONCAT(p.factory, '-', p.target)) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "EXISTS (SELECT 1 FROM Product p2 WHERE p2.id = p.id AND " +
            "(:searchFactory IS NULL OR LOWER(p2.factory) LIKE LOWER(CONCAT('%', :searchFactory, '%'))) AND " +
            "(:searchTarget IS NULL OR LOWER(p2.target) LIKE LOWER(CONCAT('%', :searchTarget, '%'))))")
    Page<Product> searchProducts(
            @Param("keyword") String keyword,
            @Param("searchFactory") String searchFactory,
            @Param("searchTarget") String searchTarget,
            Pageable pageable);
}
