package com.viethq.shoppingonline.model;

import org.springframework.web.multipart.MultipartFile;

public class FileModel {
    private MultipartFile multipartFile;

    public MultipartFile getMultipartFile() {
        return multipartFile;
    }

    public void setMultipartFile(MultipartFile multipartFile) {
        this.multipartFile = multipartFile;
    }
}
