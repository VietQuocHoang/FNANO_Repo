package com.viethq.shoppingonline.model.report;

import java.util.ArrayList;
import java.util.List;

public class ProductPerCategoryModel {
    List<ProductPerCategoryItemModel> modelList;

    public ProductPerCategoryModel() {
        modelList = new ArrayList<>();
    }

    public List<ProductPerCategoryItemModel> getModelList() {
        return modelList;
    }

    public void setModelList(List<ProductPerCategoryItemModel> modelList) {
        this.modelList = modelList;
    }
}
