<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 19/10/2018
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <li class="nav-item dropdown">
                    <a class="nav-link" href="http://example.com" id="navbarDropdownMenuLink"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="material-icons">shopping_cart</i>
                        <span class="notification">5</span>
                        <p class="d-lg-none d-md-block">
                            Your cart
                        </p>
                        <div class="ripple-container"></div>
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="http://example.com" id="accountDropDown" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="material-icons">person</i>
                        <p class="d-lg-none d-md-block">
                            Account
                        </p>
                        <div class="ripple-container"></div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="accountDropDown">
                        <a class="dropdown-item" href="#">My Profile
                            <div class="ripple-container"></div>
                        </a>
                        <a class="dropdown-item" href="#">Log Out <i class="material-icons">exit_to_app</i>
                            <div class="ripple-container"></div>
                        </a>

                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- End Navbar -->