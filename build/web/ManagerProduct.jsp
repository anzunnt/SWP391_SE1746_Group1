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
        <style>
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
                margin-bottom: 16px;
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
                margin-left: 25%;
                color: blue;
            }
        </style>
        <title>Management Product</title>
    </head>
    <body>
        <h1>You are ${doing} a product!</h1>
        <h1 style="color: red">${error}</h1>
        <c:set var="o" value="${requestScope.product}"/>
        <div style="text-align: center">
            <form action="manageProduct" method="post"><!-- Replace "#" with your form submission URL -->
                <input type="text" hidden="true" name="id" value="${o.id}">
                <label for="name">Product Name:</label>
                <input type="text" id="name" name="name" value="${o.name}"required>

                <label for="description">Description:</label>
                <textarea id="description" name="description" required>${o.description}</textarea>

                <label for="basePrice">Base Price:</label>
                <input type="number" id="basePrice" name="basePrice" value="${o.basePrice}" step="0.01" required>

                <label for="price">Actual Price:</label>
                <input type="number" id="price" name="price" value="${o.price}" step="0.01" required>

                <label for="discount">Discount:</label>
                <input type="number" id="discount" name="discount" value="${o.discount}" step="0.01">

                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" name="quantity" value="${o.quantity}" required>

                <label for="style">Style:</label>
                <input type="text" id="style" name="style" value="${o.style}" required>
                
                <label for="startsAt">Publish At:</label>
                <input type="text" id="publishedAt" name="publishedAt" value="${o.publishedAt}">
                
                <label for="state">State:</label>
                <select id="state" name="state" value="${o.state}" required>
                    <option value="1">Active</option>
                    <option value="0">Inactive</option>
                </select>

                <label for="startsAt">Starts At:</label>
                <input type="text" id="startsAt" name="startsAt" value="${o.startsAt}">

                <label for="endsAt">Ends At:</label>
                <input type="text" id="endsAt" name="endsAt" value="${o.endsAt}">

                </br><button type="submit">${doing} Product</button>
            </form>
        </div>
    </body>
</html>
