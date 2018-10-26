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
        Login
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <c:import url="../fragments/common-css.jsp"/>
    <%--login css--%>
    <link rel="stylesheet" href="<c:url value="/resources/css/login.css"/>"/>
</head>

<body class="">
<div class="login-card-container">
    <div class="login-card">
        <div class="card-header card-header-primary text-center">
            <h3 class="card-title">Login</h3>
            <p class="card-category text-danger"><c:if test="${param.error != null}">Wrong username/password</c:if></p>
        </div>
        <form action="<c:url value="/login"/>" method="post">
            <div class="card-body">
                <div class="form-group bmd-form-group">
                    <label>Username: </label>
                    <input type="text" class="form-control" name="username">
                </div>
                <div class="form-group bmd-form-group">
                    <label>Password: </label>
                    <input type="password" class="form-control" name="password">
                </div>
                <div class="form-group bmd-form-group text-center">
                    <button type="submit" class="btn btn-primary btn-fill">Login</button>
                    <a href="<c:url value="/register"/>">Don't have account?</a>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<c:import url="../fragments/common-js.jsp"/>
</html>