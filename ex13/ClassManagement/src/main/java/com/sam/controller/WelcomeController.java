package com.sam.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.sam.entity.Student;
import com.sam.repository.SiteClassRepository;
import com.sam.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author cattuan
 */
@Controller
public class WelcomeController {
    private static final Logger LOGGER = Logger.getLogger(WelcomeController.class.getName());
    // inject via application.properties
    @Value("${welcome.message}")
    private String message;
    @Autowired
    private SiteClassRepository siteClassRepository;
    @Autowired
    private StudentRepository studentRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView m = new ModelAndView("home");
        m.addObject("listSiteClass", siteClassRepository.findAll());
//        siteClassRepository.
        return m;
    }

    @RequestMapping(value = "/add-student/{siteClassId}", method = RequestMethod.GET)
    public ModelAndView addStudent(@PathVariable Long siteClassId) {
        ModelAndView m = new ModelAndView("add-student");
        m.addObject("siteClass", siteClassRepository.findOne(siteClassId));
        m.addObject("studentForm", new Student());
        return m;
    }

    @RequestMapping(value = "/list-student/{siteClassId}", method = RequestMethod.GET)
    public ModelAndView listStudent(@PathVariable Long siteClassId) {
        ModelAndView m = new ModelAndView("list-student");
        LOGGER.log(Level.INFO, "siteClassId:{0}", siteClassId);
        m.addObject("listStudent", siteClassRepository.findOne(siteClassId).getListStudent());
        return m;
    }

    @RequestMapping(value = "/users", method = RequestMethod.POST)
    public String saveUser(@ModelAttribute("studentForm") Student studentForm) {
        LOGGER.log(Level.INFO, "name:{0}", studentForm.getFirstName() + studentForm.getLastName());
        studentRepository.save(studentForm);
        return "redirect:/";
    }
}
