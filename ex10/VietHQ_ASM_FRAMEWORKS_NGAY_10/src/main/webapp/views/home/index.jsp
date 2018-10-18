<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 29/09/2018
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home</title>
    <c:import url="../common-css.jsp"/>
    <link href="<c:url value="/resources/vendor/bootstrap/css/shop-homepage.css"/>" rel="stylesheet">
</head>
<body>
<c:import url="../nav.jsp"/>
<style>
    .slide-image {
        width: 800px;
        height: 300px !important;
    }

    .thumbnail-image {
        width: 320px;
        height: 150px !important;
    }
</style>
<!-- Page Content -->
<div class="container">

    <div class="row">

        <div class="col-md-3">
            <p class="lead">Filter</p>
            <div class="list-group">
                <form action="${pageContext.request.contextPath}/home/index" method="get">
                    <input type="hidden" name="page" value="${page}"/>
                    <div class="form-group">
                        <label>Name: </label>
                        <input type="text" class="form-control" name="search" value="${search}" placeholder="Search"/>
                    </div>
                    <div class="form-group">
                        <label>Category: </label>
                        <select name="categoryId" class="form-control">
                            <option value=""
                                    <c:if test="${categoryId == null || categoryId==category.id}">selected</c:if>>
                                All category
                            </option>
                            <c:forEach items="${categoryList}" var="category">
                                <option value="${category.id}"
                                        <c:if test="${categoryId==category.id}">selected</c:if>>${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-default">Search</button>
                </form>
            </div>
        </div>

        <div class="col-md-9">

            <div class="row carousel-holder">

                <div class="col-md-12">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <c:forEach items="${productList}" var="product" varStatus="status">
                                <li data-target="#carousel-example-generic" data-slide-to="${status.index}"
                                    <c:if test="${status.index==0}">class="active"</c:if> ></li>
                            </c:forEach>
                        </ol>
                        <div class="carousel-inner">
                            <c:forEach items="${productList}" var="product" varStatus="status">
                                <div class="item <c:if test='${status.index==0}'>active</c:if>">
                                    <img class="slide-image"
                                         src="<c:url value='/image/${product.id}/${product.thumbnail}'/>"
                                         alt="There is no thumbnail for this product">
                                </div>
                            </c:forEach>
                        </div>
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>

            </div>


            <div class="row">
                <c:forEach items="${productList}" var="product" varStatus="status">
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="<c:url value="/image/${product.id}/${product.thumbnail}"/>"
                                 class="thumbnail-image" alt="There is no thumbnail for this product">
                            <div class="caption">
                                <h4 class="pull-right">${product.price} $</h4>
                                <h4>
                                    <a href="${pageContext.request.contextPath}/home/details?id=${product.id}">${product.name}</a>
                                </h4>
                                <p>${product.description}</p>
                                <a class="btn btn-success pull-left"
                                   href="${pageContext.request.contextPath}/shop/order?productId=${product.id}&quantity=1"><i
                                        class="glyphicon glyphicon-shopping-cart"></i> Add </a>
                                <a class="btn btn-primary pull-right"
                                   href="${pageContext.request.contextPath}/home/details?id=${product.id}">Details</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="row">
                <ul class="pager">
                    <li>
                        <a href="<c:if test="${page>0}">${pageContext.request.contextPath}/home/index?page=${page-1}&search=${search}&categoryId=${categoryId}</c:if>">Previous</a>
                    </li>
                    <li>
                        <b>
                            <c:choose>
                                <c:when test="${page>limit}">0</c:when>
                                <c:otherwise>${page+1}</c:otherwise>
                            </c:choose>
                        </b>/${limit+1}
                    </li>
                    <li>
                        <a href="<c:if test="${page<limit}">${pageContext.request.contextPath}/home/index?page=${page+1}&search=${search}&categoryId=${categoryId}</c:if>">Next</a>
                    </li>
                </ul>
            </div>
        </div>

    </div>

</div>
<!-- /.container -->

<c:import url="../footer.jsp"/>
<!-- /.container -->
<c:import url="../common-js.jsp"/>
</body>
</html>
