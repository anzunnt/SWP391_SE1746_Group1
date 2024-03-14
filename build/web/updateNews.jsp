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

            h1 {
                font-size: 20px;
                margin-left: 25%;
                color: blue;
            }
        </style>
        <title>Management Product</title>
    </head>
    <body>
        <div style="text-align: center">
            <form action="newlist" method="post" onsubmit="return confirmAction('update')" enctype="multipart/form-data">
                <input type="hidden" name="action" value="update">

                <input type="hidden" name="id" value="${not empty cate ? cate.id : ''}">

                <label for="banner">Banner Image URL:</label>
                <input type="file" id="banner" name="banner" value="${not empty cate ? cate.banner : ''}" >
                <br>

                <label for="blogTitle">Blog Title:</label>
                <input type="text" id="blogTitle" name="title" value="${not empty cate ? cate.blog_title : ''}" required>
                <br>

                <label for="newsContent">News Content:</label>
                <textarea id="newsContent" name="body" required>${not empty cate ? cate.blog_body1 : ''}</textarea>
                <br>

                <label for="category">Select Category:</label>
                <select id="category" name="category">
                    <c:forEach var="categoryItem" items="${cateItem}">
                        <option value="${categoryItem}">${categoryItem}</option>
                    </c:forEach>
                </select>


                <label for="image1">Image 1 URL:</label>
                <input type="file" id="image1" name="img" value="${not empty cate ? cate.img1 : ''}">
                <br>

                <input type="hidden" name="viewCount" value="0">
                <input type="hidden" name="status" value="active">

                <input type="submit" value="Update News">
            </form>
        </div>
    </body>
    <script>
        function confirmAction(action) {
            var confirmation = confirm("Are you sure you want to " + action + " this news?");
            return confirmation;
        }
    </script>
</html>