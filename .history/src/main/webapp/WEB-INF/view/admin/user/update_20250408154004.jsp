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
                <title>Update User - Son IT</title>
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
                                <!-- Header section -->
                                <h1 class="mt-4">
                                    <i class="fas fa-user-edit me-2"></i>Update User
                                </h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item">
                                        <a href="/admin" class="text-decoration-none">
                                            <i class="fas fa-chart-line me-1"></i>Dashboard
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="/admin/user" class="text-decoration-none">
                                            <i class="fas fa-users me-1"></i>Users
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item active">
                                        <i class="fas fa-user-edit me-1"></i>Update
                                    </li>
                                </ol>

                                <div class="container py-4">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-8">
                                            <div class="card shadow-sm">
                                                <div class="card-header bg-primary text-white py-3">
                                                    <h5 class="card-title mb-0">
                                                        <i class="fas fa-user-edit me-2"></i>Update User Information
                                                    </h5>
                                                </div>
                                                <div class="card-body">
                                                    <form:form method="post" action="/admin/user/update"
                                                        modelAttribute="newUser" cssClass="row g-3">
                                                        <!-- Hidden ID field -->
                                                        <div class="mb-3" style="display: none;">
                                                            <form:input type="text" path="id" />
                                                        </div>

                                                        <!-- Email field -->
                                                        <div class="col-md-12">
                                                            <label class="form-label">
                                                                <i class="fas fa-envelope me-2"></i>Email Address
                                                            </label>
                                                            <form:input type="email" class="form-control bg-light"
                                                                path="email" disabled="true" />
                                                        </div>

                                                        <!-- Phone field -->
                                                        <div class="col-md-6">
                                                            <label class="form-label">
                                                                <i class="fas fa-phone me-2"></i>Phone Number
                                                            </label>
                                                            <form:input type="text" class="form-control" path="phone"
                                                                placeholder="Enter phone number" />
                                                        </div>

                                                        <!-- Full Name field -->
                                                        <div class="col-md-6">
                                                            <label class="form-label">
                                                                <i class="fas fa-user me-2"></i>Full Name
                                                            </label>
                                                            <form:input type="text" class="form-control" path="fullName"
                                                                placeholder="Enter full name" />
                                                        </div>

                                                        <!-- Address field -->
                                                        <div class="col-12">
                                                            <label class="form-label">
                                                                <i class="fas fa-map-marker-alt me-2"></i>Address
                                                            </label>
                                                            <form:input type="text" class="form-control" path="address"
                                                                placeholder="Enter address" />
                                                        </div>

                                                        <!-- Action buttons -->
                                                        <div class="col-12 mt-4">
                                                            <button type="submit" class="btn btn-primary">
                                                                <i class="fas fa-save me-2"></i>Save Changes
                                                            </button>
                                                            <a href="/admin/user" class="btn btn-secondary ms-2">
                                                                <i class="fas fa-times me-2"></i>Cancel
                                                            </a>
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

                    .form-control {
                        border-radius: 7px;
                        padding: 0.75rem 1rem;
                        border: 1px solid #d1d3e2;
                    }

                    .form-control:focus {
                        border-color: #4e73df;
                        box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
                    }

                    .btn {
                        padding: 0.75rem 1.5rem;
                        border-radius: 7px;
                        font-weight: 500;
                    }

                    .breadcrumb-item a {
                        color: #4e73df;
                    }

                    .breadcrumb-item a:hover {
                        color: #2e59d9;
                    }
                </style>
            </body>

            </html>