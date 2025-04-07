<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title> Thanh toán - Laptopshop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Cart Page Start -->
                    <div class="container-fluid py-5">
                        <div class="container py-5">
                            <div class="mb-3">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Thông tin thanh toán</li>
                                    </ol>
                                </nav>
                            </div>

                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
<<<<<<< HEAD
                                            <th scope="col">Chọn</th>
=======
<<<<<<< HEAD
=======
                                            <th scope="col">Chọn</th>
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                            <th scope="col">Sản phẩm</th>
                                            <th scope="col">Tên</th>
                                            <th scope="col">Giá cả</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Thành tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${ empty cartDetails}">
                                            <tr>
                                                <td colspan="6">
                                                    Không có sản phẩm trong giỏ hàng
                                                </td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="cartDetail" items="${cartDetails}">

                                            <tr>
<<<<<<< HEAD
=======
<<<<<<< HEAD
                                                <th scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <img src="/images/product/${cartDetail.product.image}"
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                <td>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox"
                                                            value="${cartDetail.id}" id="checkbox-${cartDetail.id}"
                                                            name="itemCheckbox" checked onclick="updateSelectedItems()">
                                                        <label class="form-check-label" for="checkbox-${cartDetail.id}">
                                                        </label>
                                                    </div>
                                                </td>
                                                <th scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <img src="${cartDetail.product.image}"
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                            class="img-fluid me-5 rounded-circle"
                                                            style="width: 80px; height: 80px;" alt="">
                                                    </div>
                                                </th>
                                                <td>
<<<<<<< HEAD
                                                    <p class="mb-0 mt-4 text-truncate"
                                                        style="width: 270px; white-space: nowrap; overflow: hidden;">
=======
<<<<<<< HEAD
                                                    <p class="mb-0 mt-4">
=======
                                                    <p class="mb-0 mt-4 text-truncate"
                                                        style="width: 270px; white-space: nowrap; overflow: hidden;">
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                        <a href="/product/${cartDetail.product.id}" target="_blank">
                                                            ${cartDetail.product.name}
                                                        </a>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p class="mb-0 mt-4">
                                                        <fmt:formatNumber type="number" value="${cartDetail.price}" /> đ
                                                    </p>
                                                </td>
                                                <td>
                                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                                        <input type="text"
                                                            class="form-control form-control-sm text-center border-0"
                                                            value="${cartDetail.quantity}">
                                                    </div>
                                                </td>
                                                <td>
<<<<<<< HEAD
                                                    <p class="mb-0 mt-4 item-total"
                                                        data-cart-detail-id="${cartDetail.id}"
                                                        data-price="${cartDetail.price * cartDetail.quantity}">
=======
<<<<<<< HEAD
                                                    <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
=======
                                                    <p class="mb-0 mt-4 item-total"
                                                        data-cart-detail-id="${cartDetail.id}"
                                                        data-price="${cartDetail.price * cartDetail.quantity}">
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                        <fmt:formatNumber type="number"
                                                            value="${cartDetail.price * cartDetail.quantity}" /> đ
                                                    </p>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <c:if test="${not empty cartDetails}">
                                <form:form action="/place-order" method="post" modelAttribute="cart">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<<<<<<< HEAD
                                    <input type="hidden" id="selectedItems" name="selectedItems" value="" />
=======
<<<<<<< HEAD
=======
                                    <input type="hidden" id="selectedItems" name="selectedItems" value="" />
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                    <div class="mt-5 row g-4 justify-content-start">
                                        <div class="col-12 col-md-6">
                                            <div class="p-4 ">
                                                <h5>Thông Tin Người Nhận
                                                </h5>
                                                <div class="row">
                                                    <div class="col-12 form-group mb-3">
                                                        <label>Tên người nhận</label>
                                                        <input class="form-control" name="receiverName" required />
                                                    </div>
                                                    <div class="col-12 form-group mb-3">
                                                        <label>Địa chỉ người nhận</label>
                                                        <input class="form-control" name="receiverAddress" required />
                                                    </div>
                                                    <div class="col-12 form-group mb-3">
                                                        <label>Số điện thoại</label>
                                                        <input class="form-control" name="receiverPhone" required />
                                                    </div>
                                                    <div class="mt-4">
                                                        <i class="fas fa-arrow-left"></i>
                                                        <a href="/cart">Quay lại giỏ hàng</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-6">
                                            <div class="bg-light rounded">
                                                <div class="p-4">
                                                    <h1 class="display-6 mb-4">Thông Tin <span class="fw-normal">Thanh
                                                            Toán</span>
                                                    </h1>

                                                    <div class="d-flex justify-content-between">
                                                        <h5 class="mb-0 me-4">Phí vận chuyển</h5>
                                                        <div class="">
                                                            <p class="mb-0">0 đ</p>
                                                        </div>
                                                    </div>
                                                    <div class="mt-3 d-flex justify-content-between">
                                                        <h5 class="mb-0 me-4">Hình thức</h5>
                                                        <div class="">
                                                            <p class="mb-0">Thanh toán khi nhận hàng (COD)</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div
                                                    class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                    <h5 class="mb-0 ps-4 me-4">Tổng số tiền</h5>
<<<<<<< HEAD
                                                    <p class="mb-0 pe-4" id="totalPrice"
                                                        data-cart-total-price="${totalPrice}">
=======
<<<<<<< HEAD
                                                    <p class="mb-0 pe-4" data-cart-total-price="${totalPrice}">
=======
                                                    <p class="mb-0 pe-4" id="totalPrice"
                                                        data-cart-total-price="${totalPrice}">
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                        <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                    </p>
                                                </div>

<<<<<<< HEAD
                                                <button id="submitButton"
=======
<<<<<<< HEAD
                                                <button
=======
                                                <button id="submitButton"
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4">
                                                    Xác nhận thanh toán
                                                </button>

                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                            </c:if>

                        </div>
                    </div>
                    <!-- Cart Page End -->


                    <jsp:include page="../layout/footer.jsp" />


                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7

                    <!-- Checkbox Selection Script -->
                    <script>
                        function updateSelectedItems() {
                            // Get all checked checkboxes
                            var checkboxes = document.querySelectorAll('input[name="itemCheckbox"]:checked');

                            // Create a comma-separated list of selected item IDs
                            var selectedIds = Array.from(checkboxes).map(cb => cb.value).join(',');

                            // Update the hidden field with selected IDs
                            document.getElementById('selectedItems').value = selectedIds;

                            // Calculate total price based on selected items
                            var total = 0;
                            checkboxes.forEach(function (checkbox) {
                                var row = checkbox.closest('tr');
                                var priceElement = row.querySelector('.item-total');
                                var price = parseFloat(priceElement.getAttribute('data-price'));
                                total += price;
                            });

                            // Update total price display
                            var totalPriceElement = document.getElementById('totalPrice');
                            totalPriceElement.textContent = formatCurrency(total) + ' đ';

                            // Disable submit button if no items selected
                            document.getElementById('submitButton').disabled = checkboxes.length === 0;
                        }

                        // Format number as currency
                        function formatCurrency(amount) {
                            return new Intl.NumberFormat('vi-VN').format(amount);
                        }

                        // Initialize on page load
                        document.addEventListener('DOMContentLoaded', function () {
                            // Check all checkboxes by default
                            var checkboxes = document.querySelectorAll('input[name="itemCheckbox"]');
                            checkboxes.forEach(function (checkbox) {
                                checkbox.checked = true;
                            });

                            // Initialize selected items and total price
                            updateSelectedItems();
                        });
                    </script>
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                </body>

                </html>