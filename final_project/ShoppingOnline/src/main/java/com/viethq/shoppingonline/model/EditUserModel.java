package com.viethq.shoppingonline.model;

import com.viethq.shoppingonline.entities.Role;
import com.viethq.shoppingonline.entities.User;
import org.hibernate.validator.constraints.NotEmpty;

public class EditUserModel {
    private int id;
    @NotEmpty
    private String username;
    @NotEmpty
    private String password;
    @NotEmpty
    private String reconfirmPassword;
    private boolean enabled = true;
    private int roleId;

    public EditUserModel() {
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

    public String getReconfirmPassword() {
        return reconfirmPassword;
    }

    public void setReconfirmPassword(String reconfirmPassword) {
        this.reconfirmPassword = reconfirmPassword;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public User toUser() {
        User user = new User();
        user.setId(id);
        user.setUsername(username);
        user.setPassword(password);
        user.encodePassword();
        user.setEnabled(enabled);
        Role role = new Role();
        role.setId(roleId);
        user.setRole(role);
        return user;
    }

    public void fromUser(User user) {
        setId(user.getId());
        setUsername(user.getUsername());
        setPassword("");
        setEnabled(user.isEnabled());
        setRoleId(user.getRole().getId());
    }
}
