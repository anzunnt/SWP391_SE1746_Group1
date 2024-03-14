<%-- 
    Document   : customerProfile
    Created on : Feb 22, 2024, 2:11:34 AM
    Author     : admin
--%>

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

        <!-- Start -->
        <section class="bg-dashboard">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-4 col-lg-4 col-md-5 col-12">
                        <div class="rounded shadow overflow-hidden sticky-bar">
                            <div class="card border-0">
                                <img src="assets/images/doctors/profile-bg.jpg" class="img-fluid" alt="">
                            </div>

                            <div class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                <img src="${user.image}" class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                <h5 class="mt-3 mb-1">${user.fullname}</h5>
                                <p class="text-muted mb-0">${user.username}</p>
                            </div>

                            <ul class="list-unstyled sidebar-nav mb-0">
                                <!-- <li class="navbar-item"><a href="doctor-dashboard.html" class="navbar-link"><i class="ri-airplay-line align-middle navbar-icon"></i> Dashboard</a></li>
                                <li class="navbar-item"><a href="doctor-appointment.html" class="navbar-link"><i class="ri-calendar-check-line align-middle navbar-icon"></i> Appointment</a></li>
                                <li class="navbar-item"><a href="doctor-schedule.html" class="navbar-link"><i class="ri-timer-line align-middle navbar-icon"></i> Schedule Timing</a></li>
                                <li class="navbar-item"><a href="invoices.html" class="navbar-link"><i class="ri-pages-line align-middle navbar-icon"></i> Invoices</a></li> -->
                                <!--<li class="navbar-item"><a href="doctor-messages.html" class="navbar-link"><i class="ri-mail-unread-line align-middle navbar-icon"></i> Messages</a></li>-->
                                <li class="navbar-item"><a href="userprofile" class="navbar-link"><i class="ri-user-line align-middle navbar-icon"></i> Profile</a></li>
                                <li class="navbar-item"><a href="profileSetting" class="navbar-link"><i class="ri-user-settings-line align-middle navbar-icon"></i> Profile Settings</a></li>
                                <!-- <li class="navbar-item"><a href="patient-list.html" class="navbar-link"><i class="ri-empathize-line align-middle navbar-icon"></i> Patients</a></li>
                                <li class="navbar-item"><a href="patient-review.html" class="navbar-link"><i class="ri-chat-1-line align-middle navbar-icon"></i> Patients Review</a></li> -->
                                <!--<li class="navbar-item"><a href="doctor-chat.html" class="navbar-link"><i class="ri-chat-voice-line align-middle navbar-icon"></i> Chat</a></li>-->
                                <li class="navbar-item"><a href="logout" class="navbar-link"><i class="ri-login-circle-line align-middle navbar-icon"></i> Logout</a></li>
                                <!--<li class="navbar-item"><a href="forgotPassword" class="navbar-link"><i class="ri-device-recover-line align-middle navbar-icon"></i> Forgot Password</a></li>-->
                            </ul>
                        </div>
                    </div><!--end col-->

                    <div class="col-xl-8 col-lg-8 col-md-7 mt-4 pt-2 mt-sm-0 pt-sm-0">

                        <div class="rounded shadow mt-4">
                            <div class="p-4 border-bottom">
                                <h5 class="mb-0">Personal Information :</h5>
                            </div>

                            <div class="p-4">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Full Name</label>
                                            <input name="name" id="name" type="text" class="form-control" value="${user.fullname}" disabled="">
                                        </div>
                                    </div><!--end col-->

                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Your Email</label>
                                            <input name="email" id="email" type="email" class="form-control" value="${user.email}" disabled="">
                                        </div> 
                                    </div><!--end col-->

                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Phone no.</label>
                                            <input name="number" id="number" type="text" class="form-control" value="${user.phone}" disabled="">
                                        </div>                                                                               
                                    </div><!--end col-->
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Your Birthday </label>
                                            <input type="date" class="form-control" id="dob" name="dob" value="${user.dob}" disabled="">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Your Address</label>
                                            <input name="address" id="address" type="text" class="form-control" value="${user.address}" disabled="">
                                        </div> 
                                    </div>

                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Day of participation</label>
                                            <input type="text" name="created_on" id="created_on" class="form-control" value="${user.created_on}" disabled="">
                                        </div> 
                                    </div>

                                </div><!--end row-->

                                <div class="row">
                                    <div class="col-sm">
                                        <a href="profileSetting"><button id="profileSetting" name="send" class="btn btn-primary" >Profile Setting</button></a>
                                    </div><!--end col-->
                                    <div class="col-sm">
                                        <a href="changepassword"><button id="resetPassword" name="send" class="btn btn-primary" >Reset Password</button></a>
                                    </div><!--end col-->
                                </div><!--end row-->
                            </div>
                        </div>

                    </div><!--end col-->
                </div><!--end row-->
            </div><!--end container-->
        </section><!--end section-->
        <!-- End -->

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