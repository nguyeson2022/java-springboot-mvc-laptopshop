package vn.hoidanit.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vn.hoidanit.laptopshop.domain.User;
import java.util.List;

<<<<<<< HEAD
=======
<<<<<<< HEAD
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User hoidanit);
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
//crud: create, read, update, delete
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User eric);
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7

    void deleteById(long id);

    List<User> findOneByEmail(String email);

    List<User> findAll();

<<<<<<< HEAD
    User findById(long id); // null
=======
<<<<<<< HEAD
    User findById(long id);
=======
    User findById(long id); // null
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7

    boolean existsByEmail(String email);

    User findByEmail(String email);
<<<<<<< HEAD
=======
<<<<<<< HEAD

=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
}
