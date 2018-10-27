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
        Dashboard
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <c:import url="fragments/common-css.jsp"/>
</head>

<body class="">
<div class="wrapper ">
    <c:import url="fragments/sidebar.jsp">
        <c:param name="position" value="dashboard"/>
    </c:import>
    <div class="main-panel">
        <c:import url="fragments/navbar.jsp">
            <c:param name="navbarBrand" value="Dashboard"/>
            <c:param name="navbarUrl" value="/dashboard"/>
        </c:import>
        <div class="content">
            <div class="container-fluid">
                <!-- your content here -->
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-success card-header-icon">
                                <div class="card-icon">
                                    <i class="material-icons">store</i>
                                </div>
                                <p class="card-category">Revenue in 24 hours</p>
                                <h3 class="card-title">$ ${revenue}</h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons">date_range</i>
                                    Last 24 Hours
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-primary card-header-icon">
                                <div class="card-icon">
                                    <i class="material-icons">history</i>
                                </div>
                                <p class="card-category">Number Of Orders</p>
                                <h3 class="card-title">${numOfOrder} order(s)</h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons">date_range</i>
                                    Last 24 Hours
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-danger card-header-icon">
                                <div class="card-icon">
                                    <i class="material-icons">work</i>
                                </div>
                                <p class="card-category">Number Of Products</p>
                                <h3 class="card-title">${numOfProduct} product(s)</h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons">update</i>
                                    Just updated
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-stats">
                            <div class="card-header card-header-warning card-header-icon">
                                <div class="card-icon">
                                    <i class="material-icons">category</i>
                                </div>
                                <p class="card-category">Number Of Categories</p>
                                <h3 class="card-title">${numOfCategory} category(s)</h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons">update</i>
                                    Just updated
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Recently order</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <tr>
                                            <td class="text-center">Order ID</td>
                                            <td class="text-center">Order date</td>
                                            <td class="text-center">Total</td>
                                            <td></td>
                                        </tr>
                                        <c:forEach items="${orderList}" var="order">
                                            <tr>
                                                <td>${order.id}</td>
                                                <td>${order.createdDate}</td>
                                                <td class="text-center">$ ${order.total}</td>
                                                <td>
                                                    <a href="<c:url value="/order/${order.id}"/>"
                                                       class="btn btn-just-icon btn-link">
                                                        <i class="material-icons">more</i>
                                                    </a></td>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Top 5 User</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <tr>
                                            <td class="text-center">#</td>
                                            <td class="text-center">Username</td>
                                            <td class="text-center">Number of Order</td>
                                            <td></td>
                                        </tr>
                                        <c:forEach items="${userList}" var="user" varStatus="status">
                                            <tr>
                                                <td>${status.count}</td>
                                                <td>${user.username}</td>
                                                <td class="text-center">${user.numOfOrder}</td>
                                                <td>
                                                    <a href="<c:url value="/user/${user.id}"/>"
                                                       class="btn btn-just-icon btn-link">
                                                        <i class="material-icons">more</i>
                                                    </a></td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="fragments/footer.jsp"/>
    </div>
</div>
<c:import url="fragments/common-js.jsp"/>
</body>

</html>