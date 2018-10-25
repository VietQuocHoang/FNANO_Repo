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
    <title>Product Index</title>
    <c:import url="../common-css.jsp"/>
    <link href="<c:url value="/resources/vendor/bootstrap/css/shop-homepage.css"/>" rel="stylesheet">
    <style>
        .thumbnail-image {
            width: 50px;
            height: 50px !important;
        }
    </style>
</head>
<body>
<c:import url="../nav.jsp"/>
<!-- Page Content -->
<div class="container">

    <div class="row">
        <a href="<c:url value="/product/create"/>" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i> Add
            new</a>
        <form class="form-inline pull-right" action="${pageContext.request.contextPath}/home/index" method="get">
            <input type="hidden" name="page" value="${page}"/>
            <div class="form-group">
                <label>Name: </label>
                <input type="text" class="form-control" name="search" value="${search}" placeholder="Search"/>
            </div>
            <div class="form-group">
                <label>Category: </label>
                <select name="categoryId" class="form-control">
                    <option value="" <c:if test="${categoryId == null || categoryId == ''}">selected</c:if>>
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
    <div class="row">
        <table class="table table-bordered">
            <tr>
                <th class="col-md-1">ID</th>
                <th class="col-md-6">Name</th>
                <th class="col-md-1">Price</th>
                <th class="col-md-2">Thumbnail</th>
                <th class="col-md-2">Action</th>
            </tr>
            <c:forEach items="${productList}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>$ ${product.price}</td>
                    <td>
                        <c:choose>
                            <c:when test="${product.thumbnail != null && !product.thumbnail.equals('')}">
                                <img src="<c:url value="/image/${product.id}/${product.thumbnail}"/>"
                                     class="thumbnail-image">
                            </c:when>
                            <c:otherwise>
                                No thumbnail
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a class="btn btn-primary"
                           href="${pageContext.request.contextPath}/product/details?id=${product.id}"><i
                                class="glyphicon glyphicon-eye-open"></i></a>
                        <a class="btn btn-warning"
                           href="${pageContext.request.contextPath}/product/edit?id=${product.id}"><i
                                class="glyphicon glyphicon-edit"></i></a>
                        <a class="btn btn-danger"
                           href="${pageContext.request.contextPath}/product/delete?id=${product.id}"><i
                                class="glyphicon glyphicon-trash"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </div>
    <div class="row">
        <ul class="pager">
            <li>
                <a href="<c:if test="${page>0}">${pageContext.request.contextPath}/product/index?page=${page-1}&search=${search}&categoryId=${categoryId}</c:if>">Previous</a>
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
                <a href="<c:if test="${page<limit}">${pageContext.request.contextPath}/product/index?page=${page+1}&search=${search}&categoryId=${categoryId}</c:if>">Next</a>
            </li>
        </ul>
    </div>
</div>
<!-- /.container -->

<c:import url="../footer.jsp"/>
<!-- /.container -->
<c:import url="../common-js.jsp"/>
</body>
</html>
