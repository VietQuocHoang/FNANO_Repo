package com.viethq.shoppingonline.services;

import com.viethq.shoppingonline.model.report.ProductPerCategoryItemModel;
import com.viethq.shoppingonline.model.report.ProductPerCategoryModel;
import com.viethq.shoppingonline.repositories.CategoryRepository;
import com.viethq.shoppingonline.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ReportService {

    private ProductRepository productRepository;
    private CategoryRepository categoryRepository;

    @Autowired
    public void setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Autowired
    public void setCategoryRepository(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public ProductPerCategoryModel getProductAmountPerCategoryReport() {
        List<Object[]> objectList = productRepository.findProductAmountPerCategory();
        List<ProductPerCategoryItemModel> modelList = new ArrayList<>();
        ProductPerCategoryItemModel product;
        for (Object[] o : objectList) {
            product = new ProductPerCategoryItemModel();
            product.fromObjects(o);
            modelList.add(product);
        }
        ProductPerCategoryModel productPerCategoryModel = new ProductPerCategoryModel();
        productPerCategoryModel.setModelList(modelList);
        return productPerCategoryModel;
    }


    public ProductPerCategoryModel getProductPerCategoryReport() {
        List<Object[]> objectList = productRepository.findProductPerCategory();
        List<ProductPerCategoryItemModel> modelList = new ArrayList<>();
        ProductPerCategoryItemModel product;
        for (Object[] o : objectList) {
            product = new ProductPerCategoryItemModel();
            product.fromObjects(o);
            modelList.add(product);
        }
        ProductPerCategoryModel productPerCategoryModel = new ProductPerCategoryModel();
        productPerCategoryModel.setModelList(modelList);
        return productPerCategoryModel;
    }

}
