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
        My cart
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <c:import url="../fragments/common-css.jsp"/>
</head>

<body class="">
<div class="wrapper ">
    <c:import url="../fragments/sidebar.jsp">
        <c:param name="position" value="cart"/>
    </c:import>
    <div class="main-panel">
        <c:import url="../fragments/navbar.jsp">
            <c:param name="navbarBrand" value="My Cart"/>
            <c:param name="navbarUrl" value="/cart"/>
        </c:import>
        <div class="content">
            <div class="container-fluid">
                <!-- your content here -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">My cart</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <tr>
                                            <td colspan="2" class="text-center">Product</td>
                                            <td class="text-center">Price</td>
                                            <td colspan="2" class="text-center">Quantity</td>
                                            <td class="text-center">Amount</td>
                                            <td class="text-center"></td>
                                        </tr>
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.cart && not empty sessionScope.cart.cartItemList}">
                                                <c:forEach items="${sessionScope.cart.cartItemList}" var="cartItem">
                                                    <tr>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${not empty cartItem.product.thumbnail}">
                                                                    <img style="width:100px; height: 100px;"
                                                                         src="<c:url value="/image/${cartItem.product.id}/${cartItem.product.thumbnail}"/>">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img style="width:100px; height: 100px;"
                                                                         src="<c:url value="/image/common/not-available.jpg"/>">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>${cartItem.product.name}</td>
                                                        <td>$ ${cartItem.product.price}</td>
                                                        <td class="text-right">${cartItem.quantity}</td>
                                                        <td class="text-center">
                                                            <a class="btn btn-round btn-info"
                                                               href="<c:url value="/cart/order?productId=${cartItem.productId}&quantity=1"/>">+</a>
                                                            <a class="btn btn-round btn-info"
                                                               href="<c:url value="/cart/order?productId=${cartItem.productId}&quantity=-1"/>">-</a>
                                                        </td>
                                                        <td>$ ${cartItem.product.price * cartItem.quantity}</td>
                                                        <td>
                                                            <a class="btn btn-link btn-just-icon"
                                                               href="<c:url value="/cart/remove?productId=${cartItem.productId}"/>">
                                                                <i class="material-icons">
                                                                    clear
                                                                </i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <tr>
                                                    <td colspan="5" class="text-right"><b>Total price: </b></td>
                                                    <td colspan="2" class="text-center">
                                                        $ ${sessionScope.cart.totalPrice}</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="7" class="text-right"><a
                                                            href="<c:url value="/cart/finish"/>"
                                                            class="btn btn-info btn-round">Complete
                                                        order</a></td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td colspan="7" class="text-center">There is no item in your cart
                                                    </td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>

                                    </table>
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
</body>

</html>