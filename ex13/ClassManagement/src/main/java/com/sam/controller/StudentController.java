package com.sam.controller;

import com.sam.entity.SiteClass;
import com.sam.entity.Student;
import com.sam.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @GetMapping("/index")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("/student/index");
        List<Student> studentList = studentService.findAll();
        mav.addObject("studentList", studentList);
        return mav;
    }

    @GetMapping("/details")
    public ModelAndView details(@RequestParam("id") long id) {
        ModelAndView mav = new ModelAndView("/student/details");
        Student student = studentService.findById(id);
        mav.addObject("student", student);
        return mav;
    }

    @GetMapping("/edit")
    public ModelAndView edit(@RequestParam("id") long id) {
        ModelAndView mav = new ModelAndView("/student/edit");
        Student student = studentService.findById(id);
        List<SiteClass> siteClassList = studentService.findAllSiteClass();
        mav.addObject("siteClassList", siteClassList);
        mav.addObject("student", student);
        return mav;
    }

    @GetMapping("/create")
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView("/student/create");
        Student student = new Student();
        List<SiteClass> siteClassList = studentService.findAllSiteClass();
        mav.addObject("siteClassList", siteClassList);
        mav.addObject("student", student);
        return mav;
    }

    @PostMapping("/create")
    public ModelAndView create(@Valid @ModelAttribute Student student, BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("/student/create");
        }
        studentService.save(student);
        return new ModelAndView("redirect:index");
    }

    @PostMapping("/edit")
    public ModelAndView edit(@Valid @ModelAttribute Student student, BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("/student/edit");
        }
        studentService.save(student);
        return new ModelAndView("redirect:index");
    }

    @GetMapping("/delete")
    public ModelAndView delete(@RequestParam("id") long id) {
        studentService.remove(id);
        return new ModelAndView("redirect:index");
    }
}
