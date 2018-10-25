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

    <title>${category.name}</title>

    <c:import url="../common-css.jsp"/>
    <!-- Custom CSS -->
    <link href="<c:url value="/resources/vendor/bootstrap/css/shop-homepage.css"/>" rel="stylesheet">

</head>
<body>
<c:import url="../nav.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <h1>${category.name}'s details</h1>
            <div class="row">
                <p>Name: <b>${category.name}</b></p>
            </div>
        </div>
    </div>
</div>

<c:import url="../footer.jsp"/>

<c:import url="../common-js.jsp"/>
</body>
</html>
