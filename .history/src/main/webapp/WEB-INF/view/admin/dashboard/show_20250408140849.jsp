<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Son IT - Dự án laptopshop" />
            <meta name="author" content="Son IT" />
            <title>Dashboard - Son IT</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>
        <script>
            // Wait for DOM to be ready
            document.addEventListener('DOMContentLoaded', function () {
                // Verify canvas elements exist
                const areaChart = document.getElementById('myAreaChart');
                const pieChart = document.getElementById('myPieChart');

                if (!areaChart || !pieChart) {
                    console.error('Canvas elements not found');
                    return;
                }

                // Initialize Revenue Chart
                fetch('/api/dashboard/revenue')
                    .then(response => response.json())
                    .then(data => {
                        new Chart(areaChart, {
                            type: 'line',
                            data: {
                                labels: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'T8', 'T9', 'T10', 'T11', 'T12'],
                                datasets: [{
                                    label: 'Doanh thu (triệu VNĐ)',
                                    data: data.data,
                                    borderColor: '#4e73df',
                                    tension: 0.3
                                }]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false
                            }
                        });
                    })
                    .catch(error => console.error('Revenue chart error:', error));

                // Initialize Status Chart
                fetch('/api/dashboard/orders/status')
                    .then(response => response.json())
                    .then(data => {
                        new Chart(pieChart, {
                            type: 'doughnut',
                            data: {
                                labels: ['Chưa giải quyết', 'Vận chuyển', 'Hoàn thành', 'Hủy bỏ'],
                                datasets: [{
                                    data: data.data,
                                    backgroundColor: ['#f6c23e', '#4e73df', '#1cc88a', '#e74a3b']
                                }]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false
                            }
                        });
                    })
                    .catch(error => console.error('Status chart error:', error));
            });
        </script>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Dashboard</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Thống kê</li>
                            </ol>
                            <div class="row">
                                <div class="col-xl-4 col-md-6">
                                    <div class="card bg-primary text-white mb-4">
                                        <div class="card-body">Số lượng User (${countUsers})</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/admin/user">View
                                                Details</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-6">
                                    <div class="card bg-danger text-white mb-4">
                                        <div class="card-body">Số lượng Product (${countProducts})</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/admin/product">View
                                                Details</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-6">
                                    <div class="card bg-success text-white mb-4">
                                        <div class="card-body">Số lượng Order (${countOrders})</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/admin/order">View
                                                Details</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-xl-8 col-lg-7">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Biểu đồ doanh thu theo tháng
                                            </h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="chart-area" style="height: 300px;">
                                                <canvas id="revenueChart"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-4 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Trạng thái đơn hàng</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="chart-pie" style="height: 300px;">
                                                <canvas id="orderStatusChart"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Main content container -->
                            <div class="row">
                                <!-- Revenue Chart -->
                                <div class="col-xl-8 col-lg-7">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Doanh thu theo tháng</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="chart-area">
                                                <canvas id="myAreaChart"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Status Chart -->
                                <div class="col-xl-4 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Trạng thái đơn hàng</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="chart-pie">
                                                <canvas id="myPieChart"></canvas>
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
            <script src="js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                crossorigin="anonymous"></script>
            <script src="js/chart-area-demo.js"></script>
            <script src="js/chart-bar-demo.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                crossorigin="anonymous"></script>
            <script src="js/datatables-simple-demo.js"></script>
            <!-- Load Scripts in correct order -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

            <!-- Custom Chart Script -->
            <script>
                // Wait for DOM to be ready
                document.addEventListener('DOMContentLoaded', function () {
                    // Verify canvas elements exist
                    const areaChart = document.getElementById('myAreaChart');
                    const pieChart = document.getElementById('myPieChart');

                    if (!areaChart || !pieChart) {
                        console.error('Canvas elements not found');
                        return;
                    }

                    // Initialize Revenue Chart
                    fetch('/api/dashboard/revenue')
                        .then(response => response.json())
                        .then(data => {
                            new Chart(areaChart, {
                                type: 'line',
                                data: {
                                    labels: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'T8', 'T9', 'T10', 'T11', 'T12'],
                                    datasets: [{
                                        label: 'Doanh thu (triệu VNĐ)',
                                        data: data.data,
                                        borderColor: '#4e73df',
                                        tension: 0.3
                                    }]
                                },
                                options: {
                                    responsive: true,
                                    maintainAspectRatio: false
                                }
                            });
                        })
                        .catch(error => console.error('Revenue chart error:', error));

                    // Initialize Status Chart
                    fetch('/api/dashboard/orders/status')
                        .then(response => response.json())
                        .then(data => {
                            new Chart(pieChart, {
                                type: 'doughnut',
                                data: {
                                    labels: ['Chưa giải quyết', 'Vận chuyển', 'Hoàn thành', 'Hủy bỏ'],
                                    datasets: [{
                                        data: data.data,
                                        backgroundColor: ['#f6c23e', '#4e73df', '#1cc88a', '#e74a3b']
                                    }]
                                },
                                options: {
                                    responsive: true,
                                    maintainAspectRatio: false
                                }
                            });
                        })
                        .catch(error => console.error('Status chart error:', error));
                });
            </script>
        </body>

        </html>