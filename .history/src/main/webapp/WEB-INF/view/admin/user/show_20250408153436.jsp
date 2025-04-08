<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Son IT - Dự án laptopshop" />
            <meta name="author" content="Son IT" />
            <title>Dashboard - Son IT</title>
            <link href="/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">
                                <i class="fas fa-users me-2"></i>Manage Users
                            </h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item">
                                    <a href="/admin"><i class="fas fa-chart-line me-1"></i>Dashboard</a>
                                </li>
                                <li class="breadcrumb-item active">
                                    <i class="fas fa-users me-1"></i>Users
                                </li>
                            </ol>
                            <div class="mt-5">
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex justify-content-between">
                                            <h3><i class="fas fa-table me-2"></i>Table users</h3>
                                            <a href="/admin/user/create" class="btn btn-primary">
                                                <i class="fas fa-user-plus me-2"></i>Create a user
                                            </a>
                                        </div>

                                        <hr />
                                        <table class=" table table-bordered table-hover">
                                            <thead>
                                                <tr>
                                                    <th><i class="fas fa-hashtag me-1"></i>ID</th>
                                                    <th><i class="fas fa-envelope me-1"></i>Email</th>
                                                    <th><i class="fas fa-user me-1"></i>Full Name</th>
                                                    <th><i class="fas fa-user-tag me-1"></i>Role</th>
                                                    <th><i class="fas fa-cogs me-1"></i>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="user" items="${users1}">

                                                    <tr>
                                                        <th>${user.id}</th>
                                                        <td>${user.email}</td>
                                                        <td>${user.fullName}</td>
                                                        <td>${user.role.name}</td>
                                                        <td>
                                                            <a href="/admin/user/${user.id}" class="btn btn-success">
                                                                <i class="fas fa-eye me-1"></i>View
                                                            </a>
                                                            <a href="/admin/user/update/${user.id}"
                                                                class="btn btn-warning mx-2">
                                                                <i class="fas fa-edit me-1"></i>Update
                                                            </a>
                                                            <a href="/admin/user/delete/${user.id}"
                                                                class="btn btn-danger">
                                                                <i class="fas fa-trash-alt me-1"></i>Delete
                                                            </a>
                                                        </td>
                                                    </tr>

                                                </c:forEach>

                                            </tbody>
                                        </table>
                                        <nav aria-label="Page navigation">
                                            <ul class="pagination justify-content-center">
                                                <li class="page-item">
                                                    <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                        href="/admin/user?page=${currentPage - 1}"
                                                        aria-label="Previous">
                                                        <i class="fas fa-angle-double-left"></i>
                                                    </a>
                                                </li>
                                                <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                    <li class="page-item">
                                                        <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                            href="/admin/user?page=${loop.index + 1}">
                                                            ${loop.index + 1}
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                                <li class="page-item">
                                                    <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                        href="/admin/user?page=${currentPage + 1}" aria-label="Next">
                                                        <i class="fas fa-angle-double-right"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </main>
                    <jsp:include page="../layout/footer.jsp" />
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="/js/scripts.js"></script>

        </body>

        </html>