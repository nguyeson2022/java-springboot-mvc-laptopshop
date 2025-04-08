<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Features</div>
                        <a class="nav-link" href="/admin">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-line"></i></div>
                            Dashboard
                        </a>

                        <a class="nav-link" href="/admin/user">
                            <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                            User
                        </a>

                        <a class="nav-link" href="/admin/product">
                            <div class="sb-nav-link-icon"><i class="fas fa-laptop"></i></div>
                            Product
                        </a>

                        <a class="nav-link" href="/admin/order">
                            <div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>
                            Order
                        </a>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    <i class="fas fa-user me-2"></i>Son IT
                </div>
            </nav>
        </div>