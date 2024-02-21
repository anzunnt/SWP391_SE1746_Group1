<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.lang.Math" %>
<!DOCTYPE html>
<html lang="en">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h2 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: center; /* Center-align text in cells */
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #f5f5f5;
        }

        button {
            padding: 4px 12px;
            cursor: pointer;
            background-color: #3498db;
            color: white;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        a {
            text-decoration: none;
            color: #3498db;
        }

        .remove-button {
            background-color: #fff;
            color: #e74c3c;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .quantity-value {
            background-color: #3498db;
            color: white;
            font-weight: bold;
            margin: 10 5px;
            padding: 7px 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        /* Existing CSS styles */

        .shop-more-button {
            font-size: 18px;
            font-weight: bold;
            margin-bottom:  10px;
            padding: 15px 20px;
            cursor: pointer;
            background-color: #27ae60; /* Green color, you can change this */
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none; /* Remove default link underline */
        }

        .grand-total-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .grand-total {
            font-size: 18px;
            font-weight: bold;
            padding: 10px;
            background-color: #3498db;
            color: white;
            border-radius: 4px;
        }

        .grand-total span {
            margin-left: 10px;
            font-weight: normal;
        }




    </style>
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

        <jsp:include page="header.jsp" />

        <div style="margin-top: 80px; text-align: center; max-width: 1000px; margin-left: auto; margin-right: auto;">
            <h2>Shop Cart</h2>

            <c:if test="${empty sessionScope['cart']}">
                <p style="font-style: italic;">No items in the cart</p>
            </c:if>

            <table border="1">
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Remove</th>
                        <!-- Add more columns as needed -->
                    </tr>
                </thead>
                <tbody>
                    <c:set var="grandTotal" value="0" />
                    <c:forEach var="item" items="${sessionScope['cart']}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${item.product.name}</td>
                            <td>${Math.round(item.product.price - (item.product.price * item.product.discount))}.000</td>
                            <td>
                                <form action="fashionshop" method="post">
                                    <input type="hidden" name="productId" value="${loop.index}">
                                    <button type="submit" name="action" value="decrement">-</button>
                                    <span class="quantity-value">${item.quantity}</span>
                                    <button type="submit" name="action" value="increment">+</button>
                                </form>
                            </td>
                            <td>${Math.round((item.product.price - (item.product.price * item.product.discount)) * item.quantity)}.000</td>
                            <td>
                                <a href="fashionshop?action=deleteCart&productId=${loop.index}">
                                    <button class="remove-button">X</button>
                                </a>
                            </td>
                        </tr>
                        <c:set var="grandTotal" value="${Math.round(grandTotal + (item.quantity * (item.product.price - (item.product.price * item.product.discount))))}" />
                    </c:forEach>
                </tbody>
            </table>
            <div class="grand-total-container">
                <a href="fashionshop" class="shop-more-button">Shop More</a>
                <div class="grand-totalpurchase-container">
                    <p class="grand-total">Grand Total: <span>${grandTotal}.000</span></p>
                    <div>
                    <form action="your_purchase_action" method="post">
                        <button type="submit" class="purchase-button">Purchase</button>
                    </form><!-- comment -->
                    </div>
                </div>
            </div>

        </div>


        <!-- Your existing content goes here -->

        <jsp:include page="footer.jsp" />
    </body>
</html>