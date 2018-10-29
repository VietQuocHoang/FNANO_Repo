package com.viethq.shoppingonline.services;

import com.viethq.shoppingonline.model.report.PieChart;
import com.viethq.shoppingonline.model.report.PieChartItem;
import com.viethq.shoppingonline.model.report.ProductLineChart;
import com.viethq.shoppingonline.model.report.ProductLineChartItem;
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

    public PieChart getProductAmountPerCategoryReport() {
        List<Object[]> objectList = productRepository.findProductAmountPerCategory();
        List<PieChartItem> modelList = new ArrayList<>();
        PieChartItem product;
        for (Object[] o : objectList) {
            product = new PieChartItem();
            product.fromObjects(o);
            modelList.add(product);
        }
        PieChart pieChart = new PieChart();
        pieChart.setModelList(modelList);
        return pieChart;
    }


    public PieChart getProductPerCategoryReport() {
        List<Object[]> objectList = productRepository.findProductPerCategory();
        List<PieChartItem> modelList = new ArrayList<>();
        PieChartItem product;
        for (Object[] o : objectList) {
            product = new PieChartItem();
            product.fromObjects(o);
            modelList.add(product);
        }
        PieChart pieChart = new PieChart();
        pieChart.setModelList(modelList);
        return pieChart;
    }

    public ProductLineChart getProductLineChartReport() {
        List<Object[]> objectList = productRepository.findProductMaxMinAvgByCategory();
        List<ProductLineChartItem> modelList = new ArrayList<>();
        ProductLineChartItem p;
        for (Object[] o : objectList) {
            p = new ProductLineChartItem();
            p.fromObject(o);
            modelList.add(p);
        }
        ProductLineChart lineChart = new ProductLineChart();
        lineChart.setModelList(modelList);
        return lineChart;
    }
}
