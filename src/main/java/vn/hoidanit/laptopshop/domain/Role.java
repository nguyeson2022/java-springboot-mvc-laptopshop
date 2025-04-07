package vn.hoidanit.laptopshop.domain;

<<<<<<< HEAD
import java.io.Serializable;
=======
<<<<<<< HEAD
=======
import java.io.Serializable;
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "roles")
<<<<<<< HEAD
public class Role implements Serializable {
    private static final long serialVersionUID = 1L;
=======
<<<<<<< HEAD
public class Role {
=======
public class Role implements Serializable {
    private static final long serialVersionUID = 1L;
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;

    private String description;

<<<<<<< HEAD
    // role - one => many - users . ctrl + k . press 's'
=======
<<<<<<< HEAD
    // role - one => many - users
=======
    // role - one => many - users . ctrl + k . press 's'
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
    @OneToMany(mappedBy = "role")
    private List<User> users;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Role [id=" + id + ", name=" + name + ", description=" + description + "]";
    }

}
