package com.viethq.shoppingonline.model.report;

import java.util.ArrayList;
import java.util.List;

public class ProductLineChart {
    private List<ProductLineChartItem> modelList;

    public ProductLineChart() {
        modelList = new ArrayList<>();
    }

    public List<ProductLineChartItem> getModelList() {
        return modelList;
    }

    public void setModelList(List<ProductLineChartItem> modelList) {
        this.modelList = modelList;
    }
}
