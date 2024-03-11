<%-- 
    Document   : addUser
    Created on : Jan 17, 2024, 2:47:30 PM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<
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
        <title>Management Admin</title>
    </head>
    <body>
        <button onclick="history.back()">Go Back</button>
        <h1>${doing} a Admin!</h1>
        <h1 style="color: red">${error}</h1>
        <c:set var="o" value="${requestScope.admin}"/>
        <div style="text-align: center">
            <form action="manageUser" method="post" autocomplete="off"><!-- Replace "#" with your form submission URL -->
                <input type="text" hidden="true" name="id" value="${o.id}" disabled="">

                <label for="description">User Name:</label>
                <input type="text" id="username" name="username" value="${o.username}" >

                <label for="basePrice">Password:</label>
                <input type="password" id="password" name="password" value="${o.password}">

                <label class="form-label">Created On <span class="text-danger">*</span></label>
                <input type="date" class="form-control" id="created_on" name="created_on" value="${o.created_on}" disabled="">

                <label for="description">Created By:</label>
                <input type="text" id="created_by" name="created_by" value="${o.created_by}" disabled="">

                <label class="form-label">Modified On <span class="text-danger">*</span></label>
                <input type="date" class="form-control" id="modified_on" name="modified_on" value="${o.modified_on}" disabled="">

                <label for="description">Modified By:</label>
                <input type="text" id="modified_by" name="modified_by" value="${o.modified_by}" disabled="">

                </br><button type="submit">${doing} Admin</button>
            </form>
        </div>
    </body>
</html>
