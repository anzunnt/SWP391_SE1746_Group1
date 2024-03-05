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
                        <c:forEach items="${listC}" var="o">
                            <div class="tiny-slide">
                                <a href="#" class="card pharpachy-categories border-0 rounded overflow-hidden">
                                    <img style="width: 261px; height: 261px;border: solid 2px" src="${o.image}" class="img-fluid" alt="">
                                    <div class="category-title">
                                        <span class="text-dark title-white"></span><span class="h5">${o.name}</span>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
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

                <div style="border-right:1px black dashed"class="form-group col-2 row" style="margin-right: 10px">
                    <form action="fashionshop" method="post">
                        <label class="col-12" for="categoryFilter">Filter by Category:</label>
                        <select style="padding-top: 5px"class="col-12" class="form-control" name="categoryFilter">
                            <option value="0">All</option>
                            <c:forEach items="${listC}" var="category">
                                <option ${(cid == category.id)?'selected':''} value="${category.id}">${category.name}</option>
                            </c:forEach>
                        </select>
                        <button type="submit" class="btn btn-primary mt-2">Apply</button>
                    </form>
                </div>

                <div style="margin-left: 10px;border-right:1px black dashed"class="form-group col-4 row">
                    <label class="col-12" for="priceFilter">Filter by Price:</label>
                    <label class="col-2"for="from">From:</label>
                    <input class="col-2" type="number" class="form-control" id="priceFilterMin" placeholder="">.000đ
                    <label class="col-2"for="to">To:</label>
                    <input class="col-2" type="number" class="form-control" id="priceFilterMax" placeholder="">.000đ
                    <button style="width:150px;margin-left: 50%"onclick="filterByPrice()" class="btn btn-primary mt-2">Apply</button>
                </div>
            </div>

            <div class="row">  
                <c:forEach items="${listP}" var="o">
                    <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2 product-column" data-price="${o.price}">
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

    <!-- End -->
    <!-- Offcanvas Start -->
    <div class="offcanvas bg-white offcanvas-top" tabindex="-1" id="offcanvasTop">
        <div class="offcanvas-body d-flex align-items-center align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="text-center">
                            <h4>Search now.....</h4>
                            <!-- Search input -->
                            <div class="search-container mt-4">
                                <input type="text" id="searchInput" name="searchInput" class="border bg-white rounded-pill" placeholder="Search products...">
                                <button onclick="searchProducts()" class="btn btn-pills btn-primary">Search</button>
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
    <jsp:include page="footer.jsp"/>
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
        // JavaScript functions for search, filter, and sort
        function searchProducts() {
            var searchText = document.getElementById('searchInput').value.trim().toLowerCase();
            var products = document.querySelectorAll('.product-column');

            products.forEach(function (product) {
                var productName = product.querySelector('.product-name').textContent.trim().toLowerCase();
                if (!productName.includes(searchText)) {
                    product.classList.add('d-none'); // Thêm lớp d-none để ẩn sản phẩm không trùng khớp
                } else {
                    product.classList.remove('d-none'); // Loại bỏ lớp d-none để hiển thị sản phẩm trùng khớp
                }
            });
        }

        function filterByPrice() {
            var minPrice = parseInt(document.getElementById('priceFilterMin').value);
            var maxPrice = parseInt(document.getElementById('priceFilterMax').value);
            var products = document.querySelectorAll('.product-column');

            products.forEach(function (product) {
                var productPrice = parseInt(product.dataset.price);

                if ((isNaN(minPrice) || productPrice >= minPrice) && (isNaN(maxPrice) || productPrice <= maxPrice)) {
                    product.classList.remove('d-none');
                } else {
                    product.classList.add('d-none');
                }
            });
        }

        function sortProducts() {
            var sortSelect = document.getElementById('sortSelect').value;
            // Perform sorting logic based on selected option
        }
    </script>
</body>
</html>