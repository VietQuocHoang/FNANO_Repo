<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 16/10/2018
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Category</title>

    <c:import url="../common-css.jsp"/>
    <!-- Custom CSS -->
    <link href="<c:url value="/resources/vendor/bootstrap/css/shop-homepage.css"/>" rel="stylesheet">

</head>
<body>
<c:import url="../nav.jsp"/>
<div class="container">
    <div class="row">
        <a class="btn btn-default" href="<c:url value="/category/create"/>"><i class="glyphicon glyphicon-plus"></i> Add
            new</a>
        <form
                action="${pageContext.request.contextPath}/category/index"
                class="form-inline pull-right"
                method="get">
            <input type="text" name="search" value="${search}" class="form-control" placeholder="Search"/>
            <input type="hidden" name="page" value="${page}"/>
            <button type="submit" class="btn btn-default">Search</button>
        </form>
    </div>
    <div class="row">
        <table class="table table-bordered">
            <tr>
                <th class="col-md-1">Id</th>
                <th class="col-md-8">Name</th>
                <th class="col-md-3">Action</th>
            </tr>
            <c:forEach items="${categoryList}" var="category">
                <tr>
                    <td>${category.id}</td>
                    <td>${category.name}</td>
                    <td>
                        <a class="btn btn-primary"
                           href="${pageContext.request.contextPath}/category/details?id=${category.id}"><i
                                class="glyphicon glyphicon-eye-open"></i></a>
                        <a class="btn btn-warning"
                           href="${pageContext.request.contextPath}/category/edit?id=${category.id}"><i
                                class="glyphicon glyphicon-edit"></i></a>
                        <a class="btn btn-danger"
                           href="${pageContext.request.contextPath}/category/delete?id=${category.id}"><i
                                class="glyphicon glyphicon-trash"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="row">
        <ul class="pager">
            <li>
                <a href="<c:if test="${page>0}">${pageContext.request.contextPath}/category/index?page=${page-1}&search=${search}</c:if>">Previous</a>
            </li>
            <li>
                <b>
                    <c:choose>
                        <c:when test="${page>limit}">0</c:when>
                        <c:otherwise>${page+1}</c:otherwise>
                    </c:choose>
                </b>/${limit+1}
            </li>
            <li>
                <a href="<c:if test="${page<limit}">${pageContext.request.contextPath}/category/index?page=${page+1}&search=${search}</c:if>">Next</a>
            </li>
        </ul>
    </div>
</div>

<c:import url="../footer.jsp"/>

<c:import url="../common-js.jsp"/>
</body>
</html>
