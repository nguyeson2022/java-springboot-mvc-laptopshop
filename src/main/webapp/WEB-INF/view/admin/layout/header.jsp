<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/admin">Laptopshop</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                    class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
<<<<<<< HEAD
=======
<<<<<<< HEAD

                <span style="color: white;">Welcome, Hỏi Dân IT</span>


=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                <span style="color: white;">Welcome,
                    <%=request.getUserPrincipal().getName().toString()%>

                </span>
                <!-- <div class="input-group">
    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
        aria-describedby="btnNavbarSearch" />
    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i
            class="fas fa-search"></i></button>
</div> -->
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
<<<<<<< HEAD
=======
<<<<<<< HEAD
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
=======
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7

                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li>
                            <form method="post" action="/logout">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button class="dropdown-item">Logout</button>
                            </form>
                        </li>
<<<<<<< HEAD
=======
>>>>>>> 1e88762 (init)
>>>>>>> 26fb06ea67b696853ab5441d14377c072f8cfea7
                    </ul>
                </li>
            </ul>
        </nav>