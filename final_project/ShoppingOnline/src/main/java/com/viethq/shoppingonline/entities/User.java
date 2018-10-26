package com.viethq.shoppingonline.entities;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "tblUser")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotNull
    @NotEmpty
    @Column(name = "username", unique = true, length = 45)
    private String username;

    @NotNull
    @NotEmpty
    @Column(name = "password")
    private String password;

    @Column(name = "enabled")
    private boolean enabled = true;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "role_id", nullable = false)
    private Role role;

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void encodePassword() {
        this.password = new BCryptPasswordEncoder().encode(password);
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
