package com.viethq.shoppingonline.services;

import com.viethq.shoppingonline.entities.Role;
import com.viethq.shoppingonline.entities.User;
import com.viethq.shoppingonline.model.EditUserModel;
import com.viethq.shoppingonline.model.NewUserModel;
import com.viethq.shoppingonline.repositories.RoleRepository;
import com.viethq.shoppingonline.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
public class UserService {

    private int PER_PAGE = 5;

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

    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public List<User> findAllExceptSelf(Principal principal) {
        if (principal != null) {
            String username = principal.getName();
            return userRepository.findByUsernameNot(username);
        }
        return null;
    }

    public User save(User user) {
        user.encodePassword();
        return userRepository.save(user);
    }

    public void remove(int id) {
        userRepository.delete(id);
    }

    public User findById(int id) {
        return userRepository.findOne(id);
    }

    public List<User> index(Integer page, String search, Integer roleId) {
        if (page == null) {
            page = 0;
        }
        if (search == null) {
            search = "";
        }
        int maximumPage = getMaximumCount(page, search, roleId);
        if (page > maximumPage) {
            page = 0;
        }
        Sort sort = new Sort(Sort.Direction.ASC, "username");
        Pageable pageable = new PageRequest(page, PER_PAGE, sort);
        List<User> userList;

        if (roleId != null) {
            userList = userRepository.findByNameAndRoleAndSorting(search, roleId, pageable);
        } else {
            userList = userRepository.findByNameAndSorting(search, pageable);
        }

        return userList;
    }

    public int getMaximumCount(Integer page, String search, Integer roleId) {
        if (page == null) {
            page = 0;
        }
        if (search == null) {
            search = "";
        }
        int maximumCount;

        if (roleId != null) {
            maximumCount = userRepository.countByNameAndRoleAndSorting(search, roleId);
        } else {
            maximumCount = userRepository.countByNameAndSorting(search);
        }


        int maximumPage = (maximumCount / PER_PAGE) - 1;
        int remaining = maximumCount % PER_PAGE;
        if (remaining > 0) {
            maximumPage += 1;
        }
        return maximumPage;
    }

    public List<Role> findAllRole() {
        return roleRepository.findAll();
    }

    public void disableUser(int id) {
        User user = userRepository.findOne(id);
        user.setEnabled(false);
        userRepository.save(user);
    }

    public User saveUserModel(NewUserModel userModel) {
        User user = userModel.toUser();
        return userRepository.save(user);
    }

    public User saveUserModel(EditUserModel userModel) {
        User user = userModel.toUser();
        return userRepository.save(user);
    }
}
