package com.viethq.shoppingonline.routes.controller;

import com.viethq.shoppingonline.entities.Role;
import com.viethq.shoppingonline.entities.User;
import com.viethq.shoppingonline.model.EditUserModel;
import com.viethq.shoppingonline.model.NewUserModel;
import com.viethq.shoppingonline.services.UserService;
import com.viethq.shoppingonline.utils.routes.URL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("")
    public ModelAndView index(@RequestParam(value = "page", required = false) Integer page,
                              @RequestParam(value = "search", required = false) String search,
                              @RequestParam(value = "roleId", required = false) Integer roleId) {

        int maximumPage = userService.getMaximumCount(page, search, roleId);
        List<User> userList = userService.index(page, search, roleId);
        List<Role> roleList = userService.findAllRole();

        if (page == null) {
            page = 0;
        }
        ModelAndView mav = new ModelAndView("/user/index");
        mav.addObject("userList", userList);
        mav.addObject("search", search);
        mav.addObject("limit", maximumPage);
        mav.addObject("page", page);
        mav.addObject("roleList", roleList);
        mav.addObject("roleId", roleId);
        return mav;
    }


    @GetMapping("/create")
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView("/user/create");
        List<Role> roleList = userService.findAllRole();
        NewUserModel newUserModel = new NewUserModel();
        mav.addObject("roleList", roleList);
        mav.addObject("user", newUserModel);
        return mav;
    }

    @PostMapping("/create")
    public ModelAndView create(@Valid @ModelAttribute("user") NewUserModel user, BindingResult result) {
        boolean error = false;
        if (result.hasErrors()) {
            error = true;
        }

        if (userService.findByUsername(user.getUsername()) != null) {
            result.rejectValue("username", "error.username", "An account already existed with this username");
            error = true;
        }

        if (!user.getPassword().equals(user.getReconfirmPassword())) {
            result.rejectValue("reconfirmPassword", "error.reconfirmPassword", "Retype password does not match");
            error = true;
        }

        if (error) {
            ModelAndView mav = new ModelAndView("/user/create");
            List<Role> roleList = userService.findAllRole();
            mav.addObject("roleList", roleList);
            return mav;
        }

        userService.saveUserModel(user);
        return new ModelAndView(URL.REDIRECT_USER);
    }

    @GetMapping("/{id}")
    public ModelAndView details(@PathVariable("id") int id) {
        ModelAndView mav = new ModelAndView("/user/details");
        User user = userService.findById(id);
        mav.addObject("user", user);
        return mav;
    }

    @GetMapping("/edit/{id}")
    public ModelAndView edit(@PathVariable("id") int id) {
        ModelAndView mav = new ModelAndView("/user/edit");
        User u = userService.findById(id);
        EditUserModel user = new EditUserModel();
        user.fromUser(u);
        List<Role> roleList = userService.findAllRole();
        mav.addObject("roleList", roleList);
        mav.addObject("user", user);
        return mav;
    }

    @PostMapping("/edit")
    public ModelAndView edit(@Valid @ModelAttribute("user") EditUserModel user, BindingResult result) {
        boolean error = false;
        if (result.hasErrors()) {
            error = true;
        }

        if (!user.getPassword().equals(user.getReconfirmPassword())) {
            result.rejectValue("reconfirmPassword", "error.reconfirmPassword", "Retype password does not match");
            error = true;
        }

        if (error) {
            ModelAndView mav = new ModelAndView("/user/edit");
            List<Role> roleList = userService.findAllRole();
            mav.addObject("roleList", roleList);
            return mav;
        }
        userService.saveUserModel(user);
        return new ModelAndView(URL.REDIRECT_USER);
    }
}
