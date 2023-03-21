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
    <link rel="stylesheet" href="css/managerProduct.css">
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

                <div class="manage-product">
                    <h1 style="text-align: center; margin-bottom: 30px;">Quản lý sản phẩm</h1>
                    <div class="manage-product-header">
                        <div class="manage-product-search">
                            <form class="manage-form-search" action="searchProductAdmin" method="get">
                                <div class="search-name">
                                    <p>Tên: </p>
                                    <input type="text" name="nameSearch" value="${requestScope.nameSearch}" placeholder="Nhập tên">
                                </div>
                                <div class="search-price">
                                    <p>Giá: </p>
                                    <input type="text" name="minPrice" value="${requestScope.minPrice}" placeholder="Từ">
                                    <p>&nbsp&nbsp&nbsp-&nbsp</p>
                                    <input type="text" name="maxPrice" value="${requestScope.maxPrice}" placeholder="Đến"> 
                                    <input style="background-color: green;color: white;border: none; margin-left: 10px;" type="submit" value="Tìm kiếm">
                                </div>
                            </form>
                        </div>
    
                        <div class="manage-product-add">
                            <i class="fa-solid fa-plus"></i>
                            <a href="addProduct.jsp"><input style="background-color: green;color:white;border: none; padding: 4px;" type="submit" value="Thêm sản phẩm"></a>
                        </div>
                        
                    </div>
                </div>

                <div class="results">
                    <p style="font-size: 20px; text-align: center;">Hiển thị ${requestScope.listProducts.size()} kết quả</p>
                </div>
                
                <div class="admin-right-body">
                    <!--Product row 1-->
                    <div class="row product-row">
                        <c:forEach items="${requestScope.listProducts}" var="i">
                            <div style="margin-bottom:50px;" class="col-md-4 product-cards-details">
                            <div class="card" style="width: 90%;">
                                <img style="height: 17rem;" src="${i.getPicture()}" class="card-img-top" alt="...">
                                <div class="card-body">
                                <h5 class="card-title">${i.getProductName()}</h5>
                                <p style="color: green;" class="card-text"><span style="color: red; font-weight: bold;">${i.getUnitPrice()}<span style="text-decoration-line: underline">đ</span></span></p>
                                <a href="loadProduct?ProductID=${i.getProductID()}" class="product-buy">Chỉnh sửa</a>
                                <a href="deleteProduct?ProductID=${i.getProductID()}" class="product-buy">Xóa</a>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                </div>
            </div>
            </div>
            
        </div>
    </div>
</body>
</html>
