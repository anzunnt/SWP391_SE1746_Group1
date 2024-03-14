<!DOCTYPE html>
<html lang="en" class="h-100">

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

     <style>
                    .content {
                        display: flex;
                        justify-content: space-between;
                    }

                    .shopping_cart {
                        width: 60%; /* ?? r?ng c?a ph?n gi? hàng */
                    }

                    .total {
                        width: 35%; /* ?? r?ng c?a ph?n t?ng c?ng */
                    }

                    .login_buttons {
                        margin-top: 20px; /* Kho?ng cách gi?a ph?n t?ng c?ng và ph?n nút ??ng nh?p */
                    }

                    .check_button {
                        float: right; /* C?n ph?i nút Check out */
                    }

                    .clearfix {
                        clear: both; /* Xóa các float */
                    }
                    .h4{
                      text-align: center;  
                    }

                .list_close a,
                .login_buttons a {
                    display: inline-block; /* Display links as inline-block to make them appear side by side */
                    font-weight: bold; /* Make the text bold */
                    margin-right: 10px; /* Add some spacing between the links */
                }

                </style>
                
                <script>
                    <!--  Hàm ki?m tra ??ng nh?p -->
                function checkLogin() {
                    <!-- Th?c hi?n ki?m tra ??ng nh?p ? ?ây -->
                    var isLoggedIn = /* code kiem tra dang nhap */;
                    return isLoggedIn;
                }

                <!-- click trên nút Checkout -->
                document.querySelector('.check_button a').addEventListener('click', function(event) {
                <!-- Ki?m tra n?u ch?a ??ng nh?p 
                 Ng?n ch?n hành ??ng m?c ??nh c?a nút nh?n 
                 Hi?n th? thông báo yêu c?u ??ng nh?p
                 hi?n th? form ??ng nh?p t?i ?ây
                --> 
                    if (!checkLogin()) {
                    event.preventDefault(); 
                    alert('Please login first.'); 
                    
                    }
                });
                </script>

    <!-- header -->
            <jsp:include page="header.jsp"/>

            <main role="main" style="margin-top: 100px">
        <!-- Block content -->
        <div class="container mt-4">
            <form class="needs-validation" name="frmthanhtoan" action="orderDetails.jsp" method="post" >
                <input type="hidden" name="kh_tendangnhap" value="dnpcuong">
                <div class="row">                                  
                    <div class="container" style="margin-bottom: 80px">
                   <div class="content">
                        <div class="shopping_cart">
                            <c:forEach var="item" items="${sessionScope['cart']}" varStatus="loop">
                                <div class="cart_box">
                                    <div class="message">
                                        <!-- Adjusted styling for the links -->
                                        <div class="list_close">
                                            <a href="${pageContext.request.contextPath}/cart${item.value.product.productId}.jsp"><-- BACK</a>
                                        </div>
<!--                                        <div class="login_buttons">
                                            <a class="check_button" href="login">Checkout</a>
                                        </div>-->
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </c:forEach>         
                            <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <div class="col-md-8 order-md-1" style="margin-bottom: 50px">
                        <h4 class="mb-3" >Customer Information</h4>

                        <div class="row">
                            <div class="col-md-12">
                                <label for="kh_ten">Name</label><br>
                                <input type="text" class="form-control" name="kh_ten" id="kh_ten" placeholder="Enter full name">
                            </div>

                            <div class="col-md-12">
                                <label for="kh_diachi">Address</label><br>
                                <input type="text" class="form-control" name="kh_diachi" id="kh_diachi" placeholder="Enter address">
                            </div>
                            <div class="col-md-12">
                                <label for="kh_dienthoai">Phone</label><br>
                                <input type="text" class="form-control" name="kh_dienthoai" id="kh_dienthoai" placeholder="Enter number phone">
                            </div>
                            <div class="col-md-12">
                                <label for="kh_email">Email</label><br>
                                <input type="text" class="form-control" name="kh_email" id="kh_email" placeholder="Enter email">
                            </div>

                        </div>

                        <h4 class="mb-3">Payment Method</h4>

                        <div class="d-block my-3">
                            <div class="custom-control custom-radio">
                                <input id="httt-1" name="httt_ma" type="radio" class="custom-control-input" required="" value="1">
                                <label class="custom-control-label" for="httt-1">Ship COD (Cash on Delivery)</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input id="httt-2" name="httt_ma" type="radio" class="custom-control-input" required="" value="2">
                                <label class="custom-control-label" for="httt-2">Bank Transfer</label>
                            </div>
                        </div>
                        <hr class="mb-4">
                        <button type="submit" class="purchase-button"><a href="${pageContext.request.contextPath}/PaymentServlet">Submit</a></button>

                    </div>
                </div>
           

        </div>
            </form>
        </div>        
        <!-- End block content -->
    </main><br>

    <!-- footer -->
            <jsp:include page="footer.jsp"/>
    <!--end footer-->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/popperjs/popper.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Custom script -->
    <script src="../assets/js/app.js"></script>
    
<script>
    
    window.onload = function() {
        var successMessage = document.getElementById("successMessage");
        successMessage.style.display = "block";
    };
</script>
</body>

</html>
