<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 27/09/2018
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Create Product</title>
</head>
<body>
<h3>Welcome, Enter product details</h3>
<form:form method="post" action="${pageContext.request.contextPath}/product/create" modelAttribute="product">
<table>
    <tr>
        <td><form:label path="id">Code:</form:label></td>
        <td><form:input path="id"/></td>
    </tr>
    <tr>
        <td><form:label path="name">Name: </form:label></td>
        <td><form:input path="name"/></td>
    </tr>
    <tr>
        <td><form:label path="price">Price: </form:label></td>
        <td><form:input path="price"/></td>
    </tr>
    <tr>
        <td><form:label path="amount">Amount: </form:label></td>
        <td><form:input path="amount"/></td>
    </tr>
    <tr>
        <td colspan="2"><button type="submit">Submit</button> </td>
    </tr>
</table>
</form:form>
</body>
</html>
