<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.lang.Math" %>
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
            <div class="container mt-100 mt-60">
                <div class="row">
                    <h1 style="color: black; font-weight: 600;text-align: center; font-family: sans-serif; color: #396cf0  ">Tin tuc</h1>                
                    <div id="main-content" class="main-content">
                        <!--Block 03: Product Tab-->
                        <div class="product-tab z-index-20 sm-margin-top-33px xs-margin-top-30px">
                            <!-- Main content -->
                            <form style="margin-bottom: 10px;display: flex; justify-content: space-evenly; " method="get" action="BlogList">
                                <div style="display: flex; justify-content: space-evenly; width: 20%;align-items: center;">

                                </div>
                                <div  style="display: flex; justify-content: space-evenly; width: 20%;align-items: center;">
                                    <div>Tìm kiem: </div>
                                    <input   style="display: inline-block; width: 250px;" type="text" value="${param["name"]}" name="name"  class="form-control">
                                </div>
                                <div  style="display: flex; justify-content: space-evenly; width: 20%;align-items: center;">
                                    <button type="submit"class="btn btn-primary">Search</button>
                                </div>

                            </form>
                            <div class="biolife-tab biolife-tab-contain sm-margin-top-34px">
                                <div class="tab-head tab-head__icon-top-layout icon-top-layout">
                                    <div class="row" style="margin-bottom: 50px;">
                                        <div class=" col-md-3" >
                                            <h2>Danh muc</h2>
                                            <a style="text-decoration: none; color: black; font-family: sans-serif; font-size: 20px; display: block;" href="./BlogList?name=${param["name"]}">All</a>
                                            <c:forEach var="c" items="${bcl}">
                                                <a style="text-decoration: none; color: black; font-family: sans-serif; font-size: 20px;display: block;" href="./BlogList?cateId=${c.id}&name=${param["name"]}">${c.name}</a>
                                            </c:forEach>
                                        </div>
                                        <ul class=" col-md-9 row" style="list-style: none;">
                                            <c:forEach var="p" items="${blist}">
                                                <li class="col-md-6 block-item" style="min-height: 350px; ">
                                                    <div class="contain-product layout-default">
                                                        <div class="product-thumb" style="width: 100%; display: flex;justify-content: center;">
                                                            <a href="./BlogDetail?bid=${p.getId()}" class="link-to-product" style="display: block;  padding: auto;">
                                                                <img src="${p.getBanner()}" alt="img" width="200"  style="margin-left: 8%;">
                                                            </a>
                                                        </div>
                                                        <div class="info">
                                                            <h4 class="product-title"  style="margin-top: 15px;text-align: center; "><a style="color: black;font-size: 18px;" href="./BlogDetail?bid=${p.getId()}" class="pr-name"> ${p.getBlog_title()} &#128065;${p.getViewCount()}</a></h4>
                                                            <div style="display: flex; justify-content: space-between; padding: 0 20px;" class="price">
                                                                <span  style="color: black; font-weight: 100;font-size: 15px" >Posted date: ${p.getCreate_date()}

                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:forEach>

                                        </ul>
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
    </body>
</html>