<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 27/09/2018
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<h1>Register</h1>
<form action="${pageContext.request.contextPath}/home/getfromPOST" method="post">
    <table>
        <tr>
            <td>Code</td>
            <td><input type="text" name="id"/></td>
        </tr>
        <tr>
            <td>Fullname</td>
            <td><input type="text" name="name"/></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">Submit</button></td>
        </tr>
    </table>
</form>
</body>
</html>
