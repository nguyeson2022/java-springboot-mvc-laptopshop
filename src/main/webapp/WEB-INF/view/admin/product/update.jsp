<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<<<<<<< HEAD
=======
<<<<<<< HEAD

=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<<<<<<< HEAD
=======
<<<<<<< HEAD
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Update Product - SB Admin</title>
                <link href="/css/styles.css" rel="stylesheet" />
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                <meta name="description" content="Son IT - Dự án laptopshop" />
                <meta name="author" content="Son IT" />
                <title>Update Product - Son IT</title>
                <link href="/css/styles.css" rel="stylesheet" />

<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
<<<<<<< HEAD
                        const orgImage = "${newProduct.image}";
                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
=======
<<<<<<< HEAD
                        const orgImage = "${ newProduct.image }";
                        if (orgImage) {
                            const urlImage = "/image/product/" + orgImage;
=======
                        const orgImage = "${newProduct.image}";
                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "block" });
                        }

<<<<<<< HEAD
=======
<<<<<<< HEAD

=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
<<<<<<< HEAD
            </head>


=======
<<<<<<< HEAD

            </head>

=======
            </head>


>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
<<<<<<< HEAD
=======
<<<<<<< HEAD
                                <h1 class="mt-4">Manage Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Products</li>
                                </ol>
                                <div class="mt-5">
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                <h1 class="mt-4">Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/product">Product</a></li>
                                    <li class="breadcrumb-item active">Update</li>
                                </ol>
                                <div class=" mt-5">
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update a product</h3>
                                            <hr />
<<<<<<< HEAD
                                            <form:form method="post" action="/admin/product/update" class="row"
                                                enctype="multipart/form-data" modelAttribute="newProduct">
=======
<<<<<<< HEAD
                                            <form:form method="post" action="/admin/product/create"
                                                modelAttribute="newProduct" class="row" enctype="multipart/form-data">

=======
                                            <form:form method="post" action="/admin/product/update" class="row"
                                                enctype="multipart/form-data" modelAttribute="newProduct">
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                <c:set var="errorName">
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorPrice">
                                                    <form:errors path="price" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorDetailDesc">
                                                    <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorShortDesc">
                                                    <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                </c:set>
                                                <c:set var="errorQuantity">
                                                    <form:errors path="quantity" cssClass="invalid-feedback" />
                                                </c:set>

<<<<<<< HEAD
=======
<<<<<<< HEAD
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Name: </label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorName ?'is-invalid' : ''}"
                                                        path="name" />
                                                    ${errorName}

                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Price: </label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorName ?'is-invalid' : ''}"
                                                        path="price" />
                                                    ${errorPrice}
                                                </div>
                                                <div class="mb-3 col-12 ">
                                                    <label class="form-label">Detail description: </label>
                                                    <form:textarea type="text"
                                                        class="form-control ${not empty errorDetailDesc ?'is-invalid' : ''}"
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                <div class="mb-3" style="display: none;">
                                                    <label class="form-label">Id:</label>
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Name:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                        path="name" />
                                                    ${errorName}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Price:</label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                                                        path="price" />
                                                    ${errorPrice}
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <label class="form-label">Detail description:</label>
                                                    <form:textarea type="text"
                                                        class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                        path="detailDesc" />
                                                    ${errorDetailDesc}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
<<<<<<< HEAD
                                                    <label class="form-label">Short description:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}"
=======
<<<<<<< HEAD
                                                    <label class="form-label">Short description: </label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorShortDesc ?'is-invalid' : ''}"
=======
                                                    <label class="form-label">Short description:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}"
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                        path="shortDesc" />
                                                    ${errorShortDesc}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
<<<<<<< HEAD
=======
<<<<<<< HEAD
                                                    <label class="form-label">Quantity: </label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorQuantity ?'is-invalid' : ''}"
                                                        path="quantity" />
                                                    ${errorQuantity}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Factory: </label>
                                                    <form:select class="form-select" path="factory">
                                                        <form:option value="APPLE">Apple (Macbook)</form:option>
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                    <label class="form-label">Quantity:</label>
                                                    <form:input type="number"
                                                        class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                                                        path="quantity" />
                                                    ${errorQuantity}
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Factory:</label>
                                                    <form:select class="form-select" path="factory">
                                                        <form:option value="APPLE">Apple (MacBook)</form:option>
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                        <form:option value="ASUS">Asus</form:option>
                                                        <form:option value="LENOVO">Lenovo</form:option>
                                                        <form:option value="DELL">Dell</form:option>
                                                        <form:option value="LG">LG</form:option>
                                                        <form:option value="ACER">Acer</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
<<<<<<< HEAD
                                                    <label class="form-label">Target:</label>
=======
<<<<<<< HEAD
                                                    <label class="form-label">Target: </label>
=======
                                                    <label class="form-label">Target:</label>
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                    <form:select class="form-select" path="target">
                                                        <form:option value="GAMING">Gaming</form:option>
                                                        <form:option value="SINHVIEN-VANPHONG">Sinh viên - Văn phòng
                                                        </form:option>
<<<<<<< HEAD
=======
<<<<<<< HEAD
                                                        <form:option value="THIET-KE-DO-HOA">Thiết kế độ họa
                                                        </form:option>
                                                        <form:option value="MONG_NHE">Mỏng nhẹ</form:option>
                                                        <form:option value="DOANH-NHAN">Doanh nhân</form:option>

                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="avatarFile" class="form-label">Image:
                                                    </label>
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                        <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa
                                                        </form:option>
                                                        <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                                        <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="avatarFile" class="form-label">Image:</label>
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="hoidanitFile" />
                                                </div>
                                                <div class="col-12 mb-3">
                                                    <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                        id="avatarPreview" />
                                                </div>
<<<<<<< HEAD
=======
<<<<<<< HEAD

                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Create</button>
                                                </div>

                                            </form:form>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />

                    </div>
                </div>

=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-warning">Update</button>
                                                </div>
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
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7

            </body>

            </html>