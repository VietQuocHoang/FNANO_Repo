<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 27/09/2018
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Details</title>
</head>
<body>
<h2>Product details</h2>
<table>
    <tr>
        <td>ID</td>
        <td>${product.id}</td>


    </tr>
    <tr>
        <td>Name</td>
        <td>${product.name}</td>
    </tr>
    <tr>
        <td>Price</td>
        <td>${product.price}</td>
    </tr>
    <tr>
        <td>Amount</td>
        <td>${product.amount}</td>
    </tr>
</table>
</body>
</html>
