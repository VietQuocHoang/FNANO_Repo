package com.viethq.shoppingonline.repositories;

import com.viethq.shoppingonline.entities.User;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    User findByUsername(String username);

    List<User> findByUsernameNot(String username);

    @Query("Select u from User u where u.username like concat('%', lower(:username), '%') and u.role.id=:roleId and u.enabled=true")
    List<User> findByNameAndRoleAndSorting(@Param("username") String username, @Param("roleId") int roleId, Pageable pageable);

    @Query("Select count(u) from User u where u.username like concat('%', lower(:username), '%') and u.role.id=:roleId and u.enabled=true")
    int countByNameAndRoleAndSorting(@Param("username") String username, @Param("roleId") int roleId);

    @Query("Select u from User u where u.username like concat('%', lower(:username), '%') and u.enabled=true")
    List<User> findByNameAndSorting(@Param("username") String username, Pageable pageable);

    @Query("Select count(u) from User u where u.username like concat('%', lower(:username), '%') and u.enabled=true")
    int countByNameAndSorting(@Param("username") String username);


}
