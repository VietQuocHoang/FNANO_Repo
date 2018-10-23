<%-- 
    Document   : index
    Created on : Jul 28, 2018, 7:56:23 PM
    Author     : Luzec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<body>
<h1>Danh sách lớp</h1>
<a href="<c:url value="/siteclass/create"/>">Tạo mới</a>
<c:if test="${not empty listClass}">
    <table>
        <thead>
        <tr>
            <th>Mã số</th>
            <th>Tên</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="row" items="${listClass}">
            <tr>
                <td><c:out value="${row.id}"/></td>
                <td><c:out value="${row.name}"/></td>
                <td>
                    <a href="<c:url value= "/siteclass/details?id=${row.id}"/>">Details</a>
                    <a href="<c:url value="/siteclass/edit?id=${row.id}"/>">Edit</a>
                    <a href="<c:url value="/siteclass/delete?id=${row.id}"/>">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</body>
</html>
