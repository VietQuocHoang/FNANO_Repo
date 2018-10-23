<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 23/10/2018
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new site class</title>
</head>
<body>
<a href="<c:url value="/siteclass/index"/> ">Back to index</a>
<form:form modelAttribute="siteClass"
           method="post"
           action="${pageContext.request.contextPath}/siteclass/create">
    <form:label path="name">Name: </form:label>
    <form:input type="text" path="name"/>
    <button type="submit">Submit</button>
</form:form>
</body>
</html>
