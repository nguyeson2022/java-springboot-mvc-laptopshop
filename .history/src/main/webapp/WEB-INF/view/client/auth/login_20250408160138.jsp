<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Laptopshop Login" />
                <meta name="author" content="Son IT" />
                <title>Login - Laptopshop</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <!-- Update the body class -->

            <body class="login-page">
                <div id="layoutAuthentication">
                    <div id="layoutAuthentication_content">
                        <main>
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-5">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <!-- Logo Section -->
                                            <div class="text-center mt-4">
                                                <i class="fas fa-laptop fa-3x text-primary mb-2"></i>
                                                <h3 class="font-weight-light">Welcome Back!</h3>
                                                <p class="text-muted">Sign in to continue to Laptopshop</p>
                                            </div>

                                            <div class="card-body">
                                                <form method="post" action="/login">
                                                    <!-- Alert Messages -->
                                                    <c:if test="${param.error != null}">
                                                        <div class="alert alert-danger alert-dismissible fade show"
                                                            role="alert">
                                                            <i class="fas fa-exclamation-circle me-2"></i>
                                                            Invalid email or password.
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="alert"></button>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${param.logout != null}">
                                                        <div class="alert alert-success alert-dismissible fade show"
                                                            role="alert">
                                                            <i class="fas fa-check-circle me-2"></i>
                                                            Logout successful.
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="alert"></button>
                                                        </div>
                                                    </c:if>

                                                    <!-- Email Input -->
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" type="email" name="username"
                                                            required placeholder="name@example.com" />
                                                        <label><i class="fas fa-envelope me-2"></i>Email address</label>
                                                    </div>

                                                    <!-- Password Input -->
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" type="password" name="password"
                                                            required placeholder="Password" />
                                                        <label><i class="fas fa-lock me-2"></i>Password</label>
                                                    </div>

                                                    <!-- CSRF Token -->
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />

                                                    <!-- Login Button -->
                                                    <div class="d-grid gap-2 mt-4">
                                                        <button class="btn btn-primary btn-lg">
                                                            <i class="fas fa-sign-in-alt me-2"></i>Login
                                                        </button>
                                                    </div>
                                                </form>
                                            </div>

                                            <!-- Footer -->
                                            <div class="card-footer bg-light py-3">
                                                <div class="text-center">
                                                    <a href="/register" class="text-decoration-none">
                                                        <i class="fas fa-user-plus me-2"></i>Need an account? Sign up!
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                </div>

                <!-- Custom styles -->
                <style>
                    .bg-gradient-primary {
                        background: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
                    }

                    .card {
                        border: none;
                        border-radius: 1rem;
                    }

                    .card-body {
                        padding: 2rem;
                    }

                    .form-floating input {
                        border-radius: 0.5rem;
                        border: 1px solid #d1d3e2;
                    }

                    .form-floating input:focus {
                        border-color: #4e73df;
                        box-shadow: 0 0 0 0.25rem rgba(78, 115, 223, 0.25);
                    }

                    .btn-primary {
                        border-radius: 0.5rem;
                        padding: 0.75rem;
                        font-weight: 500;
                    }

                    .alert {
                        border-radius: 0.5rem;
                    }

                    .text-muted {
                        font-size: 0.875rem;
                    }

                    /* Add this to your custom styles section */

                    .login-page {
                        background: url('https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d') no-repeat center center fixed;
                        background-size: contain;
                        /* Thay đổi từ cover thành contain */
                        min-height: 100vh;
                        position: relative;
                        background-color: #f8f9fc;
                        /* Thêm màu nền phụ */
                    }

                    .login-page::before {
                        content: '';
                        position: absolute;
                        top: 0;
                        right: 0;
                        bottom: 0;
                        left: 0;
                        /* Giảm độ đậm của gradient overlay */
                        background: linear-gradient(135deg,
                                rgba(78, 115, 223, 0.3) 0%,
                                rgba(34, 74, 190, 0.3) 100%);
                        z-index: 1;
                    }


                    #layoutAuthentication {
                        position: relative;
                        z-index: 2;
                    }

                    .card {
                        border: none;
                        border-radius: 1rem;
                        backdrop-filter: blur(10px);
                        background-color: rgba(255, 255, 255, 0.95);
                        box-shadow: 0 0 40px rgba(0, 0, 0, 0.2);
                    }
                </style>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>