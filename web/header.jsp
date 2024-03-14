
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Navbar STart -->
<header id="topnav" class="defaultscroll sticky">
    <div class="container">
        <!-- Logo container-->
        <a class="logo" href="index">
            <span class="logo-light-mode">
                <img src="assets/images/logo-dark.png" class="l-dark" height="24" alt="">
                <img src="assets/images/logo-light.png" class="l-light" height="24" alt="">
            </span>
            <img src="assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
        </a>                
        <!-- Logo End -->

        <!-- Start Mobile Toggle -->
        <div class="menu-extras">
            <div class="menu-item">
                <!-- Mobile menu toggle-->
                <a class="navbar-toggle" id="isToggle" onclick="toggleMenu()">
                    <div class="lines">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </a>
                <!-- End mobile menu toggle-->
            </div>
        </div>
        <!-- End Mobile Toggle -->

        <!-- Start Dropdown -->
        <ul class="dropdowns list-inline mb-0">
            <!--            <li class="list-inline-item mb-0">
                            <a href="javascript:void(0)" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                                <div class="btn btn-icon btn-pills btn-primary"><i data-feather="settings" class="fea icon-sm"></i></div>
                            </a>
                        </li>-->

            <li class="list-inline-item mb-0 ms-1">
                <a href="javascript:void(0)" class="btn btn-icon btn-pills btn-primary" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
                    <i class="uil uil-search"></i>
                </a>
            </li>

            <c:if test="${sessionScope['account'] != null}">
                <li class="list-inline-item mb-0 ms-1">
                    <div class="dropdown dropdown-primary">
                        <c:if test="${sessionScope['admin'] == null}">
                            <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="${sessionScope['account'].image}" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                            <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                <a class="dropdown-item d-flex align-items-center text-dark" href="userprofile">
                                    <img src="${sessionScope['account'].image}" class="avatar avatar-md-sm rounded-circle border shadow" alt="Avatar">
                                    <div class="flex-1 ms-2">
                                        <span class="d-block mb-1">${sessionScope['account'].username}</span>
                                        <small class="text-muted">${sessionScope['account'].fullname}</small>
                                    </div>
                                </a>
                                <a class="dropdown-item text-dark" href="changepassword"><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Change Password</a>
                                <div class="dropdown-divider border-top"></div>
                                <a class="dropdown-item text-dark" href="logout"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope['admin'] != null}">
                            <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                            <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                <a class="dropdown-item text-dark" href="logout"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>
                            </div>
                        </c:if>
                    </div>
                </li>
            </c:if>
            <c:if test="${sessionScope['account'] == null}">
                <li class="list-inline-item mb-0 ms-1">
                    <a href="login" class="btn btn-pills btn-primary">
                        Login
                    </a>
                </li>
            </c:if>
        </ul>
        <!-- Start Dropdown -->

        <div id="navigation">
            <!-- Navigation Menu-->   
            <ul class="navigation-menu nav-left nav-light">
                <li class="has-submenu parent-menu-item"><a href="index" style="color: black!important">Home</a></li>

                <li class="has-submenu parent-parent-menu-item">
                    <a href="fashionshop" style="color: black!important">Product Shop</a>
                </li>
                
                <li class="has-submenu parent-menu-itemk">
                    <a href="news" style="color: black!important">News</a>
                </li>

                <li class="has-submenu parent-menu-itemk">
                    <a href="orderlist" style="color: black!important">Order</a>
                </li>

                <li class="has-submenu parent-menu-item">
                    <a href="cart" class="menu-item" style="color: black!important">
                        View Cart
                        <c:if test="${sessionScope['cart']==null}">
                            (0)
                        </c:if>
                        <c:if test="${sessionScope['cart']!=null}">
                            (${sessionScope['cart'].getItems().size()})
                        </c:if>
                    </a>
                </li>
                
                <li class="has-submenu parent-parent-menu-item"><a href="javascript:void(0)" style="color: black!important">Pages</a><span class="menu-arrow" style="color: black"></span>
                    <ul class="submenu">
                        <li><a href="aboutus.html"> About Us</a></li>
                        <li><a href="departments.html">Departments</a></li>
                        <li><a href="faqs.html">FAQs</a></li>
                        <li><a href="https://shreethemes.in/doctris/layouts/landing/review.html">Reviews</a></li>
                        <li><a href="https://shreethemes.in/doctris/layouts/landing/pricing.html">Pricing</a></li>
                        <li class="has-submenu"><a href="javascript:void(0)"> Blogs </a><span class="submenu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="blogs.html">Blogs</a></li>
                                <li><a href="blog-detail.html">Blog Details</a></li>
                            </ul>
                        </li>
                        <li><a href="https://shreethemes.in/doctris/layouts/landing/tears.html">Terms & Policy</a></li>
                        <li><a href="privacy.html">Privacy Policy</a></li>
                        <li><a href="error.html">404 !</a></li>
                        <li><a href="https://shreethemes.in/doctris/layouts/landing/blank-page.html">Blank Page</a></li>
                        <li><a href="https://shreethemes.in/doctris/layouts/landing/comingsoon.html">Comingsoon</a></li>
                        <li><a href="https://shreethemes.in/doctris/layouts/landing/maintenance.html">Maintenance</a></li>
                        <li><a href="contact.html">Contact</a></li>
                    </ul>
                </li>
                <c:if test="${sessionScope['admin']!=null}">
                    <li><a href="productlist" class="sub-menu-item" style="color: black!important">Admin</a></li>
                    </c:if>
            </ul><!--end navigation menu-->
        </div><!--end navigation-->
    </div><!--end container-->
</header><!--end header-->
<!-- Navbar End -->
