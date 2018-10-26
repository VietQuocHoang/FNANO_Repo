package com.viethq.shoppingonline.services;

import com.viethq.shoppingonline.entities.Role;
import com.viethq.shoppingonline.entities.User;
import com.viethq.shoppingonline.model.NewUserModel;
import com.viethq.shoppingonline.repositories.RoleRepository;
import com.viethq.shoppingonline.repositories.UserRepository;
import com.viethq.shoppingonline.utils.auth.RoleType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    private UserRepository userRepository;
    private RoleRepository roleRepository;

    @Autowired
    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Autowired
    public void setRoleRepository(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public User register(NewUserModel user) {
        User u = user.toUser();
        Role role = roleRepository.findByName(RoleType.USER);
        u.setRole(role);
        user.setEnabled(true);
        return userRepository.save(u);
    }

    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
