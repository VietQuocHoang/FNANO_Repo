<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 27/09/2018
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Trang chủ</title>
</head>
<body>
<c:import url="header.jsp"/>
<h3 style="color: darksalmon">Tin tức</h3>
<ul>
    <li><a href="${pageContext.request.contextPath}/lich-trinh">Saigon tourist- Lượng khách đi tour tăng vọt</a></li>
    <li><a href="${pageContext.request.contextPath}/lich-trinh">Saigon tourist - Đẩy mạnh hình thức kinh doanh qua mạng</a></li>
    <li><a href="${pageContext.request.contextPath}">Tận hưởng mùa giáng sinh</a></li>
</ul>
<hr>
<div style="width: 100%; float: left; text-align: center">
    <a href="${pageContext.request.contextPath}/dia-diem">Một số danh lam thắng cảnh</a>
</div>
<p style="color: coral">Thắng cảnh sapa</p>
<img src="${pageContext.request.contextPath}/resources/img/sapa.jpg" style="width:150px; height: 150px"/>
</body>
</html>
