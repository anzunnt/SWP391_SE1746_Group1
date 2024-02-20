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


        <!-- Start -->
        <section class="section">
            <div class="container">            <p><a href="index">Home</a> > <a href="BlogList">BlogList</a> > <a>Blog Detail</a></p>
            </div>
            <!-- Page Contain -->
            <div class="row">
                <div class=" col-md-3" >
                    <h2>Danh muc</h2>
                    <a style="text-decoration: none; color: black; font-family: sans-serif; font-size: 20px; display: block;" href="./BlogList?name=${param["name"]}">All</a>
                    <c:forEach var="c" items="${bcl}">
                        <a style="text-decoration: none; color: black; font-family: sans-serif; font-size: 20px;display: block;" href="./BlogList?cateId=${c.id}&name=${param["name"]}">${c.name}</a>
                    </c:forEach>
                </div>
                <div class="col-md-9" style="display: flex; flex-direction: column; align-items: center;padding: 20px">
                    <h1 style="color: black; font-weight: 600;text-align: center; color: black ">${b.getBlog_title()}</h1>                
                    <p style="padding: 20px; text-align: center;">Category: ${b.getBlogCategory().getName()} <span style="margin-left: 20px">&#128065; ${b.getViewCount()} </span></p>  

                    <img src="${b.getImg1()}" width="40%" alt="alt" />
                    <div style="padding: 20px;width: 100%">
                        Posted date:  ${b.getCreate_date()}
                    </div>
                    <p style="padding: 20px;padding-bottom: 0;">
                        ${b.getBlog_body1()}
                    </p>

                </div>
            </div>
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