<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 23/10/2018
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit ${siteClass.name}</title>
</head>
<body>

<a href="<c:url value="/siteclass/index"/> ">Back to index</a>
<form:form modelAttribute="siteClass"
           method="post"
           action="${pageContext.request.contextPath}/siteclass/edit">
    <form:label path="name">Name: </form:label>
    <form:input type="text" path="name"/>
    <form:hidden path="id"/>
    <button type="submit">Submit</button>
</form:form>
</body>
</html>
