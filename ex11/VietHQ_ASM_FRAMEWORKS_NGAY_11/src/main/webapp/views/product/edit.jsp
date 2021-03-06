<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 16/10/2018
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Edit ${product.name}</title>

    <c:import url="../common-css.jsp"/>
    <!-- Custom CSS -->
    <link href="<c:url value="/resources/vendor/bootstrap/css/shop-homepage.css"/>" rel="stylesheet">

</head>
<body>
<c:import url="../nav.jsp"/>
<div class="container">

    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <h1>Edit product information</h1>
            <form:form
                    enctype="multipart/form-data"
                    action="${pageContext.request.contextPath}/product/edit"
                    method="post"
                    modelAttribute="product">
                <div class="form-group">
                    <form:label path="id">ID: </form:label>
                    <form:input path="id" readonly="true" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <form:label path="name">Name: </form:label>
                    <form:input path="name" cssClass="form-control"/>
                    <form:errors path="name" cssStyle="color: red; display: block"/>
                </div>
                <div class="form-group">
                    <form:label path="description">Description: </form:label>
                    <form:input path="description" cssClass="form-control"/>
                    <form:errors path="description" cssStyle="color: red; display: block"/>
                </div>
                <div class="form-group">
                    <form:label path="price">Price: </form:label>
                    <form:input path="price" cssClass="form-control"/>
                    <form:errors path="price" cssStyle="color: red; display: block"/>
                </div>
                <div class="form-group">
                    <form:label path="amount">Amount: </form:label>
                    <form:input path="amount" cssClass="form-control"/>
                    <form:errors path="amount" cssStyle="color: red; display: block"/>
                </div>
                <div class="form-group">
                    <form:label path="thumbnail">Thumbnail: </form:label>
                    <c:choose>
                        <c:when test="${empty product.thumbnail}">
                            There is no thumbnail
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/image/${product.id}/${product.thumbnail}"
                                 style="width: 50px; height: 50px"/>
                        </c:otherwise>
                    </c:choose>
                    <input name="thumbnail" type="file"/>
                </div>
                <div class="form-group">
                    <form:label path="category.id">Category: </form:label>
                    <form:select path="category.id" cssClass="form-control">
                        <c:forEach items="${categoryList}" var="row">
                            <form:option value="${row.id}">${row.name}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
            </form:form>

        </div>
    </div>

</div>
<c:import url="../footer.jsp"/>

<c:import url="../common-js.jsp"/>
</body>
</html>
