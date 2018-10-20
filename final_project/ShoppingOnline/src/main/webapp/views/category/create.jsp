<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 18/10/2018
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>
        New Category
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <c:import url="../fragments/common-css.jsp"/>
</head>

<body class="">
<div class="wrapper ">
    <c:import url="../fragments/sidebar.jsp">
        <c:param name="position" value="category"/>
    </c:import>
    <div class="main-panel">
        <c:import url="../fragments/navbar.jsp">
            <c:param name="navbarBrand" value="Category"/>
            <c:param name="navbarUrl" value="/category"/>
        </c:import>
        <div class="content">
            <div class="container-fluid">
                <!-- your content here -->
                <div class="card">
                    <div class="card-header card-header-primary">
                        <h4>Create ${category.name}</h4>
                        <p class="card-category">Please fill in all details below</p>
                    </div>
                    <form:form modelAttribute="category" method="post"
                               action="${pageContext.request.contextPath}/category/create">
                        <div class="card-body">
                            <div class="form-group bmd-form-group">
                                <form:label path="name" cssClass="bmd-label-floating">Name: </form:label>
                                <form:input path="name" cssClass="form-control"/>
                                <form:errors path="name" cssStyle="color:red;display:block"/>
                            </div>
                        </div>
                        <div class="card-footer pull-right">
                            <a href="<c:url value="/category/"/>" class="btn btn-link">Back to index</a>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form:form>

                </div>
            </div>
        </div>
        <c:import url="../fragments/footer.jsp"/>
    </div>
</div>
<c:import url="../fragments/common-js.jsp"/>
</body>

</html>