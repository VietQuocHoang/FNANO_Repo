<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        ${user.username}
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <c:import url="../fragments/common-css.jsp"/>
</head>

<body class="">
<div class="wrapper ">
    <c:import url="../fragments/sidebar.jsp">
        <c:param name="position" value="user"/>
    </c:import>
    <div class="main-panel">
        <c:import url="../fragments/navbar.jsp">
            <c:param name="navbarBrand" value="User"/>
            <c:param name="navbarUrl" value="/user"/>
        </c:import>
        <div class="content">
            <div class="container-fluid">
                <!-- your content here -->

                <div class="row">
                    <div class="card">
                        <div class="card-header card-header-primary">
                            <h4 class="card-title">${user.username}</h4>
                        </div>
                        <div class="card-body">
                            <p><b>ID: </b> ${user.id}</p>
                            <p><b>Username: </b> ${user.username}</p>
                            <p><b>Role: </b> ${user.role.name}</p>
                            <c:if test="${user.role.name.equals('ROLE_USER')}">
                                <div class="row">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">Order history</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <tr>
                                                        <td>Order</td>
                                                        <td>Total</td>
                                                        <td></td>
                                                    </tr>
                                                    <c:forEach items="${user.orderList}" var="order">
                                                        <tr>
                                                            <td>${order.createdDate}</td>
                                                            <td>$ ${order.total}</td>
                                                            <td>
                                                                <a href="<c:url value="/order/${order.id}"/>"
                                                                   class="btn btn-just-icon btn-link">
                                                                    <i class="material-icons">more</i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div
                            </c:if>
                        </div>
                        <div class="card-footer">
                            <a href="<c:url value="/user/"/>" class="btn btn-round btn-primary">Back to index</a>
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