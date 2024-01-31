<%-- 
    Document   : productlist
    Created on : Jan 15, 2024, 3:38:53 PM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Admin View - Fashion Shop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="productlist" />
        <meta name="Version" content="v1.2.0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap&subset=vietnamese">
        <!-- favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete product with id " + id)) {
                    window.location = "deleteProduct?id=" + id;
                }
            }
        </script>
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

        <div class="page-wrapper doctris-theme toggled">
            <nav id="sidebar" class="sidebar-wrapper">
                <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
                    <div class="sidebar-brand">
                        <a href="productlist">
                            <img src="assets/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                            <img src="assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                        </a>
                    </div>

                    <!-- sidebar-menu  -->
                    <ul class="sidebar-menu pt-3">
                        <li><a href="productlist"><i class="uil uil-dashboard me-2 d-inline-block"></i>List Products</a></li>
                        <!-- add another here --> 
                        <li><a href="fashionshop"><i class="uil uil-dashboard me-2 d-inline-block"></i>Home</a></li>
                    </ul>

                </div>
                <!-- sidebar-content  -->
                <ul class="sidebar-footer list-unstyled mb-0">
                    <li class="list-inline-item mb-0 ms-1">
                        <a href="#" class="btn btn-icon btn-pills btn-soft-primary">
                            <i class="uil uil-comment icons"></i>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- sidebar-wrapper  -->

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <div class="top-header">
                    <div class="header-bar d-flex justify-content-between border-bottom">
                        <div class="d-flex align-items-center">
                            <a href="#" class="logo-icon">
                                <img src="assets/images/logo-icon.png" height="30" class="small" alt="">
                                <span class="big">
                                    <img src="assets/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                                    <img src="assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                                </span>
                            </a>
                            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                                <i class="uil uil-bars"></i>
                            </a>

                            <!-- search engine -->
                            <div class="search-bar p-0 d-none d-lg-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form action="search" method="post" id="searchform" class="searchform">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="s" id="s" placeholder="Search Keywords...">
                                            <input type="submit" id="searchsubmit" value="Search">
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>

                        <ul class="list-unstyled mb-0">

                            <li class="list-inline-item mb-0 ms-1">
                                <div class="dropdown dropdown-primary">
                                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/doctors/01.jpg" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                        <a class="dropdown-item d-flex align-items-center text-dark" href="https://shreethemes.in/doctris/layouts/admin/profile.html">
                                            <img src="assets/images/doctors/01.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                            <div class="flex-1 ms-2">
                                                <span class="d-block mb-1">Calvin Carlo</span>
                                                <small class="text-muted">Orthopedic</small>
                                            </div>
                                        </a>
                                        <a class="dropdown-item text-dark" href="#"><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Dashboard</a>
                                        <a class="dropdown-item text-dark" href="dr-profile.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                                        <div class="dropdown-divider border-top"></div>
                                        <a class="dropdown-item text-dark" href="lock-screen.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Product List</h5>
                        </div>

                        <div class="row">
                            <div class="col-12 lg-4">
                                <div class="table-responsive shadow rounded">
                                    <form action="deleteProduct" method="post">
                                        <table class="table table-center bg-white mb-0">
                                            <thead>
                                                <tr>
                                                    <th class="border-bottom p-3" style="min-width: 120px;">Name</th>
                                                    <th class="border-bottom p-3">Base Price</th>
                                                    <th class="border-bottom p-3">Price</th>
                                                    <th class="border-bottom p-3">Discount</th>
                                                    <th class="border-bottom p-3">Quantity</th>
                                                    <th class="border-bottom p-3" style="min-width: 30px;">State</th>
                                                    <th class="border-bottom p-3" style="min-width: 100px;">Style</th>
                                                    <th class="border-bottom p-3" style="min-width: 100px;"><a href="manageProduct">Add Product</a></th>
                                                    <th class="border-bottom p-3" style="min-width: 50px;"><input type="submit" value="DELETE"></a></th>
                                                </tr>
                                            </thead>
                                            <tbody id="tableBody" >
                                                <c:forEach items="${listP}" var="o">
                                                    <tr>
                                                        <td class="p-3">${o.name}</td>
                                                        <td class="p-3">${o.basePrice}VNĐ</td>
                                                        <td class="p-3">${o.price}VNĐ</td>
                                                        <td class="p-3">${o.discount}</td>
                                                        <td class="p-3">${o.quantity}</td>
                                                        <c:if test="${o.state == 1}"><td class="p-3">Active</td></c:if>   
                                                        <c:if test="${o.state == 0}"><td class="p-3">InActive</td></c:if>  
                                                        <td class="p-3">${o.style}</td>
                                                        <td class="text-end p-3">
                                                            <a href="manageProduct?id=${o.id}" class="btn btn-icon btn-pills btn-soft-success" ><i class="uil uil-pen"></i></a>
                                                            <a href="#" onclick="doDelete('${o.id}')" class ="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a>
                                                        </td>
                                                        <td><input type="checkbox" name="deleteRow" value="${o.id}"></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div><!--end row-->

                        <!-- PAGINATION START -->
                        <div class="row text-center">                                  
                            <div class="col-12 mt-4">
                                <ul style="justify-content: center" class="pagination" id="pagination">
                                    <form action="productlist" method="get">
                                        <label for="pageNumber">Number Product/Page:</label>
                                        <select style="margin-right: 20px" id="pageNumber" name="pageNumber" required>
                                            <option value="5">5</option>
                                            <option value="10">10</option>
                                        </select>
                                        </br><button type="submit">OK</button>
                                    </form>
                                    <li  class="page-item next"><a href="productlist?index=1&pageNumber=${num}"><i class="fa fa-angle-left" class="page-link" aria-hidden="true"></i></a></li>
                                            <c:forEach var = "i" begin = "1" end = "${numberPage}">
                                        <li class="${param['index']==i?'page-item active':'page-item'}"><a href="productlist?index=${i}&pageNumber=${num}"   class="page-link">${i}</a></li>
                                        </c:forEach>
                                    <li  class="page-item next"><a href="productlist?index=${numberPage}&pageNumber=${num}"><i class="fa fa-angle-right" class="page-link" aria-hidden="true"></i></a></li>
                                </ul>
                            </div><!--end col-->                                                
                        </div> <!-- PAGINATION END --> 

                    </div>
                </div><!--end container-->

                <!-- Footer Start -->
                <footer class="bg-white shadow py-3">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="text-sm-start text-center">
                                    <p class="mb-0 text-muted"><script>document.write(new Date().getFullYear())</script> © Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="index.html" target="_blank" class="text-reset">Shreethemes</a>.</p>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div><!--end container-->
                </footer><!--end footer-->
                <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->

        <!-- javascript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>
    </body>

</html>
