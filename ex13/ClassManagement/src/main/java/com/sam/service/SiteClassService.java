package com.sam.service;

import com.sam.entity.SiteClass;
import com.sam.entity.Student;
import com.sam.repository.SiteClassRepository;
import com.sam.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SiteClassService {

    @Autowired
    private SiteClassRepository siteClassRepository;

    @Autowired
    private StudentRepository studentRepository;


    public List<SiteClass> findAll() {
        return siteClassRepository.findAll();
    }

    public SiteClass findById(long id) {
        return siteClassRepository.findOne(id);
    }

    public void remove(long id) {
        siteClassRepository.delete(id);
    }

    public SiteClass save(SiteClass siteClass) {
        return siteClassRepository.save(siteClass);
    }


    public List<Student> findStudentBySiteClassId(long siteClassId) {
        return studentRepository.findBySiteClassId(siteClassId);
    }

}
