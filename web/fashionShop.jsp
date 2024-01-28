<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Group1 Shop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="https://shreethemes.in" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- SLIDER -->
        <link rel="stylesheet" href="assets/css/tiny-slider.css"/>
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
    </head>

    <body>
        <!-- Loader -->
        <div id="preloader">
            <div id="status">
                <div class="spinner">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>
        </div>
        <!-- Loader -->

        <!-- Navbar STart -->
        <header id="topnav" class="defaultscroll sticky">
            <div class="container">
                <!-- Logo container-->
                <a class="logo" href="index.html">
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
                    <li class="list-inline-item mb-0">
                        <a href="javascript:void(0)" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                            <div class="btn btn-icon btn-pills btn-primary"><i data-feather="settings" class="fea icon-sm"></i></div>
                        </a>
                    </li>

                    <li class="list-inline-item mb-0 ms-1">
                        <a href="javascript:void(0)" class="btn btn-icon btn-pills btn-primary" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
                            <i class="uil uil-search"></i>
                        </a>
                    </li>

                    <li class="list-inline-item mb-0 ms-1">
                        <div class="dropdown dropdown-primary">
                            <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/doctors/01.jpg" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                            <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                <a class="dropdown-item d-flex align-items-center text-dark" href="doctor-profile.html">
                                    <img src="assets/images/doctors/01.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                    <div class="flex-1 ms-2">
                                        <span class="d-block mb-1">Calvin Carlo</span>
                                        <small class="text-muted">Orthopedic</small>
                                    </div>
                                </a>
                                <a class="dropdown-item text-dark" href="doctor-dashboard.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Dashboard</a>
                                <a class="dropdown-item text-dark" href="doctor-profile-setting.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                                <div class="dropdown-divider border-top"></div>
                                <a class="dropdown-item text-dark" href="login.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>
                            </div>
                        </div>
                    </li>
                </ul>
                <!-- Start Dropdown -->

                <div id="navigation">
                    <!-- Navigation Menu-->   
                    <ul class="navigation-menu nav-left nav-light">
                        <li class="has-submenu parent-menu-item"><a href="index">Home</a>
                        </li>

                        <li class="has-submenu parent-parent-menu-item">
                            <a href="javascript:void(0)">Product Shop</a>
                        </li>

                        <li class="has-submenu parent-menu-item">
                            <a href="javascript:void(0)">Patients</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="patient-dashboard.html" class="sub-menu-item">Dashboard</a></li>
                                <li><a href="patient-profile.html" class="sub-menu-item">Profile</a></li>
                                <li><a href="booking-appointment.html" class="sub-menu-item">Book Appointment</a></li>
                                <li><a href="patient-invoice.html" class="sub-menu-item">Invoice</a></li>
                            </ul>
                        </li>

                        <li class="has-submenu parent-menu-item">
                            <a href="javascript:void(0)" class="menu-item">Pharmacy</a><span class="menu-arrow"></span>
                            <ul class="submenu">
                                <li><a href="pharmacy.html" class="sub-menu-item">Pharmacy</a></li>
                                <li><a href="pharmacy-shop.html" class="sub-menu-item">Shop</a></li>
                                <li><a href="pharmacy-product-detail.html" class="sub-menu-item">Medicine Detail</a></li>
                                <li><a href="pharmacy-shop-cart.html" class="sub-menu-item">Shop Cart</a></li>
                                <li><a href="pharmacy-checkout.html" class="sub-menu-item">Checkout</a></li>
                                <li><a href="pharmacy-account.html" class="sub-menu-item">Account</a></li>
                            </ul>
                        </li>

                        <li class="has-submenu parent-parent-menu-item"><a href="javascript:void(0)">Pages</a><span class="menu-arrow"></span>
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
                        <li><a href="productlist" class="sub-menu-item" target="_blank">Admin</a></li>
                    </ul><!--end navigation menu-->
                </div><!--end navigation-->
            </div><!--end container-->
        </header><!--end header-->
        <!-- Navbar End -->

        <div class="container mt-100 mt-60">    
            <div class="row">
                <div class="col-12">
                    <h5 class="mb-0">Categories</h5>
                </div><!--end col-->
            </div><!--end row-->

            <div class="row">
                <div class="col-lg-12 mt-4 pt-2">
                    <div class="slider-range-four">
                        <div class="tiny-slide">
                            <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                <img src="assets/images/pharmacy/skin.jpg" class="img-fluid" alt="">
                                <div class="category-title">
                                    <span class="text-dark title-white"><span class="h5">Skin</span><br>Care</span>
                                </div>
                            </a>
                        </div>

                        <div class="tiny-slide">
                            <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                <img src="assets/images/pharmacy/sexual.jpg" class="img-fluid" alt="">
                                <div class="category-title">
                                    <span class="text-dark title-white"><span class="h5">Sexual</span><br>Wallness</span>
                                </div>
                            </a>
                        </div>

                        <div class="tiny-slide">
                            <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                <img src="assets/images/pharmacy/weight.jpg" class="img-fluid" alt="">
                                <div class="category-title">
                                    <span class="text-dark title-white"><span class="h5">Weight</span><br>Management</span>
                                </div>
                            </a>
                        </div>

                        <div class="tiny-slide">
                            <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                <img src="assets/images/pharmacy/pain.jpg" class="img-fluid" alt="">
                                <div class="category-title">
                                    <span class="text-dark title-white"><span class="h5">Pain</span><br>Relief</span>
                                </div>
                            </a>
                        </div>

                        <div class="tiny-slide">
                            <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                <img src="assets/images/pharmacy/heart.jpg" class="img-fluid" alt="">
                                <div class="category-title">
                                    <span class="text-dark title-white"><span class="h5">Heart</span><br>Health</span>
                                </div>
                            </a>
                        </div>

                        <div class="tiny-slide">
                            <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                <img src="assets/images/pharmacy/cough.jpg" class="img-fluid" alt="">
                                <div class="category-title">
                                    <span class="text-dark title-white"><span class="h5">Cough</span><br> & Cold</span>
                                </div>
                            </a>
                        </div>

                        <div class="tiny-slide">
                            <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                <img src="assets/images/pharmacy/diabetes.jpg" class="img-fluid" alt="">
                                <div class="category-title">
                                    <span class="text-dark title-white"><span class="h5">Diabetes</span><br>Care</span>
                                </div>
                            </a>
                        </div>

                        <div class="tiny-slide">
                            <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                <img src="assets/images/pharmacy/cancer.jpg" class="img-fluid" alt="">
                                <div class="category-title">
                                    <span class="text-dark title-white"><span class="h5">Cancer</span><br>Care</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div><!--end col-->
            </div><!--end row-->
        </div><!--end container-->

        <!-- Start -->
        <section class="section">
            <div class="container mt-100 mt-60">
                <div class="row">
                    <div class="col-12">
                        <h5 class="mb-0">All Products</h5>
                    </div><!--end col-->
                </div><!--end row-->

                <div class="row">    
                    <c:forEach items="${listP}" var="o">
                        <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
                            <div class="card shop-list border-0">
                                <div class="shop-image position-relative overflow-hidden rounded shadow">
                                    <a href="productdetail?id=${o.id}"><img src="${o.image}" class="img-fluid" alt=""></a>
                                    <ul class="list-unstyled shop-icons">
                                        <li class="mt-2"><a href="productdetail?id=${o.id}" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="eye" class="icons"></i></a></li>
                                        <li class="mt-2"><a href="#" class="btn btn-icon btn-pills btn-soft-warning"><i data-feather="shopping-cart" class="icons"></i></a></li>
                                    </ul>                                

                                    <div class="qty-icons">
                                        <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="btn btn-pills btn-icon btn-primary minus">-</button>
                                        <input min="0" max="${o.quantity}" name="quantity" value="0" type="number" class="btn btn-pills btn-icon btn-primary qty-btn quantity">
                                        <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="btn btn-pills btn-icon btn-primary plus">+</button>
                                    </div>
                                </div>
                                <div class="card-body content pt-4 p-2">
                                    <a href="productdetail?id=${o.id}" class="text-dark product-name h6">${o.name}</a>

                                    <div class="d-flex justify-content-between mt-1">
                                        <h6 class="text-muted small font-italic mb-0 mt-1">
                                            <span style="text-decoration: line-through; color: red">${Math.round(o.price)}.000đ</span>
                                        </h6>
                                            <h6 class="text-muted small font-italic mb-0 mt-1">${Math.round(o.discount*100)}%</h6>
                                        <h6 class="text-muted small font-italic mb-0 mt-1"><span style="color: blue">${Math.round(o.price - (o.discount*o.price))}.000đ</span></h6>
                                    </div>
                                </div>
                            </div>
                        </div><!--end col-->
                    </c:forEach>


                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->

        <!-- Start -->
        <footer class="bg-footer">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-4 mb-0 mb-md-4 pb-0 pb-md-2">
                        <a href="#" class="logo-footer">
                            <img src="assets/images/logo-light.png" height="22" alt="">
                        </a>
                        <p class="mt-4 me-xl-5">Great doctor if you need your family member to get effective immediate assistance, emergency treatment or a simple consultation.</p>
                    </div><!--end col-->

                    <div class="col-xl-7 col-lg-8 col-md-12">
                        <div class="row">
                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                <h5 class="text-light title-dark footer-head">Company</h5>
                                <ul class="list-unstyled footer-list mt-4">
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> About us</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Services</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Team</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Project</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Blog</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Login</a></li>
                                </ul>
                            </div><!--end col-->

                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                <h5 class="text-light title-dark footer-head">Departments</h5>
                                <ul class="list-unstyled footer-list mt-4">
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Eye Care</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Psychotherapy</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Dental Care</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Orthopedic</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Cardiology</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Gynecology</a></li>
                                    <li><a href="#" class="text-foot"><i class="mdi mdi-chevron-right me-1"></i> Neurology</a></li>
                                </ul>
                            </div><!--end col-->

                            <div class="col-md-4 col-12 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                <h5 class="text-light title-dark footer-head">Contact us</h5>
                                <ul class="list-unstyled footer-list mt-4">
                                    <li class="d-flex align-items-center">
                                        <i data-feather="mail" class="fea icon-sm text-foot align-middle"></i>
                                        <a href="mailto:contact@example.com" class="text-foot ms-2">contact@example.com</a>
                                    </li>

                                    <li class="d-flex align-items-center">
                                        <i data-feather="phone" class="fea icon-sm text-foot align-middle"></i>
                                        <a href="tel:+152534-468-854" class="text-foot ms-2">+152 534-468-854</a>
                                    </li>

                                    <li class="d-flex align-items-center">
                                        <i data-feather="map-pin" class="fea icon-sm text-foot align-middle"></i>
                                        <a href="javascript:void(0)" class="video-play-icon text-foot ms-2">View on Google map</a>
                                    </li>
                                </ul>

                                <ul class="list-unstyled social-icon footer-social mb-0 mt-4">
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="facebook" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="instagram" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="twitter" class="fea icon-sm fea-social"></i></a></li>
                                    <li class="list-inline-item"><a href="#" class="rounded-pill"><i data-feather="linkedin" class="fea icon-sm fea-social"></i></a></li>
                                </ul><!--end icon-->
                            </div><!--end col-->
                        </div><!--end row-->
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->

            <div class="container mt-5">
                <div class="pt-4 footer-bar">
                    <div class="row align-items-center">
                        <div class="col-sm-6">
                            <div class="text-sm-start text-center">
                                <p class="mb-0"><script>document.write(new Date().getFullYear())</script> © Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="index.html" target="_blank" class="text-reset">Shreethemes</a>.</p>
                            </div>
                        </div><!--end col-->

                        <div class="col-sm-6 mt-4 mt-sm-0">
                            <ul class="list-unstyled footer-list text-sm-end text-center mb-0">
                                <li class="list-inline-item"><a href="terms.html" class="text-foot me-2">Terms</a></li>
                                <li class="list-inline-item"><a href="privacy.html" class="text-foot me-2">Privacy</a></li>
                                <li class="list-inline-item"><a href="aboutus.html" class="text-foot me-2">About</a></li>
                                <li class="list-inline-item"><a href="contact.html" class="text-foot me-2">Contact</a></li>
                            </ul>
                        </div><!--end col-->
                    </div><!--end row-->
                </div>
            </div><!--end container-->
        </footer><!--end footer-->
        <!-- End -->
        <!-- Offcanvas Start -->
        <div class="offcanvas bg-white offcanvas-top" tabindex="-1" id="offcanvasTop">
            <div class="offcanvas-body d-flex align-items-center align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="text-center">
                                <h4>Search now.....</h4>
                                <div class="subcribe-form mt-4">
                                    <form>
                                        <div class="mb-0">
                                            <form action="search" method="post" id="searchform" class="searchform">
                                                <input type="text" id="s" name="s" class="border bg-white rounded-pill" required="" placeholder="Search">
                                                <button type="submit" class="btn btn-pills btn-primary">Search</button>
                                            </form>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->
                </div><!--end container-->
            </div>
        </div>
        <!-- Offcanvas End -->

        <!-- Back to top -->
        <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
        <!-- Back to top -->

        <!-- javascript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- SLIDER -->
        <script src="assets/js/tiny-slider.js"></script>
        <script src="assets/js/tiny-slider-init.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>
    </body>
</html>