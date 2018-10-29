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
        Home
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <c:import url="../fragments/common-css.jsp"/>
    <%--Home css--%>
    <link rel="stylesheet" href="<c:url value="/resources/css/home-index.css"/>">
</head>

<body class="">
<div class="wrapper ">
    <c:import url="../fragments/sidebar.jsp">
        <c:param name="position" value="home"/>
    </c:import>
    <div class="main-panel">
        <c:import url="../fragments/navbar.jsp">
            <c:param name="navbarBrand" value="Home"/>
            <c:param name="navbarUrl" value="/home"/>
        </c:import>
        <div class="content">
            <div class="container-fluid">
                <!-- your content here -->
                <div class="row">
                    <div class="col-md-12">
                        <form class="form-inline float-right" action="<c:url value="/home"/>" method="get">
                            <div class="col-md-4">
                                <select name="categoryId" class="form-control">
                                    <option value="">All category</option>
                                    <c:forEach items="${categoryList}" var="category">
                                        <option value="${category.id}" <c:if
                                                test="${categoryId==category.id}"> selected </c:if>  >${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-8">
                                <span class="bmd-form-group">
                                    <div class="input-group no-border">
                                        <input type="text" name="search" value="${search}" class="form-control"
                                               placeholder="Search...">
                                        <input type="hidden" name="page" value="${page}"/>
                                        <button type="submit" class="btn btn-white btn-round btn-just-icon">
                                            <i class="material-icons">search</i>
                                        </button>
                                    </div>
                                </span>
                            </div>
                        </form>
                    </div>

                </div>
                <div class="row">
                    <div class="thumbnail-card-container">
                        <c:forEach items="${productList}" var="product">
                            <div class="thumbnail-card">
                                <div class="thumbnail-card-img">
                                    <a href="<c:url value="/home/product/${product.id}" />">
                                        <c:choose>
                                            <c:when test="${not empty product.thumbnail}">
                                                <img src="<c:url value="/image/${product.id}/${product.thumbnail}"/>">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="<c:url value="/image/common/not-available.jpg"/>">
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                </div>
                                <div class="thumbnail-card-body">
                                    <div class="product-detail">
                                        <p class="product-category">${product.category.name}</p>
                                        <p class="product-name">${product.name}</p>
                                        <p class="product-price">$ ${product.price}</p>
                                    </div>
                                    <div class="product-action">
                                        <c:choose>
                                            <c:when test="${product.amount > 0}">
                                                <a href="<c:url value="/cart/order?productId=${product.id}&quantity=1"/>"
                                                   class="btn btn-just-icon btn-link btn-sm">
                                                    <i class="material-icons">add_shopping_cart</i>
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-danger">Sold out</span>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <c:choose>
                            <c:when test="${limit > 0 && page+1 > limit}">
                                <c:set var="nextPage" value="${limit}"/>
                            </c:when>
                            <c:when test="${limit == 0 && page+1 > limit}">
                                <c:set var="nextPage" value="0"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="nextPage" value="${page+1}"/>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${page-1 < 0}">
                                <c:set var="previousPage" value="0"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="previousPage" value="${page-1}"/>
                            </c:otherwise>
                        </c:choose>


                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a href="<c:url value="/home?search=${search}&page=${previousPage}&categoryId=${categoryId}"/>"
                                   class="page-link">
                                    <i class="material-icons">chevron_left</i>
                                </a>
                            </li>
                            <c:if test="${limit > 0}">
                                <c:forEach begin="0" end="${limit}" step="1" varStatus="status">
                                    <li class="page-item <c:if test="${page==status.index}">active</c:if>">
                                        <a class="page-link"
                                           href="<c:url value="/home?search=${search}&page=${status.index}&categoryId=${categoryId}"/>"> ${status.count} </a>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <li class="page-item">
                                <a href="<c:url value="/home?search=${search}&page=${nextPage}&categoryId=${categoryId}"/>"
                                   class="page-link">
                                    <i class="material-icons">chevron_right</i>
                                </a>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
        </div>
        <c:import url="../fragments/footer.jsp"/>
    </div>
</div>
<c:import url="../fragments/common-js.jsp"/>
</body>

</html>