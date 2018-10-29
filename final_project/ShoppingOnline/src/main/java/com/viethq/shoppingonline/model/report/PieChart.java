package com.viethq.shoppingonline.model.report;

import java.util.ArrayList;
import java.util.List;

public class PieChart {
    private List<PieChartItem> modelList;

    public PieChart() {
        modelList = new ArrayList<>();
    }

    public List<PieChartItem> getModelList() {
        return modelList;
    }

    public void setModelList(List<PieChartItem> modelList) {
        this.modelList = modelList;
    }
}
