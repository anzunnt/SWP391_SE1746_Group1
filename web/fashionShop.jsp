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

        <jsp:include page="header.jsp"/>

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
                                    <div class="qty-icons">
                                        <button onclick="changeQuantity(this, -1)" class="btn btn-icon btn-primary minus">-</button>
                                        <input min="0" max="${o.quantity}" name="quantity" value="0" type="number" class="btn btn-icon btn-primary qty-btn quantity" data-product-id="${o.id}">
                                        <button onclick="changeQuantity(this, 1)" class="btn btn-icon btn-primary plus">+</button>
                                    </div>
                                    <ul class="list-unstyled shop-icons">
                                        <li class="mt-2"><a href="productdetail?id=${o.id}" class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="eye" class="icons"></i></a></li>
                                        <li class="mt-2"><a href="fashionshop?action=cart&productId=${o.id}&quantity=" class="btn btn-icon btn-pills btn-soft-warning" id="addToCartBtn"><i data-feather="shopping-cart" class="icons"></i></a></li>
                                    </ul>
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
                </div>


            </div><!--end row-->
        </div><!--end container-->
    </section><!--end section-->

    <jsp:include page="footer.jsp"/>

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
    <script>
        function changeQuantity(element, value, event) {
            var qtyIcons = element.closest('.qty-icons');
            var inputElement = qtyIcons.querySelector('input[type=number]');
            var currentValue = parseInt(inputElement.value);
            var newValue = currentValue + value;

            if (newValue >= 0 && newValue <= parseInt(inputElement.max)) {
                inputElement.value = newValue;

                // Update the Add to Cart button URL
                var productId = inputElement.dataset.productId;
                var addToCartBtn = qtyIcons.nextElementSibling.querySelector('#addToCartBtn');
                addToCartBtn.href = "fashionshop?action=cart&productId=" + productId + "&quantity=" + newValue;
            }

            // Prevent the default behavior of the anchor element
            event.preventDefault();
        }
    </script>


</body>
</html>