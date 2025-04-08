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
                    <title>Update Order - Son IT</title>
                    <link href="/css/styles.css" rel="stylesheet" />

                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                                        <i class="fas fa-shopping-cart me-2"></i>Orders
                                    </h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item">
                                            <a href="/admin" class="text-decoration-none">
                                                <i class="fas fa-chart-line me-1"></i>Dashboard
                                            </a>
                                        </li>
                                        <li class="breadcrumb-item">
                                            <a href="/admin/order" class="text-decoration-none">
                                                <i class="fas fa-shopping-cart me-1"></i>Orders
                                            </a>
                                        </li>
                                        <li class="breadcrumb-item active">
                                            <i class="fas fa-edit me-1"></i>Update
                                        </li>
                                    </ol>

                                    <div class="container py-4">
                                        <div class="row justify-content-center">
                                            <div class="col-lg-8">
                                                <div class="card shadow-sm">
                                                    <div class="card-header bg-primary text-white py-3">
                                                        <h5 class="card-title mb-0">
                                                            <i class="fas fa-edit me-2"></i>Update Order #${newOrder.id}
                                                        </h5>
                                                    </div>
                                                    <div class="card-body">
                                                        <form:form method="post" action="/admin/order/update"
                                                            modelAttribute="newOrder">
                                                            <form:input type="hidden" path="id" />

                                                            <div class="row g-4">
                                                                <!-- Order Summary -->
                                                                <div class="col-12">
                                                                    <div class="alert alert-info">
                                                                        <div
                                                                            class="d-flex justify-content-between align-items-center">
                                                                            <div>
                                                                                <i class="fas fa-info-circle me-2"></i>
                                                                                <strong>Order ID:</strong>
                                                                                #${newOrder.id}
                                                                            </div>
                                                                            <div>
                                                                                <i class="fas fa-dollar-sign me-2"></i>
                                                                                <strong>Total Price:</strong>
                                                                                <span class="badge bg-success fs-6">
                                                                                    <fmt:formatNumber type="number"
                                                                                        value="${newOrder.totalPrice}" />
                                                                                    VNĐ
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <!-- Customer Info -->
                                                                <div class="col-md-6">
                                                                    <label class="form-label">
                                                                        <i class="fas fa-user me-2"></i>Customer
                                                                    </label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-text bg-light">
                                                                            <i class="fas fa-user"></i>
                                                                        </span>
                                                                        <form:input type="text"
                                                                            class="form-control bg-light"
                                                                            path="user.fullName" disabled="true" />
                                                                    </div>
                                                                </div>

                                                                <!-- Order Status -->
                                                                <div class="col-md-6">
                                                                    <label class="form-label">
                                                                        <i class="fas fa-tasks me-2"></i>Status
                                                                    </label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-text">
                                                                            <i class="fas fa-flag"></i>
                                                                        </span>
                                                                        <form:select class="form-select" path="status">
                                                                            <form:option value="PENDING"
                                                                                cssClass="text-warning">
                                                                                <i class="fas fa-clock"></i> PENDING
                                                                            </form:option>
                                                                            <form:option value="SHIPPING"
                                                                                cssClass="text-primary">
                                                                                <i class="fas fa-shipping-fast"></i>
                                                                                SHIPPING
                                                                            </form:option>
                                                                            <form:option value="COMPLETE"
                                                                                cssClass="text-success">
                                                                                <i class="fas fa-check-circle"></i>
                                                                                COMPLETE
                                                                            </form:option>
                                                                            <form:option value="CANCEL"
                                                                                cssClass="text-danger">
                                                                                <i class="fas fa-times-circle"></i>
                                                                                CANCEL
                                                                            </form:option>
                                                                        </form:select>
                                                                    </div>
                                                                </div>

                                                                <!-- Action Buttons -->
                                                                <div class="col-12 mt-4 text-end">
                                                                    <a href="/admin/order" class="btn btn-secondary">
                                                                        <i class="fas fa-times me-2"></i>Cancel
                                                                    </a>
                                                                    <button type="submit" class="btn btn-primary ms-2">
                                                                        <i class="fas fa-save me-2"></i>Save Changes
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </form:form>
                                                    </div>
                                                </div>
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

                    <!-- Add custom styles -->
                    <style>
                        .card {
                            border: none;
                            border-radius: 10px;
                            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                        }

                        .card-header {
                            border-radius: 10px 10px 0 0;
                        }

                        .form-label {
                            font-weight: 500;
                            color: #5a5c69;
                        }

                        .input-group-text {
                            border: 1px solid #d1d3e2;
                        }

                        .form-control,
                        .form-select {
                            border-radius: 0 7px 7px 0;
                            padding: 0.75rem 1rem;
                            border: 1px solid #d1d3e2;
                        }

                        .form-control:disabled {
                            background-color: #f8f9fc;
                        }

                        .btn {
                            padding: 0.75rem 1.5rem;
                            border-radius: 7px;
                            font-weight: 500;
                        }

                        .alert {
                            border-radius: 7px;
                        }

                        .breadcrumb-item a {
                            color: #4e73df;
                        }

                        .breadcrumb-item a:hover {
                            color: #2e59d9;
                            text-decoration: none;
                        }
                    </style>
                </body>

                </html>