<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Laptopshop Register" />
                <meta name="author" content="Son IT" />
                <title>Register - Laptopshop</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="register-page">
                <div id="layoutAuthentication">
                    <div id="layoutAuthentication_content">
                        <main>
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-7">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <!-- Logo Section -->
                                            <div class="text-center mt-4">
                                                <i class="fas fa-laptop fa-3x text-primary mb-2"></i>
                                                <h3 class="font-weight-light">Create New Account</h3>
                                                <p class="text-muted">Join our community today!</p>
                                            </div>

                                            <div class="card-body">
                                                <form:form method="post" action="/register"
                                                    modelAttribute="registerUser">
                                                    <c:set var="errorPassword">
                                                        <form:errors path="confirmPassword"
                                                            cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorEmail">
                                                        <form:errors path="email" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorFirstName">
                                                        <form:errors path="firstName" cssClass="invalid-feedback" />
                                                    </c:set>

                                                    <!-- Name Fields -->
                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <form:input
                                                                    class="form-control ${not empty errorFirstName ? 'is-invalid' : ''}"
                                                                    type="text" path="firstName"
                                                                    placeholder="Enter your first name" />
                                                                <label><i class="fas fa-user me-2"></i>First
                                                                    name</label>
                                                                ${errorFirstName}
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-floating">
                                                                <form:input class="form-control" type="text"
                                                                    path="lastName"
                                                                    placeholder="Enter your last name" />
                                                                <label><i class="fas fa-user me-2"></i>Last name</label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Email Field -->
                                                    <div class="form-floating mb-3">
                                                        <form:input
                                                            class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                            type="email" path="email" placeholder="name@example.com" />
                                                        <label><i class="fas fa-envelope me-2"></i>Email address</label>
                                                        ${errorEmail}
                                                    </div>

                                                    <!-- Password Fields -->
                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <form:input
                                                                    class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                                    type="password" path="password"
                                                                    placeholder="Create a password" />
                                                                <label><i class="fas fa-lock me-2"></i>Password</label>
                                                                ${errorPassword}
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <form:input class="form-control" type="password"
                                                                    path="confirmPassword"
                                                                    placeholder="Confirm password" />
                                                                <label><i class="fas fa-lock me-2"></i>Confirm
                                                                    Password</label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- Submit Button -->
                                                    <div class="mt-4 mb-0">
                                                        <button class="btn btn-primary btn-lg w-100">
                                                            <i class="fas fa-user-plus me-2"></i>Create Account
                                                        </button>
                                                    </div>
                                                </form:form>
                                            </div>

                                            <!-- Footer -->
                                            <div class="card-footer bg-light py-3">
                                                <div class="text-center">
                                                    <a href="/login" class="text-decoration-none">
                                                        <i class="fas fa-sign-in-alt me-2"></i>Already have an account?
                                                        Login
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
                    .register-page {
                        background: url('https://source.unsplash.com/1920x1080/?laptop,technology') no-repeat center center fixed;
                        background-size: cover;
                        min-height: 100vh;
                        position: relative;
                    }

                    .register-page::before {
                        content: '';
                        position: absolute;
                        top: 0;
                        right: 0;
                        bottom: 0;
                        left: 0;
                        background: linear-gradient(135deg, rgba(78, 115, 223, 0.3) 0%, rgba(34, 74, 190, 0.3) 100%);
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

                    .card-footer {
                        border-radius: 0 0 1rem 1rem;
                    }

                    .text-muted {
                        font-size: 0.875rem;
                    }
                </style>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>