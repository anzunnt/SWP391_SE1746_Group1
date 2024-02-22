<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Quản lý hình ảnh</title>
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
    </head>
    <body>
        <h1>Danh sách hình ảnh</h1>
        <div id="image-container">
            <div class="row">
                <div class="col-12 lg-4">
                    <div class="table-responsive shadow rounded">
                        <form action="deleteProduct" method="post">
                            <table class="table table-center bg-white mb-0">
                                <thead>
                                    <tr>
                                        <th class="border-bottom p-4">Id</th>
                                        <th class="border-bottom p-4" style="min-width: 120px;">Image</th>
                                        <th class="border-bottom p-4">Image Description</th>
                                    </tr>
                                </thead>
                                <tbody id="tableBody" >
                                    <c:forEach items="${listP}" var="o">
                                        <tr>
                                            <td class="p-4">${o.id}</td>
                                            <td class="p-4"><img style="width: 100px;height: 120px" src="${o.image}" class="img-fluid" alt=""></td>
                                            <td class="p-4">${o.imageDescription}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div><!--end row-->
        </div>
        <div style="margin-top: 50px">
            <form action="manageImage" method="post" enctype="multipart/form-data">
                <input type="text" hidden="true" name="id" value="${id}">
                <input type="file" name="file">
                <label for="name">Description:</label>
                <input type="text" id="description" name="description" required>
                <input type="submit" value="Tải lên">
            </form>
                <form style="margin-top: 50px" action="manageImage" method="post">
                <input type="text" name="imageId" placeholder="Nhập ID hình ảnh để xóa">
                <input type="submit" value="Xóa">
            </form>
        </div>     
    </body>
</html>
