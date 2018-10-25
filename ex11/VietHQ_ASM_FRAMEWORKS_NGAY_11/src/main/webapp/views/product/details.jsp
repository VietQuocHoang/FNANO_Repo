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

    <title>${product.name}</title>

    <c:import url="../common-css.jsp"/>
    <!-- Custom CSS -->
    <link href="<c:url value="/resources/vendor/bootstrap/css/shop-homepage.css"/>" rel="stylesheet">

</head>
<body>
<c:import url="../nav.jsp"/>
<div class="container">
    <div class="row">

        <div class="col-md-3">
            <p class="lead">Type</p>
            <div class="list-group">
                <a href="#" class="list-group-item active">${product.category.name}</a>
            </div>
        </div>

        <div class="col-md-9">

            <div class="thumbnail">
                <img class="img-responsive" style="width: 800px; height:300px !important;"
                     src="<c:url value="/image/${product.id}/${product.thumbnail}"/>"
                     alt="There is no thumbnail for this product">
                <div class="caption-full">
                    <h4 class="pull-right">$ ${product.price}</h4>
                    <h4>
                        <a href="${pageContext.request.contextPath}/product/details?id=${product.id}">${product.name}</a>
                    </h4>
                    <p>${product.description}</p>
                </div>

            </div>

        </div>

    </div>
</div>

<c:import url="../footer.jsp"/>

<c:import url="../common-js.jsp"/>
</body>
</html>
