<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                                    <i class="fas fa-laptop me-2"></i>Manage Products
                                </h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item">
                                        <a href="/admin"><i class="fas fa-chart-line me-1"></i>Dashboard</a>
                                    </li>
                                    <li class="breadcrumb-item active">
                                        <i class="fas fa-laptop me-1"></i>Product
                                    </li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3><i class="fas fa-table me-2"></i>Table products</h3>
                                                <a href="/admin/product/create" class="btn btn-primary">
                                                    <i class="fas fa-plus me-2"></i>Create a product
                                                </a>
                                            </div>

                                            <hr />
                                            <table class=" table table-bordered table-hover">
                                                <thead>
                                                    <tr>
                                                        <th><i class="fas fa-hashtag me-1"></i>ID</th>
                                                        <th><i class="fas fa-laptop me-1"></i>Name</th>
                                                        <th><i class="fas fa-tag me-1"></i>Price</th>
                                                        <th><i class="fas fa-industry me-1"></i>Factory</th>
                                                        <th><i class="fas fa-cogs me-1"></i>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="product" items="${products}">
                                                        <tr>
                                                            <th>${product.id}</th>
                                                            <td style="width: 50%;">${product.name}</td>
                                                            <td>
                                                                <fmt:formatNumber type="number"
                                                                    value="${product.price}" /> đ
                                                            </td>
                                                            <td>${product.factory}</td>
                                                            <td>
                                                                <a href="/admin/product/${product.id}"
                                                                    class="btn btn-success">
                                                                    <i class="fas fa-eye me-1"></i>View
                                                                </a>
                                                                <a href="/admin/product/update/${product.id}"
                                                                    class="btn btn-warning mx-2">
                                                                    <i class="fas fa-edit me-1"></i>Update
                                                                </a>
                                                                <a href="/admin/product/delete/${product.id}"
                                                                    class="btn btn-danger">
                                                                    <i class="fas fa-trash-alt me-1"></i>Delete
                                                                </a>
                                                            </td>
                                                        </tr>

                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                            <c:if test="${totalPages > 1}">
                                                <nav aria-label="Page navigation">
                                                    <ul class="pagination justify-content-center">
                                                        <!-- First and Previous -->
                                                        <c:if test="${currentPage > 1}">
                                                            <li class="page-item">
                                                                <a class="page-link" href="/admin/product?page=1"
                                                                    title="Trang đầu">
                                                                    <i class="fas fa-angle-double-left"></i>
                                                                </a>
                                                            </li>
                                                            <li class="page-item">
                                                                <a class="page-link"
                                                                    href="/admin/product?page=${currentPage - 1}"
                                                                    title="Trang trước">
                                                                    <i class="fas fa-angle-left"></i>
                                                                </a>
                                                            </li>
                                                        </c:if>

                                                        <!-- Calculate start and end page -->
                                                        <c:choose>
                                                            <c:when test="${currentPage <= 3}">
                                                                <c:set var="startPage" value="1" />
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var="startPage" value="${currentPage - 2}" />
                                                            </c:otherwise>
                                                        </c:choose>

                                                        <c:choose>
                                                            <c:when test="${currentPage + 2 >= totalPages}">
                                                                <c:set var="endPage" value="${totalPages}" />
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var="endPage" value="${currentPage + 2}" />
                                                            </c:otherwise>
                                                        </c:choose>

                                                        <!-- Numbered pages -->
                                                        <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                                                <a class="page-link" href="/admin/product?page=${i}">
                                                                    ${i}
                                                                </a>
                                                            </li>
                                                        </c:forEach>

                                                        <!-- Next and Last -->
                                                        <c:if test="${currentPage < totalPages}">
                                                            <li class="page-item">
                                                                <a class="page-link"
                                                                    href="/admin/product?page=${currentPage + 1}"
                                                                    title="Trang sau">
                                                                    <i class="fas fa-angle-right"></i>
                                                                </a>
                                                            </li>
                                                            <li class="page-item">
                                                                <a class="page-link"
                                                                    href="/admin/product?page=${totalPages}"
                                                                    title="Trang cuối">
                                                                    <i class="fas fa-angle-double-right"></i>
                                                                </a>
                                                            </li>
                                                        </c:if>
                                                    </ul>
                                                </nav>
                                            </c:if>

                                            <!-- Add CSS for pagination -->
                                            <style>
                                                .pagination {
                                                    margin: 20px 0;
                                                }

                                                .pagination .page-link {
                                                    padding: 0.5rem 0.75rem;
                                                    border-radius: 0;
                                                }

                                                .pagination .page-item.active .page-link {
                                                    background-color: #0d6efd;
                                                    border-color: #0d6efd;
                                                    color: white;
                                                }
                                            </style>
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