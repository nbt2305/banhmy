<%-- 
    Document   : Category
    Created on : Oct 23, 2022, 9:32:35 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories</title>
    <link rel="stylesheet" href="css/bootstrap-5.0.2-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="fonts/fontawesome-free-6.1.2-web/css/all.min.css">
    <script src="css/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/styleindex.css">
    <link rel="stylesheet" href="css/categories.css">
    <link rel="stylesheet" href="css/User.css">
    <script src="js/myCode.js"></script>
</head>
<body>
    <!--Logo and search-->
    
    <div class="header">
        <div class="row header-content">
            <div class="col-md-4 header-logo">
                <img src="images/logo-bmq.png" alt="">
            </div>
            <div class="col-md-3 header-search">
                <form action="search" method="post">
                    <input type="text" name="search" placeholder="Bạn muốn tìm gì?">
                    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
            <div class="col-md-2 header-advise">
                <div class="icon">
                    <i class="fa-solid fa-headphones"></i>
                </div>
                <div class="header-advise-text">
                    <a href="">Tư vấn khách hàng</a>
                    <a href="">0983734475</a>
                </div>
            </div>
            <div class="col-md-1 header-shopping">
                <div style="position: relative;" class="icon">
                    <a class="shoppingCart" style="color: white; text-decoration: none;" href="shoppingCart?AccountName=${sessionScope.account.getAccountName()}">
                      <i class="fa-sharp fa-solid fa-cart-shopping"></i>
                    </a>
                    <p style="position: absolute; top: 15px; left: 25px;background-color: #fcba03;border-radius: 50%;padding: 0 6px 0 6px">${sessionScope.quantity}</p>
                </div>
            </div>

            <div class="col-md-2 header-login">
                <div style="margin-right: 10px" class="sign-up">
                  <i style="color: white" class="fa-solid fa-user"></i>
              </div>
              <div class="log-in">
                  <p style="color: white">${sessionScope.account.getName()}</p>
              </div>
              <div>
                  <a onclick="tuyChon()" href="#" style="color: white; width: 200px">Tùy chọn <i class="fa-solid fa-caret-down"></i></a>
                  <div class="tuyChon" style="margin-top: 10px; position: absolute; z-index: 1000; display: none; flex-direction: column">
                      <a style="background-color: green; padding-top: 0px;" href="changeInfoUser?AccountName=${sessionScope.account.getAccountName()}">Chỉnh sửa</a>
                      <a style="background-color: green" href="homeBefore">Đăng xuất</a> 
                  </div>
              </div>
          </div>
        </div>
    </div>

    <!--Fixed Phone Number-->
    <div class="fixed-phone">
        <div class="fixed-phone-icon">
            <i class="fa-sharp fa-solid fa-phone"> 098 373 4475</i>
        </div>
    </div>

    
</body>
</html>
