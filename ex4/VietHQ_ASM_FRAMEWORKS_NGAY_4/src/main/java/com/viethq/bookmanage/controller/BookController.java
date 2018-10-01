package com.viethq.bookmanage.controller;

import com.viethq.bookmanage.DAO.BookDAO;
import com.viethq.bookmanage.DTO.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    private BookDAO bookDAO;

    @Autowired
    public void setBookDAO(BookDAO bookDAO) {
        this.bookDAO = bookDAO;
    }

    public BookDAO getBookDAO() {
        return bookDAO;
    }

    @GetMapping("/index")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("/book/index");
        List<Book> bookList = bookDAO.findAll();
        mav.addObject("bookList", bookList);
        return mav;
    }

    @GetMapping("/create")
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView("/book/create");
        mav.addObject("book", new Book());
        return mav;
    }

    @PostMapping("/create")
    public ModelAndView create(@ModelAttribute("book") Book book, BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("error");
        }
        bookDAO.insert(book);
        return new ModelAndView("redirect:index");
    }

    @GetMapping("/edit")
    public ModelAndView edit(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView("/book/edit");
        Book book = bookDAO.findById(id);
        mav.addObject("book", book);
        return mav;
    }

    @PostMapping("/edit")
    public ModelAndView edit(@ModelAttribute("book") Book book, BindingResult result) {
        if (result.hasErrors()) {
            return new ModelAndView("error");
        }
        bookDAO.update(book);
        return new ModelAndView("redirect:index");
    }

    @GetMapping("/details")
    public ModelAndView details(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView("/book/details");
        Book book = bookDAO.findById(id);
        mav.addObject("book", book);
        return mav;
    }

    @GetMapping("/delete")
    public ModelAndView delete(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView("redirect:index");
        bookDAO.removeById(id);
        return mav;
    }
}
