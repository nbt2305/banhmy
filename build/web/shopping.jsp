<%-- 
    Document   : shopping
    Created on : Oct 24, 2022, 1:24:44 AM
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
    <link rel="stylesheet" href="css/styleindex.css ">
    <link rel="stylesheet" href="css/shopping.css">
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

    <!--shopping-->
    <div class="container shopping">
        <div class="row shopping-row">
            <div class="col-md-6">
                <div class="shopping-image">
                    <img src="${requestScope.product.getPicture()}" alt="">
                </div>
            </div>

            <div class="col-md-3">
                <div class="shopping-detail">
                    <div class="path">
                        <a style="color: grey;" href="home">Trang chủ</a> / <a style="color: black;" href="">Mua hàng</a>
                    </div>
                    <div class="shopping-detail-content">
                        <h4>${requestScope.product.getProductName()}</h4>
                        <h4><span>${requestScope.product.getUnitPrice()}</span></h4>
                        <ul>
                            <li>Mua nhiều liên hệ shop</li>
                            <li>Giá ưu đãi cho lần sau</li>
                            <li>Nhận ship hàng số lượng lớn</li>
                        </ul>
                        <div class="quantity">
                            <p>Số lượng:</p>
                            <form action="" method="post">
                                <input type="number" name="quantity">
                                <input style="width: 100%; font-weight: bold; color: white; margin-top: 50px" class="formBuy" type="submit"  value="THANH TOÁN">
                            </form>
                        </div>
<!--                        <form class="formAddBuy" action="">
                            <input class="formAdd" type="submit" name="add" value="THÊM VÀO GIỎ HÀNG">
                            <input class="formBuy" type="submit" name="buy" value="MUA NGAY">
                            <div class="addOrBuy">
                                <div style="background-color: green; text-align: center; padding: 10px; margin-bottom: 20px; margin-top: 20px" class="add">
                                    <a type="submit" style="text-decoration: none; color: white;" href="shoppingCartLoadData?ProductID=${requestScope.product.getProductID()}">
                                        THÊM VÀO GIỎ HÀNG</a><br>
                                </div>
                                <div style="background-color: orange; text-align: center; padding: 10px" class="buy">
                                    <a style="text-decoration: none; color: white" href="#">MUA NGAY</a>
                                </div>
                            </div>
                        </form>-->
<!--                        <div class="addOrBuy">
                            <div style="background-color: green; text-align: center; padding: 10px; margin-bottom: 20px; margin-top: 20px" class="add">
                                <a style="text-decoration: none; color: white;" href="shoppingCartLoadData?ProductID=${requestScope.product.getProductID()}">
                                    THÊM VÀO GIỎ HÀNG</a><br>
                            </div>
                            <div style="background-color: orange; text-align: center; padding: 10px" class="buy">
                                <a style="text-decoration: none; color: white" href="#">MUA NGAY</a>
                            </div>
                        </div>-->
                    </div>
                </div>
            </div>

            <div class="col-md-3">

            </div>
        </div>
    </div>

    <!--Mô tả-->
    <div class="container">
        <div class="des">
            <div class="des-title">
                <h5>MÔ TẢ</h5>
            </div>
            <div class="des-detail">
                <p>Ăn bánh mì vào buổi sáng đã trở thành thói quen của nhiều người, thậm chí ăn vào bất cứ thời điểm nào trong ngày. Bánh mì không chỉ là món ăn quen thuộc mà sự đa dạng của nhân bánh cũng khiến nhiều người yêu thích món ăn này.</p>
            </div>
        </div>
    </div>

    <!--Sản phẩm tương tự-->
    <div class="product">
        <div class="container product-cards">
          <h1>Sản phẩm tương tự</h1>
        <div class="row product-row">
          <c:forEach items="${requestScope.listProducts}" var="i">
            <div style="margin-bottom:50px;" class="col-md-4 product-cards-details">
              <div class="card" style="width: 100%;">
                <img style="height: 17rem;" src="${i.getPicture()}" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">${i.getProductName()}</h5>
                  <p style="color: green;" class="card-text"><span style="color: red; font-weight: bold;">${i.getUnitPrice()}<span style="text-decoration-line: underline">đ</span></span></p>
                  <a href="shopping?ProductID=${i.getProductID()}" class="product-buy">Mua hàng</a>
                </div>
              </div>
            </div>
          </c:forEach>
          </div>
        </div>
    </div>

      <!--Footer-->
      <div style="margin-top: 0;" class="footer">
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
