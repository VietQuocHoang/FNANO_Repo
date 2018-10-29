<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 18/10/2018
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>
        Product per category
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <c:import url="../fragments/common-css.jsp"/>
</head>

<body class="">
<div class="wrapper ">
    <c:import url="../fragments/sidebar.jsp">
        <c:param name="position" value="report"/>
    </c:import>
    <div class="main-panel">
        <c:import url="../fragments/navbar.jsp">
            <c:param name="navbarBrand" value="Report"/>
            <c:param name="navbarUrl" value="/report"/>
        </c:import>
        <div class="content">
            <div class="container-fluid">
                <!-- your content here -->
                <div class="row">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Products per category</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12 col-lg-6">
                                    <div id="product-amount-per-category-chart"></div>
                                </div>
                                <div class="col-md-12 col-lg-6">
                                    <div class="card">
                                        <div class="card-header card-header-primary">
                                            <h4 class="card-title">Product per category</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Category</th>
                                                        <th>Amount</th>
                                                    </tr>
                                                    <c:forEach varStatus="status"
                                                               items="${productAmountModel.modelList}" var="model">
                                                        <tr>
                                                            <td>${status.count}</td>
                                                            <td>${model.name}</td>
                                                            <td>${model.value}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Product lines per category</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12 col-lg-6">
                                    <div id="product-per-category-chart"></div>
                                </div>
                                <div class="col-md-12 col-lg-6">
                                    <div class="card">
                                        <div class="card-header card-header-primary">
                                            <h4 class="card-title">Product lines per category</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Category</th>
                                                        <th>No. of lines</th>
                                                    </tr>
                                                    <c:forEach varStatus="status"
                                                               items="${productModel.modelList}" var="model">
                                                        <tr>
                                                            <td>${status.count}</td>
                                                            <td>${model.name}</td>
                                                            <td>${model.value}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Max, min, average product price per category</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="max-min-avg-price-per-category"></div>
                                </div>
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header card-header-primary">
                                            <h4 class="card-title">Max, min, average product price per category</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Category</th>
                                                        <th>Max</th>
                                                        <th>Min</th>
                                                        <th>Avg</th>
                                                    </tr>
                                                    <c:forEach varStatus="status"
                                                               items="${minMaxAvgProduct.modelList}" var="model">
                                                        <tr>
                                                            <td>${status.count}</td>
                                                            <td>${model.name}</td>
                                                            <td>$ ${model.max}</td>
                                                            <td>$ ${model.min}</td>
                                                            <td>$ ${model.avg}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <c:import url="../fragments/footer.jsp"/>
    </div>
</div>
<c:import url="../fragments/common-js.jsp"/>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
    google.charts.load("current", {packages: ["corechart", "line"]});
    google.charts.setOnLoadCallback(drawProductAmountChart);
    google.charts.setOnLoadCallback(drawProductChart);
    google.charts.setOnLoadCallback(drawMaxMinAvgPriceChart);
    function drawProductAmountChart() {
        var data = google.visualization.arrayToDataTable([
            ['Category', 'Products'],
            <c:forEach items="${productAmountModel.modelList}" var="model">
            ["${model.name}", ${model.value}],
            </c:forEach>
        ]);

        var options = {
            title: 'Product per category',
            is3D: true,
            width: 400,
            height: 400
        };

        var chart = new google.visualization.PieChart(document.getElementById('product-amount-per-category-chart'));
        chart.draw(data, options);
    }

    function drawProductChart() {
        var data = google.visualization.arrayToDataTable([
            ['Category', 'Products'],
            <c:forEach items="${productModel.modelList}" var="model">
            ["${model.name}", ${model.value}],
            </c:forEach>
        ]);

        var options = {
            title: 'Product lines per category',
            is3D: true,
            width: 400,
            height: 400
        };

        var chart = new google.visualization.PieChart(document.getElementById('product-per-category-chart'));
        chart.draw(data, options);
    }

    function drawMaxMinAvgPriceChart() {
        var data = new google.visualization.DataTable();
        data.addColumn("string", "Category");
        data.addColumn('number', 'Max');
        data.addColumn('number', 'Min');
        data.addColumn('number', 'Average');

        data.addRows([
            <c:forEach items="${minMaxAvgProduct.modelList}" var="model">
            ["${model.name}", ${model.max}, ${model.min}, ${model.avg}],
            </c:forEach>
        ]);

        var options = {
            chart: {
                title: 'Max, min, average price per category',
            },
            width: 900,
            height: 500
        };

        var chart = new google.charts.Line(document.getElementById('max-min-avg-price-per-category'));

        chart.draw(data, google.charts.Line.convertOptions(options));
    }
</script>
</body>

</html>