/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sam.service;

import com.sam.entity.SiteClass;
import com.sam.entity.Student;
import com.sam.repository.SiteClassRepository;
import com.sam.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author cattuan
 */
@Service
public class StudentService {
    @Autowired
    private StudentRepository studentRepository;
    @Autowired
    private SiteClassRepository siteClassRepository;

    public void remove(Long id) {
        studentRepository.delete(id);
    }

    public Student save(Student student) {
        return studentRepository.save(student);
    }

    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    public Student findById(long id) {
        return studentRepository.findOne(id);
    }

    public List<SiteClass> findAllSiteClass() {
        return siteClassRepository.findAll();
    }

}
