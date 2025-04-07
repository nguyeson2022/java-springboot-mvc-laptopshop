<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<<<<<<< HEAD
                <meta name="description" content="Son IT - Dự án laptopshop" />
                <meta name="author" content="Son IT" />
                <title>Delete Product - Son IT</title>
=======
<<<<<<< HEAD
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Delete User - Hỏi Dân IT</title>
=======
                <meta name="description" content="Son IT - Dự án laptopshop" />
                <meta name="author" content="Son IT" />
                <title>Delete Product - Son IT</title>
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
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
<<<<<<< HEAD
=======
<<<<<<< HEAD
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Users</li>
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                <h1 class="mt-4">Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/product">Product</a></li>
                                    <li class="breadcrumb-item active">Delete</li>
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                </ol>
                                <div class=" mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
<<<<<<< HEAD
                                                <h3>Delete the product with id = ${id}</h3>
=======
<<<<<<< HEAD
                                                <h3>Delete the user with id = ${id}</h3>
=======
                                                <h3>Delete the product with id = ${id}</h3>
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                            </div>

                                            <hr />
                                            <div class="alert alert-danger">
<<<<<<< HEAD
=======
<<<<<<< HEAD
                                                Are you sure to delete this user ?
                                            </div>
                                            <form:form method="post" action="/admin/user/delete"
                                                modelAttribute="newUser">
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                Are you sure to delete this product ?
                                            </div>
                                            <form:form method="post" action="/admin/product/delete"
                                                modelAttribute="newProduct">
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                <div class="mb-3" style="display: none;">
                                                    <label class="form-label">Id:</label>
                                                    <form:input value="${id}" type="text" class="form-control"
                                                        path="id" />
                                                </div>
                                                <button class="btn btn-danger">Confirm</button>
                                            </form:form>

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