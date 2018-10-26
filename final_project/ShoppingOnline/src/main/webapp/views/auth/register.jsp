<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        Register
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
            <h3 class="card-title">Register</h3>
            <p class="card-category text-danger"><c:if test="${param.error != null}">Wrong username/password</c:if></p>
        </div>
        <form:form modelAttribute="user"
                   action="${pageContext.request.contextPath}/register"
                   method="post">
            <div class="card-body">
                <div class="form-group bmd-form-group">
                    <form:label path="username">Username: </form:label>
                    <form:input class="form-control" path="username"/>
                    <form:errors path="username" cssStyle="color:red"/>
                </div>
                <div class="form-group bmd-form-group">
                    <form:label path="password">Password</form:label>
                    <form:password class="form-control" path="password"/>
                    <form:errors path="password" cssStyle="color:red"/>
                </div>
                <div class="form-group bmd-form-group">
                    <form:label path="reconfirmPassword">Confirm Password</form:label>
                    <form:password path="reconfirmPassword" cssClass="form-control"/>
                    <form:errors path="reconfirmPassword" cssStyle="color:red"/>
                </div>
                <div class="form-group bmd-form-group text-center">
                    <button type="submit" class="btn btn-primary btn-fill" id="submitRegister">Register</button>
                    <a href="<c:url value="/login"/>">Already have an account?</a>
                </div>
            </div>
        </form:form>
    </div>
</div>
</body>
<c:import url="../fragments/common-js.jsp"/>
</html>