<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 18/10/2018
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>
        Material Dashboard by Creative Tim
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <c:import url="fragments/common-css.jsp"/>
</head>

<body class="">
<div class="wrapper ">
    <c:import url="fragments/sidebar.jsp"/>
    <div class="main-panel">
        <c:import url="fragments/navbar.jsp">
            <c:param name="navbarBrand" value="Skeleton"/>
            <c:param name="navbarUrl" value="/skeleton"/>
        </c:import>
        <div class="content">
            <div class="container-fluid">
                <!-- your content here -->

            </div>
        </div>
        <c:import url="fragments/footer.jsp"/>
    </div>
</div>
<c:import url="fragments/common-js.jsp"/>
</body>

</html>