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
                <title>Detail User - Son IT</title>
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
                                <!-- Update header section -->
                                <h1 class="mt-4">
                                    <i class="fas fa-user me-2"></i>User Details
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
                                        <i class="fas fa-eye me-1"></i>View Detail
                                    </li>
                                </ol>

                                <div class="container py-4">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-8">
                                            <div class="card shadow-sm">
                                                <div class="card-header bg-primary text-white">
                                                    <h5 class="mb-0">
                                                        <i class="fas fa-info-circle me-2"></i>User Information
                                                    </h5>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row mb-4">
                                                        <div class="col-md-3 text-center">
                                                            <div class="avatar-circle mb-3">
                                                                <i class="fas fa-user-circle fa-5x text-primary"></i>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-9">
                                                            <div class="user-info">
                                                                <div class="info-item mb-3">
                                                                    <label class="text-muted mb-1">
                                                                        <i class="fas fa-hashtag me-2"></i>User ID
                                                                    </label>
                                                                    <p class="h5">${user.id}</p>
                                                                </div>
                                                                <div class="info-item mb-3">
                                                                    <label class="text-muted mb-1">
                                                                        <i class="fas fa-envelope me-2"></i>Email
                                                                        Address
                                                                    </label>
                                                                    <p class="h5">${user.email}</p>
                                                                </div>
                                                                <div class="info-item mb-3">
                                                                    <label class="text-muted mb-1">
                                                                        <i class="fas fa-user me-2"></i>Full Name
                                                                    </label>
                                                                    <p class="h5">${user.fullName}</p>
                                                                </div>
                                                                <div class="info-item mb-3">
                                                                    <label class="text-muted mb-1">
                                                                        <i
                                                                            class="fas fa-map-marker-alt me-2"></i>Address
                                                                    </label>
                                                                    <p class="h5">${user.address}</p>
                                                                </div>
                                                                <div class="info-item">
                                                                    <label class="text-muted mb-1">
                                                                        <i class="fas fa-user-tag me-2"></i>Role
                                                                    </label>
                                                                    <p class="h5">
                                                                        <span
                                                                            class="badge bg-${user.role.name == 'ADMIN' ? 'danger' : 'success'}">
                                                                            ${user.role.name}
                                                                        </span>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-footer bg-light">
                                                    <a href="/admin/user" class="btn btn-secondary">
                                                        <i class="fas fa-arrow-left me-2"></i>Back to List
                                                    </a>
                                                    <a href="/admin/user/update/${user.id}"
                                                        class="btn btn-warning ms-2">
                                                        <i class="fas fa-edit me-2"></i>Edit User
                                                    </a>
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
                    .avatar-circle {
                        width: 120px;
                        height: 120px;
                        background-color: #f8f9fa;
                        border-radius: 50%;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        margin: 0 auto;
                    }

                    .info-item label {
                        font-size: 0.875rem;
                        font-weight: 500;
                    }

                    .info-item p {
                        margin-bottom: 0;
                    }

                    .card {
                        border: none;
                        border-radius: 0.5rem;
                    }

                    .card-header {
                        border-radius: 0.5rem 0.5rem 0 0;
                    }

                    .card-footer {
                        border-radius: 0 0 0.5rem 0.5rem;
                    }
                </style>
            </body>

            </html>