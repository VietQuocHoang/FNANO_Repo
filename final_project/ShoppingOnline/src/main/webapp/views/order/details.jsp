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
        Order ${order.id}
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <c:import url="../fragments/common-css.jsp"/>
</head>

<body class="">
<div class="wrapper ">
    <c:import url="../fragments/sidebar.jsp">
        <c:param name="position" value="order"/>
    </c:import>
    <div class="main-panel">
        <c:import url="../fragments/navbar.jsp">
            <c:param name="navbarBrand" value="Order"/>
            <c:param name="navbarUrl" value="/order"/>
        </c:import>
        <div class="content">
            <div class="container-fluid">
                <!-- your content here -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Order ID: <b>${order.id}</b> by User:
                                    <b>${order.user.username}</b></h4>
                                <p class="card-category">Date ordered: <b>${order.createdDate}</b></p>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <tr>
                                            <th colspan="2" class="text-center">Product</th>
                                            <th>Amount</th>
                                        </tr>
                                        <c:forEach items="${order.orderDetailsList}" var="orderDetail">
                                            <tr>
                                                <td class="text-center">
                                                    <c:choose>
                                                        <c:when test="${orderDetail.product.thumbnail != null && orderDetail.product.thumbnail !=''}">
                                                            <img class="img-thumbnail-sm"
                                                                 src="<c:url value="/image/${orderDetail.product.id}/${orderDetail.product.thumbnail}"/> ">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img class="img-thumbnail-sm"
                                                                 src="<c:url value="/image/common/not-available.jpg"/>">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="text-center">${orderDetail.product.name}</td>
                                                <td>${orderDetail.amount}</td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td colspan="2" class="text-right">Total:</td>
                                            <td>$ ${order.total}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer">
                                <a href="<c:url value="/order"/>" class="btn btn-round btn-primary">Back to index</a>
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