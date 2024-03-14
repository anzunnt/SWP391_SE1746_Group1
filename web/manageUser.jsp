<%-- 
    Document   : addUser
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
        <title>Management User</title>
    </head>
    <body>
        <button onclick="history.back()">Go Back</button>
        <h1>${doing} an user!</h1>
        <h1 style="color: red">${error}</h1>
        <c:set var="o" value="${requestScope.user}"/>
        <div style="text-align: center">
            <form action="manageUser" method="post"><!-- Replace "#" with your form submission URL -->
                <input type="text" hidden="true" name="id" value="${o.id}">
                <label for="name">Full Name:</label>
                <input type="text" id="fullname" name="fullname" value="${o.fullname}"required>

                <label for="description">User Name:</label>
                <input type="text" id="username" name="username" value="${o.username}" required>

                <label for="basePrice">Password:</label>
                <input type="password" id="password" name="password" value="${o.password}" required>

                <label for="price">Code Verify:</label>
                <input type="text" id="code_verify" name="code_verify" value="${o.code_verify}" required>

                <label for="discount">Email:</label>
                <input type="text" id="email" name="email" value="${o.email}">

                <label for="quantity">Phone:</label>
                <input type="text" id="phone" name="phone" value="${o.phone}" required>
                <!--
                                <label for="style">Image:</label>
                                <input type="file" id="image" name="image" value="" accept="image/*" required>
                                </br>
                                <img src="${o.image}" alt="Avatar" width="100px" height="100px">-->

                <label class="form-label">Birthday <span class="text-danger">*</span></label>
                <input type="date" class="form-control" id="dob" name="dob" value="${o.dob}" required="">

                <label class="form-label">Address <span class="text-danger">*</span></label>
                <input type="text" class="form-control" id="address" name="address" value="${o.address}" required="">

                <label for="status">Status:</label>
                <select id="status" name="status" value="${o.status}" required>
                    <option value="1">Active</option>
                    <option value="0">Disable</option>
                </select>

                </br><button type="submit">${doing} User</button>
            </form>
        </div>
    </body>
</html>
