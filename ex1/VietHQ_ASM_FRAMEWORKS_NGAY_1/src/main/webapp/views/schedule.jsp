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
    <title>Lịch trình</title>
    <style>
        table{
            border-spacing: 0;
            border-collapse: collapse;
        }
        th{
            background-color:darkblue;
            color:white;
        }
        th.location{
            background-color: cornflowerblue;
            color: firebrick;
        }
        td{
            box-sizing: border-box;
            color: blue;
            border: 1px solid blue;
        }
        td.time{
            text-align: center;
            font-weight: bold;
            color: red;
        }
    </style>
</head>
<body>
<img src="${pageContext.request.contextPath}/resources/img/vietnamairline.jpg" style="width: 100%; height:auto"/>
<h3>Lịch trình các chuyến bay</h3>
<table style="width:100%">
    <tr>
        <th rowspan="2">Thời gian</th>
        <th colspan="2">Tuyến</th>
    </tr>
    <tr>
        <th class="location">Nơi đi</th>
        <th class="location">Nơi đến</th>
    </tr>
    <tr>
        <td rowspan="2" class="time">Sáng</td>
        <td>Ho Chi Minh</td>
        <td>Ha Noi</td>
    </tr>
    <tr>
        <td>Ho Chi Minh</td>
        <td>Singapore</td>
    </tr>
    <tr>
        <td rowspan="2" class="time">Chiều</td>
        <td>Ha Noi</td>
        <td>New York</td>
    </tr>
    <tr>
        <td>Ho Chi Minh</td>
        <td>Phu Quoc</td>
    </tr>
</table>
</body>
</html>
