<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 19/10/2018
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
    <div class="container-fluid">
        <div class="navbar-wrapper">
            <a class="navbar-brand" href="<c:url value="${param.navbarUrl}"/> ">${param.navbarBrand}</a>
        </div>
        <button class="navbar-toggler toggled" type="button" data-toggle="collapse"
                aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/cart"/>">
                            <i class="material-icons">shopping_cart</i>
                            <c:if test="${not empty sessionScope.cart && not empty sessionScope.cart.cartItemList}">
                                <span class="notification">${sessionScope.cart.cartItemList.size()}</span>
                            </c:if>
                            <p class="d-lg-none d-md-block">
                                Your cart
                            </p>
                        </a>
                    </li>
                </sec:authorize>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="http://example.com" id="accountDropDown" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="material-icons">person</i>
                        <p class="d-lg-none d-md-block">
                            Account
                        </p>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="accountDropDown">
                        <%--<a class="dropdown-item" href="#">My Profile--%>
                        </a>
                        <a class="dropdown-item" href='#' data-toggle="modal" data-target="#logoutModal">Log Out <i
                                class="material-icons">exit_to_app</i>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="logoutModalLabel">Confirm logout</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Do you want to logout?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                <a href="<c:url value="/logout"/>" class="btn btn-danger btn-primary">Logout</a>
            </div>
        </div>
    </div>
</div>
<!-- End Navbar -->