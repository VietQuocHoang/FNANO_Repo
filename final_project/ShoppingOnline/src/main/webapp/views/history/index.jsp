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
        Material Dashboard by Creative Tim
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <c:import url="../fragments/common-css.jsp"/>
</head>

<body class="">
<div class="wrapper ">
    <c:import url="../fragments/sidebar.jsp">
        <c:param name="position" value="history"/>
    </c:import>
    <div class="main-panel">
        <c:import url="../fragments/navbar.jsp">
            <c:param name="navbarBrand" value="History"/>
            <c:param name="navbarUrl" value="/history"/>
        </c:import>
        <div class="content">
            <div class="container-fluid">
                <!-- your content here -->
                <div class="row">
                    <c:forEach items="${orderList}" var="order">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Order ID: <b>${order.id}</b></h4>
                                    <p class="card-category">Ordered on ${order.createdDate}</p>
                                </div>
                                <div class="card-body table-responsive">
                                    <table class="table">
                                        <tr>
                                            <td colspan="2" class="text-center">Product</td>
                                            <td class="text-center">Amount</td>
                                        </tr>
                                        <c:forEach items="${order.orderDetailsList}" var="orderDetails">
                                            <tr>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty orderDetails.product.thumbnail}">
                                                            <img style="width:100px; height: 100px;"
                                                                 src="<c:url value="/image/${orderDetails.product.id}/${orderDetails.product.thumbnail}"/>">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img style="width:100px; height: 100px;"
                                                                 src="<c:url value="/image/common/not-available.jpg"/>">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${orderDetails.product.name}</td>
                                                <td class="text-center">${orderDetails.amount}</td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td colspan="2" class="text-right">Total price:</td>
                                            <td class="text-center">$ ${order.total}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <c:import url="../fragments/footer.jsp"/>
    </div>
</div>
<c:import url="../fragments/common-js.jsp"/>
</body>

</html>