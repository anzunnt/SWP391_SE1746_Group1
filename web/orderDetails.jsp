<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="controller.*, dal.*,model.*,java.util.*,java.io.*"%>
<!DOCTYPE html>
<html>
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

<body style="background-color: #E6F9E6;">

    <script >
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");

	}

	OrderService dao = new OrderDAO();
	List<OrderDetails> orders = dao.getAllOrderDetails(userName);
        String time = request.getParameter("time");
       String status = request.getParameter("status");
	</script>



	<jsp:include page="header.jsp" />

	<!-- <script>document.getElementById('mycart').innerHTML='<i data-count="20" class="fa fa-shopping-cart fa-3x icon-white badge" style="background-color:#333;margin:0px;padding:0px; margin-top:5px;"></i>'</script>
 -->
	<div class="text-center"
		style="color: blue; font-size: 24px; font-weight: bold; margin-top: 120px">Order Details</div>
	<!-- Start of Product Items List -->
	<div class="container">
		<div class="table-responsive ">
			<table class="table table-hover table-sm">
				<thead
					style=" margin-top: 30px; background-color: blue; color: white; font-size: 14px; font-weight: bold;">
					<tr>
						<th>Item</th>
                                                <th>Product Name</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Time</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
                    <c:set var="grandTotal" value="0" />
                    <c:forEach var="item" items="${sessionScope['cart']}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${item.product.name}</td>       
                            <td>                                 
                                    <span class="quantity-value">${item.quantity}</span>                                         
                            </td>
<!--                             <td>${Math.round(item.product.price - (item.product.price * item.product.discount))}.000VNÐ</td>-->
                             
                            <td>${Math.round((item.product.price - (item.product.price * item.product.discount)) * item.quantity)}.000VNÐ</td>
                           <td>${param.time}</td> 
                            <td>${param.status}</td>
                        <c:set var="grandTotal" value="${Math.round(grandTotal + (item.quantity * (item.product.price - (item.product.price * item.product.discount))))}" />
                    </c:forEach>
                </tbody>
                </table>
		</div>
	</div>
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
    
</body>

</html>
