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
            <!-- Page Contain -->
            <div class="row">
                <div class="container mt-20 mt-60">
                    <div class="row" style="margin-bottom: 10px">
                        <!-- Sidebar -->
                        <div class="col-md-3" style="position: fixed; height: 100vh; top: 0; left: 0; background-color: #A0D4FF; border-radius: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); overflow-y: auto; margin-top: 75px; ; overflow-x: auto; overflow-x: auto;
                             transition: position 0.3s; ">
                            <h2 style="font-size: 24px; font-weight: bold; margin-bottom: 15px; color: black; margin-top: 10px">Other News</h2>
                            <div>
                                <hr style="border: 3px solid; border-color: black; margin: 10px 0;">
                            </div>
                            <a style="text-decoration: none; color: #343a40; font-family: sans-serif; font-size: 16px; display: block; margin-bottom: 10px; transition: color 0.3s;" href="./BlogList?name=${param["name"]}">All</a>
                            <c:forEach var="c" items="${bcl}">
                                <a style="text-decoration: none; color: #343a40; font-family: sans-serif; font-size: 16px; display: block; margin-bottom: 10px; transition: color 0.3s;" href="./BlogList?cateId=${c.id}&name=${param["name"]}">${c.name}</a>
                            </c:forEach>
                        </div>
                        <!-- Main Content -->
                        <div class="col-md-10" style="margin-left: 240px; padding: 20px;">
                            <div class="container" style="margin-bottom: 50px">            
                                <p><a href="index">Home</a> > <a href="BlogList">BlogList</a> > <a>Blog Detail</a></p>
                            </div>
                            <h1 style="color: black; font-weight: 600; text-align: center; color: black ">${b.getBlog_title()}</h1>                
                            <p style="padding: 20px; text-align: center;">Category: ${b.getBlogCategory().getName()} <span style="margin-left: 20px">&#128065; ${b.getViewCount()} </span></p>  
                            <img src="${b.getImg1()}" width="100%" alt="alt" />
                            <div style="padding: 20px;width: 100%">
                                Posted date:  ${b.getCreate_date()}
                            </div>
                            <p style="padding: 20px; padding-bottom: 0;">
                                ${b.getBlog_body1()}
                            </p>
                        </div>
                    </div>
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