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
                <title>Delete Order - Son IT</title>
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
                                    <i class="fas fa-trash-alt me-2"></i>Delete Order
                                </h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item">
                                        <a href="/admin"><i class="fas fa-chart-line me-1"></i>Dashboard</a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="/admin/order"><i class="fas fa-shopping-cart me-1"></i>Order</a>
                                    </li>
                                    <li class="breadcrumb-item active">
                                        <i class="fas fa-trash me-1"></i>Delete
                                    </li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3><i class="fas fa-exclamation-triangle text-danger me-2"></i>Delete
                                                    order #${id}</h3>
                                            </div>

                                            <hr />
                                            <div class="alert alert-danger">
                                                <i class="fas fa-exclamation-circle me-2"></i>Are you sure to delete
                                                this order?
                                            </div>
                                            <form:form method="post" action="/admin/order/delete"
                                                modelAttribute="newOrder">
                                                <div class="mb-3" style="display: none;">
                                                    <label class="form-label">Id:</label>
                                                    <form:input value="${id}" type="text" class="form-control"
                                                        path="id" />
                                                </div>
                                                <button class="btn btn-danger">
                                                    <i class="fas fa-trash-alt me-2"></i>Confirm Delete
                                                </button>
                                                <a href="/admin/order" class="btn btn-secondary ms-2">
                                                    <i class="fas fa-arrow-left me-2"></i>Cancel
                                                </a>
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