<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 23/10/2018
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${student.firstName}</title>
</head>
<body>
<a href="<c:url value="/student/index" />">Back to index</a>
<table>
    <tr>
        <td>ID</td>
        <td>${student.id}</td>
    </tr>
    <tr>
        <td>Name</td>
        <td>${student.firstName} ${student.lastName}</td>
    </tr>
    <tr>
        <td>Email</td>
        <td>${student.email}</td>
    </tr>
    <tr>
        <td>Phone</td>
        <td>${student.phone}</td>
    </tr>
    <tr>
        <td>Site Class</td>
        <td>${student.siteClass.name}</td>
    </tr>
</table>
</body>
</html>
