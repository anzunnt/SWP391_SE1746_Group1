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
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete image with id " + id)) {
                    window.location = "deleteImage?id=" + id;
                }
            }
        </script>
        <style>
            button {
                background-color: blue;
                color: #fff;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <button onclick="history.back()">Go Back</button>
        <h1 style="font-size:25px">Danh sách hình ảnh của product có id = ${id}</h1>
        <div style="border-bottom: solid gray"id="image-container">
            <div class="row">
                <div class="col-12 lg-4">
                    <div class="table-responsive shadow rounded">
                        <form action="manageImage" method="get">
                            <table class="table table-center bg-white mb-0">
                                <thead>
                                    <tr>
                                        <th class="border-bottom p-4">Id</th>
                                        <th class="border-bottom p-4" style="min-width: 120px;">Image</th>
                                        <th class="border-bottom p-4">Delete</th>
                                    </tr>
                                </thead>
                                <tbody id="tableBody" >
                                    <c:forEach items="${listP}" var="o">
                                        <tr>
                                            <td class="p-4">${o.id}</td>
                                            <td class="p-4"><img style="width: 100px;height: 120px" src="${o.image}" class="img-fluid" alt=""></td>
                                            <td class="p-4"><a href="#" onclick="doDelete('${o.id}')" class ="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-trash"></i></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div><!--end row-->
        </div>
        <div style="margin-top: 25px;">
            <form style="margin-left: 50%"action="manageImage" method="post" enctype="multipart/form-data">
                <input type="text" hidden="true" name="id" value="${id}">
                <input type="file" name="file">
                <input type="submit" value="Tải lên">
            </form>
        </div>     
    </body>
</html>
