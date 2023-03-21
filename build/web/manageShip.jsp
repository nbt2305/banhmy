<%-- 
    Document   : Admin
    Created on : Oct 25, 2022, 4:24:37 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dal.*" %>
<%@page import="models.*" %>
<%@page import="java.until.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="css/bootstrap-5.0.2-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="fonts/fontawesome-free-6.1.2-web/css/all.min.css">
    <script src="css/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/admin.css">
    <link rel="stylesheet" href="css/styleindex.css">
    <link rel="stylesheet" href="css/manageUser.css"/>
</head>
<body>
    <div class="row">
        <div class="col-md-2">
            <div class="leftt">
                <div class="admin-leftt">
                <div class="admin-left-header">
                    <div class="admin-left-header-logo">
                        <img src="images/contact-logo.png" alt="">
                    </div>
                </div>
                <div class="admin-title">
                    <div class="admin-title-detail">
                        <i class="fa-brands fa-product-hunt"></i>
                        <a href="manageProduct">Quản lý sản phẩm</a>
                    </div>

                    <div class="admin-title-detail">
                        <i class="fa-solid fa-user"></i>
                        <a href="manageUser">Quản lý người dùng</a>
                    </div>

                    <div class="admin-title-detail">
                        <i class="fa-sharp fa-solid fa-bars-progress"></i>
                        <a href="manageAdmin">Quản lý admin</a>
                    </div>

                    <div class="admin-title-detail">
                        <i class="fa-sharp fa-solid fa-truck"></i>
                        <a href="manageShip">Quản lý đơn hàng</a>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <div class="col-md-10">
            <div class="admin-right">
                <div class="admin-right-header">
                    <div class="title">
                        <h3>Bánh Mỳ Việt Nam</h3>
                    </div>
                    <div class="admin-right-header-user">
                        <p>${sessionScope.admin.getName()}</p>
                        <i class="fa-solid fa-user"></i>
                        <div class="log-out">
                            <a style="color: green; margin-left: 10px" href="homeBefore"> <i class="fa-solid fa-right-from-bracket"></i></a>
                        </div>
                    </div>
                </div>

                <div class="admin-right-body">
                    <!--Product row 1-->
                    <h2 style="color: green; font-size: 30px; font-weight: bold">Quản lý đơn đặt hàng</h2>
                    <!--<h3 style="color: green; font-size: 20px; text-align: center">${requestScope.bell}</h3>-->
                    <div class="table-wrapper">
                        <table class="fl-table">
                            <thead>
                            <tr>
                                <th>Tên tài khoản</th>
                                <th>Tên khách hàng</th>
                                <th>Địa chỉ</th>
                                <th>Số điện thoại</th>
                                <th>Tổng hóa đơn</th>
                                <th>Yêu cầu</th>
                                <th>Thời gian đặt hàng</th>
                                <th>Chi tiết đơn hàng</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.listOrderDetails}" var="i">
                                    <tr>
                                        <td>${i.getAccountName()}</td>
                                        <td>${i.getCustomerName()}</td>
                                        <td>${i.getAddress()}</td>
                                        <td>${i.getPhone()}</td>
                                        <td>${i.getTotalPrice()}</td>
                                        <td>${i.getNote()}</td>
                                        <td>${i.getDate()}</td>
                                        <td>${i.getDetails()}</td>
                                        <!--<td><a style="background-color: green; padding: 5px; color: white; text-decoration: none" href="downAdminToUser?AccountName=${i.getAccountName()}">Xóa quyền Admin</a>&nbsp; &nbsp;<a style="background-color: red; padding: 5px;color: white; text-decoration: none" href="removeUser?AccountName=${i.getAccountName()}">Xóa</a></td>-->
                                    </tr>
                                </c:forEach>
                            <tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
