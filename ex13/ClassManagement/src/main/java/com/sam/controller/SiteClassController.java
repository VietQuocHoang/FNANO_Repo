/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.controller;

import com.sam.entity.SiteClass;
import com.sam.entity.Student;
import com.sam.service.SiteClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author Luzec
 */
@Controller
@RequestMapping(value = "/siteclass")
public class SiteClassController {
    private static final Logger LOGGER = Logger.getLogger(SiteClassController.class.getName());

    @Autowired
    private SiteClassService siteClassService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {
        LOGGER.log(Level.INFO, "info:{0}");
        return new ModelAndView("/siteclass/index", "listClass", siteClassService.findAll());
    }

    @GetMapping(value = "/create")
    public ModelAndView create() {
        SiteClass siteClass = new SiteClass();
        return new ModelAndView("/siteclass/create", "siteClass", siteClass);
    }


    @GetMapping(value = "/details")
    public ModelAndView details(@RequestParam("id") long id) {
        SiteClass siteClass = siteClassService.findById(id);
        return new ModelAndView("/siteclass/details", "siteClass", siteClass);
    }

    @GetMapping(value = "/edit")
    public ModelAndView edit(@RequestParam("id") long id) {
        SiteClass siteClass = siteClassService.findById(id);
        return new ModelAndView("/siteclass/edit", "siteClass", siteClass);
    }

    @PostMapping(value = "/create")
    public ModelAndView create(@Valid @ModelAttribute("siteClass") SiteClass siteClass, BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("/siteclass/create");
        }
        siteClassService.save(siteClass);
        return new ModelAndView("redirect:index");
    }

    @PostMapping(value = "/edit")
    public ModelAndView edit(@Valid @ModelAttribute("siteClass") SiteClass siteClass, BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("/siteclass/edit");
        }
        siteClassService.save(siteClass);
        return new ModelAndView("redirect:index");
    }

    @GetMapping(value = "/delete")
    public ModelAndView delete(@RequestParam("id") long id) {
        List<Student> studentList = siteClassService.findStudentBySiteClassId(id);
        if (studentList != null && studentList.isEmpty()) {
            siteClassService.remove(id);
        }
        return new ModelAndView("redirect:index");
    }
}
