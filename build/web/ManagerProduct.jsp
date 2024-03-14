<%-- 
    Document   : addProduct
    Created on : Jan 17, 2024, 2:47:30 PM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="assets/images/favicon.ico.png">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
        <style>
            form {
                display: grid;
                gap: 10px;
                grid-template-columns: 1fr 3fr;
                max-width: 90%; /* Adjust as needed */
                margin: 0 auto; /* Center the form */
            }

            label {
                text-align: right;
                padding-right: 10px;
                line-height: 30px; /* Adjust as needed */
            }

            input[type="text"],
            input[type="number"],
            textarea,
            select {
                width: 100%;
                padding: 5px;
                box-sizing: border-box;
            }

            button[type="submit"] {
                margin-left: 50%;
                margin-top: 10px;
            }
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 600px;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            label {
                display: flex;
                margin-bottom: 8px;
                margin-left: 25%;
            }

            input, select, textarea {
                width: 50%;
                padding: 8px;

                box-sizing: border-box;
            }

            button {
                background-color: blue;
                color: #fff;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            h1{
                font-size: 20px;
                margin-left: 10%;
                color: blue;
            }
        </style>
        <title>Management Product</title>
    </head>
    <body>
        <button onclick="history.back()">Go Back</button>
        <h1>${doing} a product!</h1>
        <h1 style="color: red">${error}</h1>
        <c:set var="o" value="${requestScope.product}"/>
        <div style="text-align: center">
            <form action="manageProduct" method="post"><!-- Replace "#" with your form submission URL -->
                <input type="text" hidden="true" name="id" value="${o.id}">
                <label for="name">Product Name:</label>
                <input type="text" id="name" name="name" value="${o.name}"required>

                <label for="description">Description:</label>
                <textarea rows="707px" cols="100px" id="description" name="description" required>${o.description}</textarea>

                <label for="basePrice">Base Price:</label>
                <input type="number" id="basePrice" name="basePrice" value="${o.basePrice}" step="1" required placeholder=".........(.000đ)">

                <label for="price">Actual Price:</label>
                <input type="number" id="price" name="price" value="${o.price}" step="1" required placeholder=".........(.000đ)">

                <label for="discount">Discount:</label>
                <input min="0" max="100" type="number" id="discount" name="discount" value="${o.discount}" step="1">

                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" name="quantity" value="${o.quantity}" required>

                <label for="startsAt">Publish At:</label>
                <input type="datetime-local" id="publishedAt" name="publishedAt" value="${o.publishedAt}">

                <label for="state">State:</label>
                <select id="state" name="state" value="${o.state}" required>
                    <c:if test = "${o.state != 0}">
                        <option value="1" selected="">Active</option>
                        <option value="0">Inactive</option>
                    </c:if>
                    <c:if test = "${o.state == 0}">
                        <option value="1">Active</option>
                        <option value="0" selected="">Inactive</option>
                    </c:if>
                </select>

                <label for="startsAt">Starts At:</label>
                <input type="datetime-local" id="startsAt" name="startsAt" value="${o.startsAt}">

                <label for="endsAt">Ends At:</label>
                <input type="datetime-local" id="endsAt" name="endsAt" value="${o.endsAt}">

                <label for="category">Category:</label>
                <select id="category" name="category" required>
                    <c:forEach items="${listC}" var="category">
                        <option ${(cid == category.id)?'selected':''} value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
                </br><button type="submit">${doing} Product</button>
            </form>
            <script>//CKEDITOR.replace('description');
                var editor = '';
                $(document).ready(function () {
                    editor = CKEDITOR.replace('description');
                });
            </script>
        </div>
    </body>
</html>
