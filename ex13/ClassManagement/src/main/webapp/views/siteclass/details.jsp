<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 23/10/2018
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${siteClass.name}</title>
</head>
<body>
<a href="<c:url value="/siteclass/index"/>">Back to index</a>
<table>
    <tr>
        <td>Id</td>
        <td>${siteClass.id}</td>
    </tr>
    <tr>
        <td>Name</td>
        <td>${siteClass.name}</td>
    </tr>
</table>
</body>
</html>
