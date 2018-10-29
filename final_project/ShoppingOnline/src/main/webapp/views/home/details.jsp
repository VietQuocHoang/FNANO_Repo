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
        ${product.name}
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <c:import url="../fragments/common-css.jsp"/>
    <%--Home Details CSS--%>
    <link rel="stylesheet" href="<c:url value="/resources/css/home-details.css"/>">
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
                    <div class="col-md-6 text-center">
                        <c:choose>
                            <c:when test="${not empty product.thumbnail}">
                                <img class="product-image"
                                     src="<c:url value="/image/${product.id}/${product.thumbnail}"/>">
                            </c:when>
                            <c:otherwise>
                                <img class="product-image" src="<c:url value="/image/common/not-available.jpg"/>">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">${product.name}</h4>
                                <p class="card-category">${product.category.name}</p>
                            </div>
                            <div class="card-body">
                                <p>${product.description}</p>
                                <br>
                                <p>$ ${product.price}</p>
                            </div>
                            <div class="card-footer">
                                <c:choose>
                                    <c:when test="${product.amount > 0}">
                                        <a class="btn btn-fill btn-primary"
                                           href="<c:url value="/cart/order?productId=${product.id}&quantity=1"/>">
                                            Add to cart
                                            <i class="material-icons">
                                                add_shopping_cart
                                            </i>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-danger">Sorry, we're out of stock</span>
                                    </c:otherwise>
                                </c:choose>
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
</body>

</html>