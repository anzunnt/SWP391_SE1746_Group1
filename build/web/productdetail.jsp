<%-- 
    Document   : productdetail.jsp
    Created on : Jan 25, 2024, 10:01:32 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Doctris - Doctor Appointment Booking System</title>
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
        <!-- SLIDER -->
        <link rel="stylesheet" href="assets/css/tiny-slider.css"/>
        <link rel="stylesheet" href="assets/css/slick.css"/> 
        <link rel="stylesheet" href="assets/css/slick-theme.css"/>
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
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

        <jsp:include page="header.jsp"/>

        <!-- Hero Start -->
        <section class="bg-half-170 d-table w-100 bg-light">
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-12">
                        <div class="section-title text-center">
                            <nav aria-label="breadcrumb" class="d-inline-block mt-3">
                                <ul class="breadcrumb bg-light rounded mb-0 bg-transparent">
                                    <li class="breadcrumb-item"><a href="index">Home</a></li>
                                    <li class="breadcrumb-item"><a href="fashionshop">Product Shop</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Product Detail</li>
                                </ul>
                            </nav>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <div class="position-relative">
            <div class="shape overflow-hidden text-white">
                <svg viewBox="0 0 2880 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M0 48H1437.5H2880V0H2160C1442.5 52 720 0 720 0H0V48Z" fill="currentColor"></path>
                </svg>
            </div>
        </div>
        <!-- Hero End -->

        <section class="section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-5">

                        <div class="slider slider-for">
                            <c:forEach items="${listP}" var="o">
                                <div><img src="${o.image}" class="img-fluid rounded" alt=""></div>
                                </c:forEach>
                        </div>

                        <div class="slider slider-nav">
                            <c:forEach items="${listP}" var="o">
                                <div><img src="${o.image}" class="img-fluid rounded" alt=""></div>
                                </c:forEach>
                        </div>
                    </div><!--end col-->
                    <c:set var="o" value="${requestScope.product}"/>
                    <div class="col-md-7 mt-4 mt-sm-0 pt-2 pt-sm-0">
                        <div class="section-title ms-md-4">
                            <h4 class="title">${o.name}</h4>
                            <div class="d-flex justify-content-between mt-1"> 
                                <h6 class="text-muted small font-italic mb-0 mt-1">
                                    GIÁ GỐC: <span style="text-decoration: line-through; color: red">${Math.round(o.price)}.000đ</span>
                                </h6>
                                    <h6 class="text-muted small font-italic mb-0 mt-1">SALE: <span style="color: black">${Math.round(o.discount*100)}%</span></h6>
                                <h6 class="text-muted small font-italic mb-0 mt-1">CHỈ CÒN:<span style="color: blue"> ${Math.round(o.price - (o.discount*o.price))}.000đ</span></h6>
                            </div>
                            <h5 class="mt-4 py-2">Overview :</h5>
                            <p class="text-muted">${o.description}</p>

                            <div class="d-flex shop-list align-items-center">
                                <h6 class="mb-0">Quantity:</h6>
                                <div class="qty-icons ms-3">
                                    <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="btn btn-icon btn-primary minus">-</button>
                                    <input min="0" max="${o.quantity}" name="quantity" value="0" type="number" class="btn btn-icon btn-primary qty-btn quantity">
                                    <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="btn btn-icon btn-primary plus">+</button>
                                </div>
                            </div>

                            <div class="mt-4 pt-2">
                                <a href="#" class="btn btn-primary">Shop Now</a>
                                <a href="#" class="btn btn-soft-primary ms-2">Add to Cart</a>
                            </div>
                        </div>
                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->

            <jsp:include page="footer.jsp"/>
            <!-- End -->

            <!-- Back to top -->
            <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>
            <!-- Back to top -->

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
                                                <input type="text" id="help" name="name" class="border bg-white rounded-pill" required="" placeholder="Search">
                                                <button type="submit" class="btn btn-pills btn-primary">Search</button>
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

            <!-- javascript -->
            <script src="assets/js/jquery.min.js"></script>
            <script src="assets/js/bootstrap.bundle.min.js"></script>
            <!-- SLIDER -->
            <script src="assets/js/tiny-slider.js"></script>
            <script src="assets/js/tiny-slider-init.js"></script>
            <script src="assets/js/slick.min.js"></script>
            <script src="assets/js/slick.init.js"></script>
            <!-- Icons -->
            <script src="assets/js/feather.min.js"></script>
            <!-- Main Js -->
            <script src="assets/js/app.js"></script>
    </body>

</html>