<%-- 
    Document   : changeProduct
    Created on : Oct 26, 2022, 2:14:18 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="css/changeProduct.css">
    <link rel="stylesheet" href="css/shopping.css">
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
                    </div>
                </div>

                <div class="manage-product">
                    <h1 style="text-align: center; margin-bottom: 30px;">Chỉnh sửa sản phẩm</h1>
                    <div class="manage-product-header">
                        <div class="manage-product-search">
                            <form class="manage-form-search" action="searchProductAdmin" method="get">
                                <div class="search-name">
                                    <p>Tên: </p>
                                    <input type="text" name="nameSearch" value="" placeholder="Nhập tên">
                                </div>
                                <div class="search-price">
                                    <p>Giá: </p>
                                    <input type="text" name="minPrice" value="" placeholder="Từ">
                                    <p>&nbsp&nbsp&nbsp-&nbsp</p>
                                    <input type="text" name="maxPrice" value="" placeholder="Đến"> 
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

                <div class="change-product">
                    <div class="row change-product-row">
                        <div style="width: 45%;" class="col-md-6 old-product">
                            <h3 style="text-align: center; color: green; padding-bottom: 30px;">Sản phẩm cũ</h3>
                            <div style="width: 100%;" class="old-product-image">
                                <img style="width:100%" src="${requestScope.product.getPicture()}" alt="">
                            </div>
                            <div class="old-product-infor">
                                <p>ID sản phẩm: ${requestScope.product.getProductID()}</p>
                                <p>Tên sản phẩm: ${requestScope.product.getProductName()}</p>
                                <p>Giá: ${requestScope.product.getUnitPrice()}</p>
                                <p>Số lượng trong kho: ${requestScope.product.getUnitInStock()}</p>
                            </div>
                        </div>

                        <div style="width: 45%;" class="col-md-6 new-product">
                            <h3 style="text-align: center; color: green; padding-bottom: 30px;">Sản phẩm mới</h3>
                            <form action="changeProduct" method="post">
                                <p>Tên sản phẩm mới: <input type="text" value="" name="newName" placeholder="Nhập tên mới"></p>
                                <p>Loại sản phẩm: 
                                <select name="newCategory">
                                    <option value="1">Đồ ăn</option>
                                    <option value="2">Nước uống</option>
                                    <option value="3">Combo</option>
                                </select></p>
                                <p>Giá sản phẩm mới: <input type="text" value="" name="newPrice" placeholder="Nhập giá mới"></p>
                                <p>Số lượng trong kho: <input type="text" value="" name="newUnitInStock" placeholder="Nhập số lượng mới"></p>
                                <p>Link ảnh sản phẩm: <input type="text" value="" name="newPicture" placeholder="Nhập đường dẫn ảnh mới"></p>
                                <input class="save" type="submit" value="Lưu thay đổi"><br>
                                <a class="noSave" href="manageProduct">Không thay đổi</a>
                            </form>
                        </div>
                    </div>
                        
                </div>
            </div>
        </div>
    </div>
</body>
</html>
