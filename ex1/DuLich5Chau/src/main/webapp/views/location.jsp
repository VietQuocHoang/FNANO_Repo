<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 27/09/2018
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Địa điểm</title>
    <style>
        table {
            width: 100%;
        }

        th {
            background: grey;
            color: white;
        }
    </style>
</head>
<body>
<c:import url="header.jsp"/>
<a href="${pageContext.request.contextPath}">Trang chủ</a>
<div style="width:100%; float:left; text-align: center">
    <h2 style="color: darksalmon;">MỘT SỐ ĐỊA ĐIỂM DU LỊCH</h2>
</div>

<table>
    <tr>
        <th>Địa danh</th>
        <th>Tỉnh-thành phố</th>
    </tr>
    <tr>
        <td>Suối nước nóng</td>
        <td>Bình Châu-Vũng Tàu</td>
    </tr>
    <tr>
        <td>Biển hồ cốc</td>
        <td>Bình Châu-Vũng Tàu</td>
    </tr>
    <tr>
        <td>Mũi Né</td>
        <td>Phan Thiết - Bình Thuận</td>
    </tr>
    <tr>
        <td>Suối Vàng Biển Bạc</td>
        <td>Đà Lạt - Lâm Đồng</td>
    </tr>
</table>
<table>
    <tr>
        <th colspan="3">
            Một số danh lam thắng cảnh
        </th>
    </tr>
    <tr>
        <th>Đồi Cù - Đà Lạt</th>
        <th>Huế - Lăng Cổ</th>
        <th>Đèo Hải Vân - Đà Nẵng</th>
    </tr>
    <tr>
        <th><img src="${pageContext.request.contextPath}/resources/img/doicu.jpg" style="width: 150px; height: 150px"/></th>
        <th><img src="${pageContext.request.contextPath}/resources/img/huelangco.jpg" style="width: 150px; height: 150px"/></th>
        <th><img src="${pageContext.request.contextPath}/resources/img/deohaivan.jpg" style="width: 150px; height: 150px"/></th>
    </tr>
</table>
<div style="width:100%; float:left; text-align: center">
    <p>
        Mọi chi tiết xin liên h<br>
        Văn phòng Saigon Tourist gần nhất của bạn<br>
        Điện thoại: (08)090908080
    </p>
</div>

</body>
</html>
