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
            "(:keyword IS NULL OR " +
            "LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(p.factory) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(p.target) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(CONCAT(p.factory, ' ', p.target)) LIKE LOWER(CONCAT('%', :keyword, '%'))" +
            ") AND " +
            "(:minPrice IS NULL OR p.price >= :minPrice) AND " +
            "(:maxPrice IS NULL OR p.price <= :maxPrice)")
    Page<Product> searchProducts(
            @Param("keyword") String keyword,
            @Param("minPrice") Long minPrice,
            @Param("maxPrice") Long maxPrice,
            Pageable pageable);

    @Query("SELECT p FROM Product p WHERE " +
            "(p.factory = :factory OR p.target = :target) " +
            "AND p.id != :productId")
    Page<Product> findByFactoryOrTargetAndIdNot(
            @Param("factory") String factory,
            @Param("target") String target,
            @Param("productId") Long productId,
            Pageable pageable);
}
