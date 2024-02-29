
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
        <div class="sidebar-brand">
            <a href="productlist">
                <img src="assets/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                <img src="assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
            </a>
        </div>

        <!-- sidebar-menu  -->
        <ul class="sidebar-menu pt-3">
            <li><a href="productlist"><i class="uil uil-dashboard me-2 d-inline-block"></i>Product List</a></li>
            <!-- add another here --> 
            <li><a href="userlist"><i class="uil uil-dashboard me-2 d-inline-block"></i>Customer List</a></li>
            <li><a href="adminlist"><i class="uil uil-dashboard me-2 d-inline-block"></i>Admin List</a></li>
            <li><a href="fashionshop"><i class="uil uil-dashboard me-2 d-inline-block"></i>Home</a></li>
        </ul>

    </div>
    <!-- sidebar-content  -->
    <ul class="sidebar-footer list-unstyled mb-0">
        <li class="list-inline-item mb-0 ms-1">
            <a href="#" class="btn btn-icon btn-pills btn-soft-primary">
                <i class="uil uil-comment icons"></i>
            </a>
        </li>
    </ul>
</nav>