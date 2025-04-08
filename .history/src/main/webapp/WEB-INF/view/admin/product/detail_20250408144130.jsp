<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Son IT - Dự án laptopshop" />
                <meta name="author" content="Son IT" />
                <title>Detail Product - Son IT</title>
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
                                    <i class="fas fa-laptop me-2"></i>Products
                                </h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item">
                                        <a href="/admin"><i class="fas fa-chart-line me-1"></i>Dashboard</a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="/admin/product"><i class="fas fa-laptop me-1"></i>Product</a>
                                    </li>
                                    <li class="breadcrumb-item active">
                                        <i class="fas fa-eye me-1"></i>View detail
                                    </li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Product detail with id = ${id}</h3>
                                            </div>

                                            <hr />

                                            <div class="card" style="width: 20%">
                                                <img class="card-img-top" src="${product.image}" alt="Card image cap">

                                                <div class="card-header">
                                                    <i class="fas fa-info-circle me-1"></i>Product information
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item"><i class="fas fa-hashtag me-1"></i>ID:
                                                        ${product.id}</li>
                                                    <li class="list-group-item"><i class="fas fa-tag me-1"></i>Name:
                                                        ${product.name}</li>
                                                    <li class="list-group-item"><i
                                                            class="fas fa-dollar-sign me-1"></i>Price: ${product.price}
                                                        <fmt:formatNumber type="number" value="${product.price}" />
                                                        đ
                                                    </li>
                                                </ul>
                                            </div>
                                            <a href="/admin/product" class="btn btn-success mt-3">
                                                <i class="fas fa-arrow-left me-1"></i>Back
                                            </a>

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