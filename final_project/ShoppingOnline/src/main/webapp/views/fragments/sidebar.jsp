<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 19/10/2018
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="sidebar" data-color="purple" data-background-color="white">
    <!--
      Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

      Tip 2: you can also add an image using data-image tag
  -->
    <div class="logo">
        <a href="<c:url value="/"/>" class="simple-text logo-normal">
            Shopping Online
        </a>
    </div>
    <div class="sidebar-wrapper">
        <ul class="nav">

            <%--Admin Navbar--%>
            <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
                <li class="nav-item <c:if test="${param.position =='dashboard'}">active</c:if>">
                    <a class="nav-link" href="<c:url value="/"/>">
                        <i class="material-icons">dashboard</i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="nav-item <c:if test="${param.position=='product'}">active</c:if>">
                    <a class="nav-link" href="<c:url value="/product/"/>">
                        <i class="material-icons">work</i>
                        <p>Product</p>
                    </a>
                </li>
                <li class="nav-item <c:if test="${param.position=='category'}">active</c:if>">
                    <a class="nav-link" href="<c:url value="/category/"/>">
                        <i class="material-icons">category</i>
                        <p>Category</p>
                    </a>
                </li>
                <li class="nav-item <c:if test="${param.position=='user'}">active</c:if>">
                    <a class="nav-link" href="<c:url value="/user/"/>">
                        <i class="material-icons">people</i>
                        <p>User</p>
                    </a>
                </li>
            </sec:authorize>


            <%--User navbar--%>
            <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
                <li class="nav-item <c:if test="${param.position=='home'}">active</c:if>">
                    <a class="nav-link" href="<c:url value="/home/"/>">
                        <i class="material-icons">home</i>
                        <p>Home</p>
                    </a>
                </li>
                <li class="nav-item <c:if test="${param.position=='cart'}">active</c:if>">
                    <a class="nav-link" href="<c:url value="/cart/"/>">
                        <i class="material-icons">shopping_cart</i>
                        <p>My cart</p>
                    </a>
                </li>
                <li class="nav-item <c:if test="${param.position=='history'}">active</c:if>">
                    <a class="nav-link" href="<c:url value="/history/"/>">
                        <i class="material-icons">history</i>
                        <p>Order History</p>
                    </a>
                </li>
            </sec:authorize>

            <!-- your sidebar here -->
        </ul>
    </div>
</div>