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

        <div class="back-to-home rounded d-none d-sm-block">
            <a href="index" class="btn btn-icon btn-primary"><i data-feather="home" class="icons"></i></a>
        </div>

        <!-- Hero Start -- Login Form --> 
        <section class="bg-home d-flex bg-light align-items-center" style="background: url('../assets/images/bg/bg-lines-one.png') center;">
            <div class="container" style="margin: auto!important">
                <div class="row justify-content-center">
                    <div class="col-lg-7 col-md-8" id="loginform">
                        <img src="../assets/images/logo-dark.png" height="24" class="mx-auto d-block" alt="">
                        <div class="card login-page bg-white shadow mt-4 rounded border-0">
                            <div class="card-body">
                                <h4 class="text-center">Login</h4>  
                                <form action="login" class="login-form mt-4" method="post">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label class="form-label">User Name <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="User Name" id="username" name="username" value="" required="">
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="mb-3">
                                                <label class="form-label">Password <span class="text-danger">*</span></label>
                                                <input type="password" class="form-control" placeholder="Password" id="password" name="password" value="" required="">
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="d-flex justify-content-between">
                                                <div class="mb-3">
                                                    <div class="form-check">
                                                        <input class="form-check-input align-middle" type="checkbox" value="" id="remember-check">
                                                        <label class="form-check-label" for="remember-check">Remember me</label>
                                                    </div>
                                                </div>
                                                <a href="forgotpassword" class="text-dark h6 mb-0">Forgot password ?</a>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 mb-0">
                                            <div>
                                                <p style="color: red;">${mess}</p>
                                            </div>
                                            <div class="d-grid">
                                                <button class="btn btn-primary" type="submit">Login</button>
                                            </div>
                                        </div>

                                        <!--                                        <div class="col-lg-12 mt-3 text-center">
                                                                                    <h6 class="text-muted">Or</h6>
                                                                                </div>end col
                                                                                
                                                                                <div class="col-6 mt-3">
                                                                                    <div class="d-grid">
                                                                                        <a href="#" class="btn btn-soft-primary"><i class="uil uil-facebook"></i> Facebook</a>
                                                                                    </div>
                                                                                </div>end col
                                                                                
                                                                                <div class="col-6 mt-3">
                                                                                    <div class="d-grid">
                                                                                        <a href="#" class="btn btn-soft-primary"><i class="uil uil-google"></i> Google</a>
                                                                                    </div>
                                                                                </div>end col-->

                                        <div class="col-12 text-center">
                                            <p class="mb-0 mt-3"><small class="text-dark me-2">Don't have an account ?</small> <a href="#registerform" onclick="switchLoginRegister()" class="fw-bold link-danger">Register</a></p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div><!---->
                    </div> <!--end col-->

                    <div class="col-lg-7 col-md-8" id="registerform">
                        <img src="../assets/images/logo-dark.png" height="24" class="mx-auto d-block" alt="">
                        <div class="card login-page bg-white shadow mt-4 rounded border-0">
                            <div class="card-body">
                                <h4 class="text-center">Register</h4>  
                                <div>
                                    <p class="form-row" style="color: red">
                                        ${messregis}
                                    </p>
                                </div>
                                <form action="register" class="login-form mt-4" method="post">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="mb-3">                                               
                                                <label class="form-label">Full name <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Full Name" id="fullname" name="fullname" value="" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">                                                
                                                <label class="form-label">User name <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="User Name" id="username" name="username" value="" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Password <span class="text-danger">*</span></label>
                                                <input type="password" class="form-control" placeholder="Password" id="password" name="password" value="" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Email <span class="text-danger">*</span></label>
                                                <input type="email" class="form-control" placeholder="Email" id="email" name="email" value="" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Phone number <span class="text-danger">*</span></label>
                                                <input type="tel" class="form-control" placeholder="Phone number" id="phone" name="phone" value="" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="image">Choose Image: </label>
                                                <input type="file" id="image" name="image" value="" accept="image/*" required>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Birthday <span class="text-danger">*</span></label>
                                                <input type="date" class="form-control" id="dob" name="dob" value="" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Address <span class="text-danger">*</span></label>
                                                <input type="text" class="form-control" placeholder="Address" id="address" name="address" value="" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <div class="form-check">
                                                    <input class="form-check-input align-middle" type="checkbox" value="" id="accept-tnc-check">
                                                    <label class="form-check-label" for="accept-tnc-check">I Accept <a href="#" class="text-primary">Terms And Condition</a></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="d-grid">
                                                <button class="btn btn-primary" type="submit">Register</button>
                                            </div>
                                        </div>

                                        <!--                                        <div class="col-lg-12 mt-3 text-center">
                                                                                    <h6 class="text-muted">Or</h6>
                                                                                </div>end col
                                        
                                                                                <div class="col-6 mt-3">
                                                                                    <div class="d-grid">
                                                                                        <a href="javascript:void(0)" class="btn btn-soft-primary"><i class="uil uil-facebook"></i> Facebook</a>
                                                                                    </div>
                                                                                </div>end col
                                        
                                                                                <div class="col-6 mt-3">
                                                                                    <div class="d-grid">
                                                                                        <a href="javascript:void(0)" class="btn btn-soft-primary"><i class="uil uil-google"></i> Google</a>
                                                                                    </div>
                                                                                </div>end col-->

                                        <div class="mx-auto">
                                            <p class="mb-0 mt-3"><small class="text-dark me-2">Already have an account ?</small> <a href="#loginform" onclick="switchLoginRegister()" class="fw-bold link-danger">Login</a></p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div><!---->
                    </div> <!--end col-->
                </div><!--end row-->
            </div> <!--end container-->
        </section><!--end section-->
        <!-- Hero End -->

        <!-- javascript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- SLIDER -->
        <script src="assets/js/tiny-slider.js"></script>
        <script src="assets/js/tiny-slider-init.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>
        <!--        <script>
                                                        function switchLoginRegister() {
                                                            var getLoginId = document.getElementById("loginform");
                                                            var getRegisterId = document.getElementById("registerform");
                                                            if (getLoginId.hidden === true)
                                                            {
                                                                getLoginId.hidden = false;
                                                                getRegisterId.hidden = true;
                                                            } else {
                                                                getLoginId.hidden = true;
                                                                getRegisterId.hidden = false;
                                                            }
                                                        };
                </script>-->
    </body>
</html>