package com.viethq.studentmanage.controller;

import com.viethq.studentmanage.DAO.StudentDAO;
import com.viethq.studentmanage.DTO.Student;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {


    StudentDAO studentDAO;

    public StudentController() {
        studentDAO = new StudentDAO();
    }

    @GetMapping("/index")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("/student/index");
        List<Student> studentList = studentDAO.findAll();
        mav.addObject("studentList", studentList);
        return mav;
    }

    @GetMapping("/create")
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView("/student/create");
        mav.addObject("student", new Student());
        return mav;
    }

    @PostMapping("/create")
    public ModelAndView create(@ModelAttribute("student") Student student,
                               BindingResult br) {
        if (br.hasErrors()) {
            return new ModelAndView("error");
        }
        studentDAO.insert(student);
        ModelAndView mav = new ModelAndView("redirect:index");
        return mav;
    }

    @GetMapping("/details")
    public ModelAndView details(@RequestParam(value = "id", required = false) int id) {
        ModelAndView mav = new ModelAndView("/student/details");
        Student student = studentDAO.findById(id);
        mav.addObject("student", student);
        return mav;
    }

    @GetMapping("/edit")
    public ModelAndView edit(@RequestParam(value = "id", required = false) int id) {
        ModelAndView mav = new ModelAndView("/student/edit");
        Student student = studentDAO.findById(id);
        mav.addObject("student", student);
        return mav;
    }

    @PostMapping("/edit")
    public ModelAndView edit(@ModelAttribute("student") Student student,
                             BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("error");
        }
        studentDAO.update(student);
        return new ModelAndView("redirect:index");
    }

    @GetMapping("/delete")
    public ModelAndView delete(@RequestParam(value = "id", required = false) int id) {
        ModelAndView mav = new ModelAndView("redirect:index");
        studentDAO.removeById(id);
        return mav;
    }
}
