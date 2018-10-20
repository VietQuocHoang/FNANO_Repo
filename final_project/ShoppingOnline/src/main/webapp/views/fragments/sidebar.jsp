<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 19/10/2018
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value="/"/>">
                    <i class="material-icons">dashboard</i>
                    <p>Dashboard</p>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/product"/>">
                    <i class="material-icons">work</i>
                    <p>Product</p>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/category"/>">
                    <i class="material-icons">category</i>
                    <p>Category</p>
                </a>
            </li>
            <!-- your sidebar here -->
        </ul>
    </div>
</div>