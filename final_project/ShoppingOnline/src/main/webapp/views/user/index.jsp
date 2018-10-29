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
        User
    </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
          name='viewport'/>
    <c:import url="../fragments/common-css.jsp"/>
</head>

<body class="">
<div class="wrapper ">
    <c:import url="../fragments/sidebar.jsp">
        <c:param name="position" value="user"/>
    </c:import>
    <div class="main-panel">
        <c:import url="../fragments/navbar.jsp">
            <c:param name="navbarBrand" value="User"/>
            <c:param name="navbarUrl" value="/user"/>
        </c:import>
        <div class="content">
            <div class="container-fluid">
                <!-- your content here -->
                <div class="row">

                    <div class="col-md-6">
                        <a href="<c:url value="/user/create"/>" class="btn btn-primary btn-round">Add new</a>
                    </div>
                    <div class="col-md-6">
                        <form class="form-inline float-right" action="<c:url value="/user"/>" method="get">
                            <div class="col-md-4">
                                <select name="roleId" class="form-control">
                                    <option value="">All role</option>
                                    <c:forEach items="${roleList}" var="role">
                                        <option value="${role.id}" <c:if
                                                test="${roleId==role.id}"> selected </c:if>  >${role.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-8">
                                <span class="bmd-form-group">
                                    <div class="input-group no-border">
                                        <input type="text" name="search" value="${search}" class="form-control"
                                               placeholder="Search...">
                                        <input type="hidden" name="page" value="${page}"/>
                                        <button type="submit" class="btn btn-white btn-round btn-just-icon">
                                            <i class="material-icons">search</i>
                                        </button>
                                    </div>
                                </span>
                            </div>
                        </form>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header card-header-primary">
                                <h4 class="card-title">User List</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="text-primary">
                                        <tr>
                                            <td>#</td>
                                            <td>Username</td>
                                            <td>Role</td>
                                            <td></td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${userList}" var="user" varStatus="status">
                                            <tr data-category-id="${user.id}">
                                                <td>${status.count}</td>
                                                <td>${user.username}</td>
                                                <td>${user.role.name}</td>
                                                <td class="td-actions text-right">
                                                    <a href="<c:url value="/user/${user.id}"/>"
                                                       class="btn btn-default btn-link btn-sm">
                                                        <i class="material-icons">more</i>
                                                    </a>
                                                    <a href="<c:url value="/user/edit/${user.id}"/>"
                                                       rel="tooltip"
                                                       class="btn btn-primary btn-link btn-sm">
                                                        <i class="material-icons">edit</i>
                                                    </a>
                                                    <button type="button" rel="tooltip"
                                                            class="btn btn-danger btn-link btn-sm btn-delete-user"
                                                            data-toggle="modal" data-target="#deleteModal">
                                                        <i class="material-icons"
                                                           data-category-id="${user.id}">close</i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <c:choose>
                            <c:when test="${limit > 0 && page+1 > limit}">
                                <c:set var="nextPage" value="${limit}"/>
                            </c:when>
                            <c:when test="${limit == 0 && page+1 > limit}">
                                <c:set var="nextPage" value="0"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="nextPage" value="${page+1}"/>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${page-1 < 0}">
                                <c:set var="previousPage" value="0"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="previousPage" value="${page-1}"/>
                            </c:otherwise>
                        </c:choose>


                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a href="<c:url value="/user?search=${search}&page=${previousPage}&roleId=${roleId}"/>"
                                   class="page-link">
                                    <i class="material-icons">chevron_left</i>
                                </a>
                            </li>
                            <c:if test="${limit > 0}">
                                <c:forEach begin="0" end="${limit}" step="1" varStatus="status">
                                    <li class="page-item <c:if test="${page==status.index}">active</c:if>">
                                        <a class="page-link"
                                           href="<c:url value="/user?search=${search}&page=${status.index}&roleId=${roleId}"/>"> ${status.count} </a>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <li class="page-item">
                                <a href="<c:url value="/user?search=${search}&page=${nextPage}&roleId=${roleId}"/>"
                                   class="page-link">
                                    <i class="material-icons">chevron_right</i>
                                </a>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
        </div>
        <c:import url="../fragments/footer.jsp"/>
    </div>
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalTitle">Confirm Delete</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Are you sure want to delete this user?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                    <button type="button" value="" class="btn btn-danger btn-confirm-delete">Yes</button>
                </div>
            </div>
        </div>
    </div>
</div>
<c:import url="../fragments/common-js.jsp"/>
</body>
<script>
    $(".btn-delete-user").on('click', (event) => {
        let id = $(event.target).data('category-id');
        $(".btn-confirm-delete").val(id);
    });
    $(".btn-confirm-delete").on('click', (event) => {
        let target = $(event.target);
        let id = target.val();
        $.ajax({
            url: "${pageContext.request.contextPath}/api/user/" + id,
            method: "Delete",
            success: (data, textStatus, xhr) => {
                console.log(xhr.status);
                console.log(textStatus);
                $("#deleteModal").modal('toggle');
                let type = "";
                if (xhr.status === 200) {
                    type = "success";
                } else {
                    type = "danger";
                }
                $.notify({
                    message: data,
                }, {
                    type: type,
                    placement: {
                        from: "bottom",
                        align: "center"
                    },
                    animate: {
                        enter: "animated fadeInUp",
                        exit: "animated fadeOutDown"
                    },
                    delay: 5000
                });
                if (xhr.status === 200) {
                    setTimeout(() => {
                        location.reload();
                    }, 1000);
                }
            }
        });
    });
</script>
</html>