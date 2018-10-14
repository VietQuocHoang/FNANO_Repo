<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 14/10/2018
  Time: 00:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Your Cart</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/product/index">Back to index</a>
<h1>Your cart</h1>
<c:choose>
    <c:when test="${sessionScope.cart != null && !sessionScope.cart.cartItemList.isEmpty()}">
        <table>
            <tr>
                <th>ID</th>
                <th>Product name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${sessionScope.cart.cartItemList}" var="cartItem">
                <tr>
                    <td>${cartItem.productId}</td>
                    <td>${cartItem.product.name}</td>
                    <td>${cartItem.quantity}</td>
                    <td>${cartItem.product.price}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/shop/order?productId=${cartItem.productId}&quantity=1">+</a>
                        <a href="${pageContext.request.contextPath}/shop/order?productId=${cartItem.productId}&quantity=-1">-</a>
                        <a href="${pageContext.request.contextPath}/shop/remove?productId=${cartItem.productId}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="5">${sessionScope.cart.totalPrice}</td>
            </tr>
        </table>
    </c:when>
    <c:otherwise>
        Your cart is empty.
    </c:otherwise>
</c:choose>
</body>
</html>
