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
        Edit ${user.username}
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
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Create User</h4>
                                <p>Please fill in all details</p>
                            </div>
                            <form:form
                                    action="${pageContext.request.contextPath}/user/edit"
                                    method="post"
                                    modelAttribute="user">
                                <div class="card-body">
                                    <div class="col-md-6 offset-md-3">
                                        <div class="form-group bmd-form-group">
                                            <form:label path="username">Username: </form:label>
                                            <form:input readonly="true" class="form-control" path="username"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6 offset-md-3">
                                        <div class="form-group bmd-form-group">
                                            <form:label path="password">Password</form:label>
                                            <form:password class="form-control" path="password"/>
                                            <form:errors path="password" cssStyle="color:red"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6 offset-md-3">
                                        <div class="form-group bmd-form-group">
                                            <form:label path="reconfirmPassword">Confirm Password</form:label>
                                            <form:password path="reconfirmPassword" cssClass="form-control"/>
                                            <form:errors path="reconfirmPassword" cssStyle="color:red"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6 offset-md-3">
                                        <div class="form-group bmd-form-group">
                                            <form:label path="roleId">Role</form:label>
                                            <form:select path="roleId" cssClass="form-control">
                                                <c:forEach items="${roleList}" var="role">
                                                    <form:option value="${role.id}">${role.name}</form:option>
                                                </c:forEach>
                                            </form:select>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer pull-right">
                                    <a href="<c:url value="/user/"/>" class="btn btn-link">Back to index</a>
                                    <button type="submit" class="btn btn-primary pull-right">Save user</button>
                                    <form:hidden path="id"/>
                                </div>
                            </form:form>

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