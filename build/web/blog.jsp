<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.lang.Math" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- SLIDER -->
        <link rel="stylesheet" href="assets/css/tiny-slider.css"/>

        <!-- SLIDER -->  
        <script src="assets/js/tiny-slider.js"></script>

        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <style>
            .block-item:hover{
                box-shadow: 0 0 5px 5px lightgray;
            }
            .block-item{
                padding-top: 10px;
                padding-bottom: 10px;
                border-radius: 15px;
            }
        </style>
    </head>

    <body>
        <!-- Loader -->
        <c:if test="${param['index']==null }">   
            <c:set var = "index" scope = "page" value = "1"/>
        </c:if>
        <c:if test="${param['index']!=null}">
            <c:set var = "index" scope = "page" value = "${param['index']}"/>
        </c:if>
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

        <!-- Start -->
        <section class="section">
            <div class="slider" style="text-align: center;">
                <c:forEach var="item" items="${blist}">
                    <div style="display: inline-block; max-width: 100%;">
                        <a href="./BlogDetail?bid=${item.getId()}">
                            <img src="${item.getBanner()}" alt="img" style="width: 1300px; height: 700px;">
                            <div>
                                <h4 class="product-title" style="margin-top: 15px; text-align: center;">
                                    <a style="color: black; font-size: 18px; display: block;" href="./BlogDetail?bid=${item.getId()}" class="pr-name">
                                        Trending news: ${item.getBlog_title()}
                                    </a>
                                </h4>
                            </div>
                        </a>
                    </div>
                </c:forEach>


            </div>
            <div class="container mt-100 mt-60">
                <div class="row">
                    <div id="main-content" class="main-content">
                        <!--Block 03: Product Tab-->
                        <div class="product-tab z-index-20 sm xs-margin-top-30px">
                            <!-- Main content -->
                            <div class="biolife-tab biolife-tab-contain sm-margin-top-34px">
                                <div class="tab-head tab-head__icon-top-layout icon-top-layout">

                                    <div class="row" style="margin-bottom: 50px;">
                                        <div class="col-md-3" style="background-color: #A0D4FF; padding: 15px; border-radius: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
                                            <h2 style="font-size: 24px; font-weight: bold; margin-bottom: 15px; color: black;">Category</h2>

                                            <a style="text-decoration: none; color: #343a40; font-family: sans-serif; font-size: 16px; display: block; margin-bottom: 10px; transition: color 0.3s;" href="./BlogList?name=${param["name"]}">All</a>
                                            <c:forEach var="c" items="${bcl}">
                                                <a style="text-decoration: none; color: #343a40; font-family: sans-serif; font-size: 16px; display: block; margin-bottom: 10px; transition: color 0.3s;" href="./BlogList?cateId=${c.id}&name=${param["name"]}">${c.name}</a>
                                            </c:forEach>
                                        </div>

                                        <div class="col-md-9 row" style="display: flex; flex-wrap: wrap;">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <h1 style="color: black; font-weight: 600; text-align: left; font-family: sans-serif;">News</h1>
                                                    </div>
                                                    <div class="col-md-6" style="margin-top: 10px"}>
                                                        <form style="margin-bottom: 10px; display: flex; justify-content: space-evenly; text-align: right" method="get" action="BlogList">
                                                            <div style="display: flex; justify-content: space-evenly; width: 30%; align-items: center;">
                                                                <input placeholder="Enter here" style="display: inline-block; width: 250px;" type="text" value="${param["name"]}" name="name" class="form-control">
                                                            </div>
                                                            <div style="display: flex; justify-content: space-evenly; width: 20%; align-items: center;">
                                                                <button type="submit" class="btn btn-primary">Search</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>

                                            <c:forEach var="p" items="${blist}" varStatus="loop">
                                                <div class="col-md-4 block-item" style="min-height: 100px; display: flex; flex-direction: column;">
                                                    <div class="contain-product layout-default" style="flex-grow: 1;">

                                                        <div class="product-thumb" style="width: 100%; display: flex; justify-content: center;">
                                                            <a href="./BlogDetail?bid=${p.getId()}" class="link-to-product" style="display: block; padding: auto;">
                                                                <img src="${p.getBanner()}" alt="img" style="max-width: 100%; max-height: 100%; object-fit: contain;">
                                                            </a>
                                                        </div>
                                                        <div class="info" style="height: 100px; overflow: hidden; text-align: left;">
                                                            <h4 class="product-title" style="margin-top: 15px; font-size: 16px;">
                                                                <a style="color: black; display: block; text-decoration: none;" href="./BlogDetail?bid=${p.getId()}" class="pr-name">
                                                                    ${p.getBlog_title()}
                                                                </a>
                                                            </h4>
                                                        </div>

                                                        <div class="blog-body" style="max-height: 100px; overflow: hidden;">
                                                            <p>${p.getBlog_body1()}</p>
                                                        </div>
                                                        &#128065;${p.getViewCount()}
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>



                                    </div>
                                </div>
                            </div>
                            <nav style="margin-left: 42%" aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="BlogList?cateId=${param["cateId"]}&name=${param["name"]}&index=1">First Page</a></li>
                                        <c:forEach var="i"  begin="1" end="${numberPage}" step="1">
                                        <li class="page-item  ${index==i?"active":""}"><a class="page-link" href="BlogList?cateId=${param["cateId"]}&name=${param["name"]}&index=${i}">${i}</a></li>
                                        </c:forEach>
                                    <li class="page-item"><a class="page-link" href="BlogList?cateId=${param["cateId"]}&name=${param["name"]}&index=${numberPage}">Last Page</a></li>
                                </ul>
                            </nav>

                        </div>

                    </div>
                </div><!--end row-->


            </div><!--end container-->
        </section><!--end section-->

        <jsp:include page="footer.jsp"/>

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
            var slider = tns({
                container: '.slider',
                items: 1,
                slideBy: 'page',
                autoplay: true,
                autoplayTimeout: 3000,
                autoplayButtonOutput: false,
                mouseDrag: false,
                controls: false, // Hide prev/next buttons
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var blogBodyElements = document.querySelectorAll(".blog-body p");

                blogBodyElements.forEach(function (blogBodyElement) {
                    var blogBodyText = blogBodyElement.textContent;

                    // Limit the displayed characters to 100
                    var limitedText = blogBodyText.slice(0, 100);

                    // Update the content of the <p> element
                    blogBodyElement.textContent = limitedText;
                });
            });
        </script>
    </body>
</html>