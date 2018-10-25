<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>Edit ${student.firstName}</title>
</head>
<body>
<a href="<c:url value="/student/index"/> ">Back to index</a>
<form:form modelAttribute="student" action="${pageContext.request.contextPath}/student/edit" method="post">
    <table>
        <tr>
            <td><form:label path="firstName">First Name: </form:label></td>
            <td><form:input path="firstName"/></td>
        </tr>
        <tr>
            <td>
                <form:label path="lastName">Last Name: </form:label>
            </td>
            <td><form:input path="lastName"/></td>
        </tr>
        <tr>
            <td><form:label path="email">Email: </form:label></td>
            <td><form:input path="email"/></td>
        </tr>
        <tr>
            <td><form:label path="phone">Phone</form:label></td>
            <td><form:input path="phone"/></td>
        </tr>
        <tr>
            <td><form:label path="siteClass.id">Site Class</form:label></td>
            <td>
                <form:select path="siteClass.id">
                    <c:forEach items="${siteClassList}" var="siteClass">
                        <form:option value="${siteClass.id}">${siteClass.name}</form:option>
                    </c:forEach>
                </form:select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <form:hidden path="id"/>
                <button type="submit">Save</button>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
