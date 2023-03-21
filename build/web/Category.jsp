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
                      <a style="background-color: green; padding-top: 0px;" href="changeInfoUser?AccountName=${sessionScope.account.getAccountName()}>Chỉnh sửa</a>
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

    <!--Trang chu-->

      <!--Location-->
      <div class="location">
        <div class="location-content">
            <div class="location-link">
                <a href="home">Trang chủ</a> / <a style="color: black;" href="">${sessionScope.category.getCategoryName()}</a>
            </div>
            <p>Hiển thị tất cả ${requestScope.listProducts.size()} kết quả</p>
        </div>
      </div>

      <!--Sản phẩm-->
      <div style="margin-top: 0" class="product">
        <div class="container product-cards">
          <h1>Sản phẩm Bánh Mỳ Việt Nam</h1>
        <div class="row product-row">
          <c:forEach items="${requestScope.listProducts}" var="i">
            <div style="margin-bottom:50px;" class="col-md-4 product-cards-details">
              <div class="card" style="width: 100%;">
                <img style="height: 17rem;" src="${i.getPicture()}" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">${i.getProductName()}</h5>
                  <p style="color: green;" class="card-text"><span style="color: red; font-weight: bold;">${i.getUnitPrice()}<span style="text-decoration-line: underline">đ</span></span></p>
                  <a href="shopping?ProductID=${i.getProductID()}" class="product-buy">Mua hàng</a>
                  <a href="shoppingCartLoadData?ProductID=${i.getProductID()}" class="product-buy">Thêm vào giỏ hàng</a>
                </div>
              </div>
            </div>
          </c:forEach>
          </div>
        </div>
      </div>
          
          <!--Footer-->
      <div class="footer">
        <div class="footer-image">
          <img src="images/footer/Screenshot 2022-10-22 183211.png" alt="">
        </div>
        <div class="container">
          <div class="row footer-row">
            <div class="col-md-6">
              <div class="footer-left">
                <h2>Bánh Mỳ Việt Nam</h2>
              Nâng cao chất lượng và khẩu vị cho người tiêu dùng Việt, qua đó thể hiện được sự đa dạng trong nét văn hóa ẩm thực người Việt. “Ngon – sạch – Nhanh – chất lượng” là tiêu chí mà chúng tôi hướng đến để phục vụ quý vị một cảm giác tinh tế nhất trong bữa ăn thường ngày
              </div>
            </div>
            <div class="col-md-6">
              <h3>Thông tin liên hệ</h3>
              <div class="footer-right">
                <div class="footer-right-detail">
                  <i class="fa-solid fa-location-dot"></i>
                  <p>Cổng trường đại học FPT</p>
                </div>
                <div class="footer-right-detail">
                  <i class="fa-solid fa-phone"></i>
                  <p>Hotline: 0983734475</p>
                </div>
                <div class="footer-right-detail">
                  <i class="fa-solid fa-envelope"></i>
                  <p>Email: trungab2305@gmail.com</p>
                </div>
                <div class="footer-right-detail">
                  <i class="fa-brands fa-facebook"></i>
                  <p>Fanpage: Bánh mỳ tại ĐH FPT</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
</body>
</html>
