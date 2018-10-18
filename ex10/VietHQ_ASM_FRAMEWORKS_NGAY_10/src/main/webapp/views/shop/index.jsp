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
    </style>
</head>
<body>
<c:import url="../nav.jsp"/>
<!-- Page Content -->
<div class="container">

    <div class="row">
        <h1>Your cart</h1>
        <c:choose>
            <c:when test="${sessionScope.cart != null && !sessionScope.cart.cartItemList.isEmpty()}">
                <table class="table table-bordered">
                    <tr>
                        <th class="col-md-1">ID</th>
                        <th class="col-md-6">Product name</th>
                        <th class="col-md-1">Quantity</th>
                        <th class="col-md-1">Price</th>
                        <th class="col-md-2">Increase/Decrease</th>
                        <th class="col-md-1">Remove</th>
                    </tr>
                    <c:forEach items="${sessionScope.cart.cartItemList}" var="cartItem">
                        <tr>
                            <td>${cartItem.productId}</td>
                            <td>${cartItem.product.name}</td>
                            <td>${cartItem.quantity}</td>
                            <td>$ ${cartItem.product.price}</td>
                            <td>
                                <a class="btn btn-default"
                                   href="${pageContext.request.contextPath}/shop/order?productId=${cartItem.productId}&quantity=1">+</a>
                                <a class="btn btn-default"
                                   href="${pageContext.request.contextPath}/shop/order?productId=${cartItem.productId}&quantity=-1">-</a>
                            </td>
                            <td>
                                <a class="btn btn-danger"
                                   href="${pageContext.request.contextPath}/shop/remove?productId=${cartItem.productId}"><i
                                        class="glyphicon glyphicon-trash"></i> </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="4" class="text-right">Total price</td>
                        <td colspan="2"><b>$ ${sessionScope.cart.totalPrice}</b></td>
                    </tr>
                </table>
            </c:when>
            <c:otherwise>
                Your cart is empty.
            </c:otherwise>
        </c:choose>
    </div>

</div>
<!-- /.container -->

<c:import url="../footer.jsp"/>
<!-- /.container -->
<c:import url="../common-js.jsp"/>
</body>
</html>
