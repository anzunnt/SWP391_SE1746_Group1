<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thanh toán</title>
</head>
<body>
    <h1>Thông tin đơn hàng</h1>
    <p>Mã đơn hàng: ${orderId}</p>
    <p>Tổng tiền: ${totalAmount}</p>

    <a href="${pageContext.request.contextPath}/PaymentServlet">Thanh toán với VNPAY</a>
</body>
</html>