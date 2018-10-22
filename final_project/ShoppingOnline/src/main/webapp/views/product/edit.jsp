<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 18/10/2018
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>
        Edit ${product.name}
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <c:import url="../fragments/common-css.jsp"/>
</head>

<body class="">
<div class="wrapper ">
    <c:import url="../fragments/sidebar.jsp">
        <c:param name="position" value="product"/>
    </c:import>
    <div class="main-panel">
        <c:import url="../fragments/navbar.jsp">
            <c:param name="navbarBrand" value="Product"/>
            <c:param name="navbarUrl" value="/product"/>
        </c:import>
        <div class="content">
            <div class="container-fluid">
                <!-- your content here -->
                <div class="card">
                    <div class="card-header card-header-primary">
                        <h4>Edit ${product.id}-${product.name}</h4>
                        <p class="card-category">Please fill in all details below</p>
                    </div>
                    <form:form
                            enctype="multipart/form-data"
                            action="${pageContext.request.contextPath}/product/edit"
                            method="post"
                            modelAttribute="product">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 offset-md-3">
                                    <div class="form-group bmd-form-group">
                                        <form:label path="name">Name: </form:label>
                                        <form:input path="name" cssClass="form-control"/>
                                        <form:errors path="name" cssStyle="color: red; display: block"/>
                                    </div>
                                    <div class="form-group bmd-form-group">
                                        <form:label path="price">Price: </form:label>
                                        <form:input path="price" cssClass="form-control"/>
                                        <form:errors path="price" cssStyle="color: red; display: block"/>
                                    </div>
                                    <div class="form-group bmd-form-group">
                                        <form:label path="amount">Amount: </form:label>
                                        <form:input path="amount" cssClass="form-control"/>
                                        <form:errors path="amount" cssStyle="color: red; display: block"/>
                                    </div>
                                    <div class="form-group bmd-form-group">
                                        <form:label path="description">Description: </form:label>
                                        <form:textarea path="description" cssClass="form-control"/>
                                        <form:errors path="description" cssStyle="color: red; display: block"/>
                                    </div>
                                    <div class="form-group bmd-form-group">
                                        <label>Thumbnail: </label>
                                        <button type="button" class="btn btn-round btn-just-icon" id="btn-upload-file">
                                            <i class="material-icons">cloud_upload</i></button>
                                        <input name="thumbnail" type="file"/>
                                        <c:choose>
                                            <c:when test="${empty product.thumbnail}">
                                                <img src="<c:url value="/image/common/not-available.jpg"/> "
                                                     class="img img-thumbnail-md" id="preview-thumbnail" hidden>
                                            </c:when>
                                            <c:otherwise>
                                                <img src="<c:url value="/image/${product.id}/${product.thumbnail}"/>"
                                                     class="img img-thumbnail-md" id="preview-thumbnail">
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                    <div class="form-group bmd-form-group">
                                        <form:label path="category.id">Category: </form:label>
                                        <form:select path="category.id" cssClass="form-control">
                                            <c:forEach items="${categoryList}" var="row">
                                                <form:option value="${row.id}">${row.name}</form:option>
                                            </c:forEach>
                                        </form:select>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="card-footer pull-right">
                            <a href="<c:url value="/product/"/>" class="btn btn-link">Back to index</a>
                            <form:hidden path="id"/>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form:form>

                </div>
            </div>
        </div>
        <c:import url="../fragments/footer.jsp"/>
    </div>
</div>
<c:import url="../fragments/common-js.jsp"/>
<script>
    $("#btn-upload-file").on('click', () => {
        $("input[name=thumbnail]").trigger('click');
    });
    $("input[type=file]").on('change', (event) => {
        console.log(event.target.files[0]);
        if (event.target.files[0]) {
            let reader = new FileReader();
            reader.onload = (e) => {
                $("#preview-thumbnail").attr("src", e.target.result).attr("hidden", false);
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    });
</script>
</body>

</html>