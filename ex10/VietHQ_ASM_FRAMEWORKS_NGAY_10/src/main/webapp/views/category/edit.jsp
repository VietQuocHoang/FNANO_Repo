<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 16/10/2018
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${category.name}</title>

    <c:import url="../common-css.jsp"/>
    <!-- Custom CSS -->
    <link href="<c:url value="/resources/vendor/bootstrap/css/shop-homepage.css"/>" rel="stylesheet">

</head>
<body>
<c:import url="../nav.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <h1>Edit category</h1>
            <form:form action="${pageContext.request.contextPath}/category/edit" method="post"
                       modelAttribute="category">
                <div class="form-group">
                    <form:label path="id">ID: </form:label>
                    <form:input path="id" readonly="true" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <form:label path="name">Name: </form:label>
                    <td><form:input path="name" cssClass="form-control"/></td>
                    <td><form:errors path="name" cssStyle="color: red; display: block"/></td>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-default">Save</button>
                </div>
            </form:form>

        </div>
    </div>
</div>

<c:import url="../footer.jsp"/>

<c:import url="../common-js.jsp"/>
</body>
</html>
