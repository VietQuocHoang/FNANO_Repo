<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 27/09/2018
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Product Edit</title>
</head>
<body>
<form:form action="${pageContext.request.contextPath}/product/update" method="post" modelAttribute="product">
    <table>
        <tr>
            <td><form:label path="id">ID</form:label></td>
            <td><form:input path="id" readonly="true"/></td>
        </tr>
        <tr>
            <td><form:label path="name">Name</form:label></td>
            <td><form:input path="name"/></td>
        </tr>
        <tr>
            <td><form:label path="price">Price</form:label></td>
            <td><form:input path="price"/></td>
        </tr>
        <tr>
            <td><form:label path="amount">Amount</form:label></td>
            <td><form:input path="amount"/></td>
        </tr>
        <tr>
            <td>
                <button type="submit">Save</button>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
