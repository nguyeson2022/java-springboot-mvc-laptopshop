<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title> Sản Phẩm - Laptopshop</title>
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
                    <style>
                        .page-link.disabled {
                            color: var(--bs-pagination-disabled-color);
                            pointer-events: none;
                            background-color: var(--bs-pagination-disabled-bg);
                        }

                        .truncate-multiline {
                            display: -webkit-box;
                            -webkit-line-clamp: 2;
                            /* Giới hạn 2 dòng */
                            -webkit-box-orient: vertical;
                            overflow: hidden;
                        }

                        .pagination-container {
                            display: flex;
                            justify-content: center;
                            margin: 20px 0;
                        }

                        .pagination {
                            display: flex;
                            gap: 5px;
                        }

                        .page-link {
                            padding: 8px 12px;
                            border: 1px solid #ddd;
                            color: #333;
                            text-decoration: none;
                            border-radius: 4px;
                        }

                        .page-link:hover {
                            background-color: #f8f9fa;
                        }

                        .page-link.active {
                            background-color: #007bff;
                            color: white;
                            border-color: #007bff;
                        }
                    </style>
                    <script>
                        function handleSearch(keyword) {
                            const products = document.querySelectorAll('.fruite-item');
                            const searchTerm = keyword.toLowerCase().trim();
                            let hasResults = false;

                            products.forEach(product => {
                                const productName = product.querySelector('h4').textContent.toLowerCase();
                                const productDesc = product.querySelector('p').textContent.toLowerCase();
                                const productContainer = product.closest('.col-md-6');

                                if (searchTerm === '' ||
                                    productName.includes(searchTerm) ||
                                    productDesc.includes(searchTerm)) {
                                    productContainer.style.display = 'block';
                                    hasResults = true;
                                } else {
                                    productContainer.style.display = 'none';
                                }
                            });

                            // Hiển thị thông báo không tìm thấy
                            const noResultsMsg = document.getElementById('noResults');
                            if (!hasResults && searchTerm !== '') {
                                if (!noResultsMsg) {
                                    const msg = document.createElement('div');
                                    msg.id = 'noResults';
                                    msg.className = 'col-12 text-center mt-4';
                                    msg.innerHTML = `Không tìm thấy sản phẩm nào với từ khóa "${keyword}"`;
                                    document.querySelector('.row.g-4').appendChild(msg);
                                }
                            } else if (noResultsMsg) {
                                noResultsMsg.remove();
                            }
                        }
                        document.addEventListener("DOMContentLoaded", function () {
                            const searchInput = document.getElementById("searchInput");
                            const voiceSearchBtn = document.getElementById("voiceSearchBtn");

                            // Add event listener for Enter key
                            searchInput.addEventListener("keypress", function (event) {
                                if (event.key === "Enter") {
                                    event.preventDefault();
                                    const keyword = searchInput.value.trim();
                                    if (keyword) {
                                        // Redirect with search parameter
                                        window.location.href = `/products?keyword=${keyword}`;
                                    }
                                }
                            });

                            if ('webkitSpeechRecognition' in window) {
                                const recognition = new webkitSpeechRecognition();
                                recognition.continuous = false;
                                recognition.lang = 'vi-VN'; // Nhận diện tiếng Việt
                                recognition.interimResults = false;

                                voiceSearchBtn.addEventListener("click", function () {
                                    recognition.start();
                                    voiceSearchBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i>'; // Hiển thị loading
                                });

                                recognition.onresult = function (event) {
                                    const transcript = event.results[0][0].transcript.trim().toLowerCase();
                                    searchInput.value = transcript;
                                    console.log("Bạn nói: " + transcript);

                                    filterProducts(transcript); // Gọi ngay hàm lọc sản phẩm
                                };

                                recognition.onspeechend = function () {
                                    recognition.stop();
                                    voiceSearchBtn.innerHTML = '<i class="fas fa-microphone"></i>';
                                };

                                recognition.onerror = function (event) {
                                    console.error("Lỗi nhận diện giọng nói:", event.error);
                                    alert("Không thể nhận diện giọng nói, vui lòng thử lại.");
                                    voiceSearchBtn.innerHTML = '<i class="fas fa-microphone"></i>';
                                };
                            } else {
                                alert("Trình duyệt không hỗ trợ nhận diện giọng nói!");
                            }
                        });

                        // Hàm lọc sản phẩm ngay trên trang
                        function filterProducts(keyword) {
                            let products = document.querySelectorAll('.product'); // Lấy danh sách sản phẩm
                            let hasResult = false; // Kiểm tra xem có sản phẩm phù hợp không

                            products.forEach(product => {
                                let productName = product.getAttribute('data-name').toLowerCase();
                                if (productName.includes(keyword)) {
                                    product.style.display = "block"; // Hiển thị sản phẩm phù hợp
                                    hasResult = true;
                                } else {
                                    product.style.display = "none"; // Ẩn sản phẩm không phù hợp
                                }
                            });

                            // Hiển thị thông báo nếu không có sản phẩm phù hợp
                            let resultMessage = document.getElementById("resultMessage");
                            if (!hasResult) {
                                resultMessage.innerText = `Không tìm thấy sản phẩm nào với từ khóa: "${keyword}"`;
                                resultMessage.style.display = "block";
                            } else {
                                resultMessage.style.display = "none";
                            }
                        }

                    </script>
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Single Product Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5">
                            <div class="row g-4 mb-5">
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Danh Sách Sản Phẩm
                                            </li>
                                        </ol>
                                    </nav>
                                </div>
                                <!-- Form tìm kiếm -->
                                <form id="searchForm" action="/products" method="GET" class="search-container mb-4">
                                    <div class="input-group">
                                        <input type="text" id="searchInput" name="keyword" class="form-control"
                                            placeholder="Tìm kiếm sản phẩm..." value="${keyword}" autocomplete="off">

                                        <!-- Giữ lại các tham số lọc hiện tại -->
                                        <c:if test="${not empty param.factory}">
                                            <input type="hidden" name="factory" value="${param.factory}">
                                        </c:if>
                                        <c:if test="${not empty param.target}">
                                            <input type="hidden" name="target" value="${param.target}">
                                        </c:if>
                                        <c:if test="${not empty param.sort}">
                                            <input type="hidden" name="sort" value="${param.sort}">
                                        </c:if>

                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </form>
                                <div id="searchResults" class="row g-4"></div>
                                <div class="row g-4 fruite">
                                    <div class="col-12 col-md-4">
                                        <div class="row g-4">
                                            <div class="col-12" id="factoryFilter">
                                                <div class="mb-2"><b>Hãng sản xuất</b></div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-1"
                                                        value="APPLE">
                                                    <label class="form-check-label" for="factory-1">Apple</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-2"
                                                        value="ASUS">
                                                    <label class="form-check-label" for="factory-2">Asus</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-3"
                                                        value="LENOVO">
                                                    <label class="form-check-label" for="factory-3">Lenovo</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-4"
                                                        value="DELL">
                                                    <label class="form-check-label" for="factory-4">Dell</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-5"
                                                        value="LG">
                                                    <label class="form-check-label" for="factory-5">LG</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="factory-6"
                                                        value="ACER">
                                                    <label class="form-check-label" for="factory-6">Acer</label>
                                                </div>

                                            </div>
                                            <div class="col-12" id="targetFilter">
                                                <div class="mb-2"><b>Mục đích sử dụng</b></div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-1"
                                                        value="GAMING">
                                                    <label class="form-check-label" for="target-1">Gaming</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-2"
                                                        value="SINHVIEN-VANPHONG">
                                                    <label class="form-check-label" for="target-2">Sinh viên - văn
                                                        phòng</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-3"
                                                        value="THIET-KE-DO-HOA">
                                                    <label class="form-check-label" for="target-3">Thiết kế đồ
                                                        họa</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-4"
                                                        value="MONG-NHE">
                                                    <label class="form-check-label" for="target-4">Mỏng nhẹ</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="target-5"
                                                        value="DOANH-NHAN">
                                                    <label class="form-check-label" for="target-5">Doanh nhân</label>
                                                </div>


                                            </div>
                                            <div class="col-12" id="priceFilter">
                                                <div class="mb-2"><b>Mức giá</b></div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-2"
                                                        value="duoi-10-trieu">
                                                    <label class="form-check-label" for="price-2">Dưới 10 triệu</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-3"
                                                        value="10-15-trieu">
                                                    <label class="form-check-label" for="price-3">Từ 10 - 15
                                                        triệu</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-4"
                                                        value="15-20-trieu">
                                                    <label class="form-check-label" for="price-4">Từ 15 - 20
                                                        triệu</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="checkbox" id="price-5"
                                                        value="tren-20-trieu">
                                                    <label class="form-check-label" for="price-5">Trên 20 triệu</label>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="mb-2"><b>Sắp xếp</b></div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-1"
                                                        value="gia-tang-dan" name="radio-sort">
                                                    <label class="form-check-label" for="sort-1">Giá tăng dần</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-2"
                                                        value="gia-giam-dan" name="radio-sort">
                                                    <label class="form-check-label" for="sort-2">Giá giảm dần</label>
                                                </div>

                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" id="sort-3" checked
                                                        value="gia-nothing" name="radio-sort">
                                                    <label class="form-check-label" for="sort-3">Không sắp xếp</label>
                                                </div>

                                            </div>
                                            <div class="col-12">
                                                <button
                                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4"
                                                    id="btnFilter">
                                                    Lọc Sản Phẩm
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-8 text-center">
                                        <div class="row g-4">
                                            <c:if test="${totalPages ==  0}">
                                                <div>Không tìm thấy sản phẩm</div>
                                            </c:if>
                                            <c:forEach var="product" items="${products}">
                                                <div class="col-md-6 col-lg-4">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="${product.image}"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Laptop
                                                        </div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4 style="font-size: 15px;" class="truncate-multiline">
                                                                <a href="/product/${product.id}">
                                                                    ${product.name}
                                                                </a>

                                                            </h4>
                                                            <p style="font-size: 13px;" class="truncate-multiline">
                                                                ${product.shortDesc}</p>
                                                            <div
                                                                class="d-flex  flex-lg-wrap justify-content-center flex-column">
                                                                <p style="font-size: 15px; text-align: center; width: 100%;"
                                                                    class="text-dark  fw-bold mb-3">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${product.price}" />
                                                                    đ
                                                                </p>
                                                                <form action="/add-product-to-cart/${product.id}"
                                                                    method="post">
                                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                                        value="${_csrf.token}" />

                                                                    <button
                                                                        class="mx-auto btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                            class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                        Add to cart
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>


                                            <c:if test="${totalPages > 1}">
                                                <div class="pagination-container">
                                                    <div class="pagination">
                                                        <!-- First page -->
                                                        <c:if test="${currentPage > 1}">
                                                            <a class="page-link"
                                                                href="/products?page=1${not empty queryString ? '&'.concat(queryString) : ''}">Đầu</a>
                                                        </c:if>

                                                        <!-- Previous page -->
                                                        <c:if test="${currentPage > 1}">
                                                            <a class="page-link"
                                                                href="/products?page=${currentPage - 1}${not empty queryString ? '&'.concat(queryString) : ''}">
                                                                Trước
                                                            </a>
                                                        </c:if>

                                                        <!-- Page numbers -->
                                                        <c:forEach begin="1" end="${totalPages}" var="i">
                                                            <a class="page-link ${currentPage == i ? 'active' : ''}"
                                                                href="/products?page=${i}${not empty queryString ? '&'.concat(queryString) : ''}">
                                                                ${i}
                                                            </a>
                                                        </c:forEach>

                                                        <!-- Next page -->
                                                        <c:if test="${currentPage < totalPages}">
                                                            <a class="page-link"
                                                                href="/products?page=${currentPage + 1}${not empty queryString ? '&'.concat(queryString) : ''}">
                                                                Sau
                                                            </a>
                                                        </c:if>

                                                        <!-- Last page -->
                                                        <c:if test="${currentPage < totalPages}">
                                                            <a class="page-link"
                                                                href="/products?page=${totalPages}${not empty queryString ? '&'.concat(queryString) : ''}">
                                                                Cuối
                                                            </a>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Single Product End -->

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
                    <script>
                        document.addEventListener("DOMContentLoaded", function () {
                            const searchInput = document.getElementById("searchInput");

                            searchInput.addEventListener("keypress", function (event) {
                                if (event.key === "Enter") {
                                    event.preventDefault();
                                    const keyword = searchInput.value.trim();
                                    if (keyword) {
                                        const url = new URL(window.location.href);
                                        url.searchParams.set('keyword', keyword);
                                        url.searchParams.set('page', '1');
                                        window.location.href = url.toString();
                                    }
                                }
                            });
                        });
                    </script>
                </body>

                </html>