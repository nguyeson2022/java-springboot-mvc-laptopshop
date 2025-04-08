<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <!-- Header section -->
                                    <h1 class="mt-4">
                                        <i class="fas fa-laptop me-2"></i>Product Details
                                    </h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item">
                                            <a href="/admin" class="text-decoration-none">
                                                <i class="fas fa-chart-line me-1"></i>Dashboard
                                            </a>
                                        </li>
                                        <li class="breadcrumb-item">
                                            <a href="/admin/product" class="text-decoration-none">
                                                <i class="fas fa-laptop me-1"></i>Products
                                            </a>
                                        </li>
                                        <li class="breadcrumb-item active">
                                            <i class="fas fa-eye me-1"></i>View Detail
                                        </li>
                                    </ol>

                                    <div class="container py-4">
                                        <div class="row">
                                            <!-- Product Image Card -->
                                            <div class="col-md-4">
                                                <div class="card shadow-sm">
                                                    <div class="card-header bg-primary text-white">
                                                        <h5 class="mb-0">
                                                            <i class="fas fa-image me-2"></i>Product Image
                                                        </h5>
                                                    </div>
                                                    <div class="card-body p-0">
                                                        <img src="${product.image}" class="img-fluid"
                                                            alt="${product.name}">
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Product Information Card -->
                                            <div class="col-md-8">
                                                <div class="card shadow-sm">
                                                    <div class="card-header bg-primary text-white">
                                                        <h5 class="mb-0">
                                                            <i class="fas fa-info-circle me-2"></i>Product Information
                                                        </h5>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="info-item mb-3">
                                                                    <label class="text-muted mb-1">
                                                                        <i class="fas fa-hashtag me-2"></i>Product ID
                                                                    </label>
                                                                    <p class="h5">#${product.id}</p>
                                                                </div>
                                                                <div class="info-item mb-3">
                                                                    <label class="text-muted mb-1">
                                                                        <i class="fas fa-tag me-2"></i>Product Name
                                                                    </label>
                                                                    <p class="h5">${product.name}</p>
                                                                </div>
                                                                <div class="info-item mb-3">
                                                                    <label class="text-muted mb-1">
                                                                        <i class="fas fa-dollar-sign me-2"></i>Price
                                                                    </label>
                                                                    <p class="h5">
                                                                        <span class="badge bg-success fs-6">
                                                                            <fmt:formatNumber type="number"
                                                                                pattern="#,###"
                                                                                value="${product.price}" /> VNĐ
                                                                        </span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="info-item mb-3">
                                                                    <label class="text-muted mb-1">
                                                                        <i class="fas fa-boxes me-2"></i>Quantity
                                                                    </label>
                                                                    <p class="h5">${product.quantity}</p>
                                                                </div>
                                                                <div class="info-item mb-3">
                                                                    <label class="text-muted mb-1">
                                                                        <i class="fas fa-industry me-2"></i>Factory
                                                                    </label>
                                                                    <p class="h5">${product.factory}</p>
                                                                </div>
                                                                <div class="info-item">
                                                                    <label class="text-muted mb-1">
                                                                        <i class="fas fa-users me-2"></i>Target
                                                                    </label>
                                                                    <p class="h5">${product.target}</p>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <hr />

                                                        <div class="row mt-3">
                                                            <div class="col-12">
                                                                <label class="text-muted mb-1">
                                                                    <i class="fas fa-align-left me-2"></i>Short
                                                                    Description
                                                                </label>
                                                                <p class="h6">${product.shortDesc}</p>
                                                            </div>
                                                        </div>

                                                        <div class="row mt-3">
                                                            <div class="col-12">
                                                                <label class="text-muted mb-1">
                                                                    <i class="fas fa-file-alt me-2"></i>Detailed
                                                                    Description
                                                                </label>
                                                                <p class="h6">${product.detailDesc}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-light">
                                                        <a href="/admin/product" class="btn btn-secondary">
                                                            <i class="fas fa-arrow-left me-2"></i>Back to List
                                                        </a>
                                                        <a href="/admin/product/update/${product.id}"
                                                            class="btn btn-warning ms-2">
                                                            <i class="fas fa-edit me-2"></i>Edit Product
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>

                            <!-- Add custom styles -->
                            <style>
                                .card {
                                    border: none;
                                    border-radius: 10px;
                                    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                                }

                                .card-header {
                                    border-radius: 10px 10px 0 0;
                                }

                                .info-item label {
                                    font-size: 0.875rem;
                                    font-weight: 500;
                                    color: #6c757d;
                                }

                                .info-item p {
                                    margin-bottom: 0;
                                }

                                .badge {
                                    font-weight: 500;
                                    padding: 0.5rem 1rem;
                                }

                                .breadcrumb-item a {
                                    color: #4e73df;
                                    text-decoration: none;
                                }

                                .breadcrumb-item a:hover {
                                    color: #2e59d9;
                                }

                                .btn {
                                    padding: 0.5rem 1rem;
                                    border-radius: 7px;
                                }
                            </style>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>

                </body>

                </html>