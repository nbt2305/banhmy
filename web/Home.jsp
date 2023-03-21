<%-- 
    Document   : View_1
    Created on : Oct 8, 2022, 8:36:27 PM
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
    <title>BANH MY VIET NAM</title>
    <link rel="stylesheet" href="css/bootstrap-5.0.2-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="fonts/fontawesome-free-6.1.2-web/css/all.min.css">
    <script src="css/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/styleindex.css">
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
              
              
<!--              <div class="log-out">
                  <a href="homeBefore"> <i class="fa-solid fa-right-from-bracket"></i></a>
              </div>-->
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
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid header-second">
          <a style="color: black;" class="navbar-brand" href="#">TRANG CHỦ</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a style="color: black;" class="nav-link active" aria-current="page" href="#">GIỚI THIỆU</a>
              </li>
              <li class="nav-item dropdown">
                <a style="color: black;" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  SẢN PHẨM
                </a>
                <ul style="background-color: #fcba03;" class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <c:forEach items="${requestScope.listCategories}" var="i">
                        <li><a class="dropdown-item" href="category?CategoryID=${i.getCategoryID()}">${i.getCategoryName()}</a></li>
                    </c:forEach>
                </ul>
              </li>
              <li class="nav-item">
                <a style="color: black;" class="nav-link active" aria-current="page" href="afterOrder">ĐƠN MUA</a>
              </li>
            </ul>
            <div class="add-details">
                <i class="fa-solid fa-location-dot"></i>
                <p style="color: white;">Địa chỉ: Cổng trường đại học FPT Hòa Lạc</p>
            </div>
          </div>
        </div>
      </nav>

      <!--Slider-->
      <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="images/slider1.png" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="images/2.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="images/3.png" class="d-block w-100" alt="...">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

      <!--Giới thiệu-->
      <div class="intro">
        <div class="row intro-details">
          <div class="col-md-6 intro-details-text">
            <h1>Về chúng tôi</h1>
            <h2>Bánh Mỳ Việt Nam</h2>
            <p>“Bánh mì”, cái tên thân thương đã in sâu trong tâm trí của bao người con đất Việt, trở thành niềm tự hào của dân tộc và là một trong những đại diện cho tinh hoa ẩm thực Việt. Trải qua bao thăng trầm lịch sử, bánh mì Việt Nam giờ đây đã vượt ra khỏi biên giới quốc gia và để lại dấu ấn trong nền ẩm thực thế giới.</p>
            <button class="intro-details-slider-btn">
              Xem chi tiết
            </button>
          </div>
          <div class="col-md-6 intro-details-slider">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
              </div>
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="images/intro/intro4.jpg" class="d-block w-100" alt="...">
                  <div class="carousel-caption d-none d-md-block">
                    <h5>Bánh mì Việt Nam</h5>
                    <p>Từ món ăn bình dân vươn tầm ra thế giới</p>
                  </div>
                </div>
                <div class="carousel-item">
                  <img src="images/intro/intro5.jpg" class="d-block w-100" alt="...">
                  <div class="carousel-caption d-none d-md-block">
                    <h5>“Muôn màu muôn vẻ” bánh mì ở Việt Nam</h5>
                    <p>Như đã giới thiệu ở trên, bánh mì có vô số biến tấu khác nhau tùy vào khẩu vị, đặc trưng ẩm thực vùng miền.</p>
                  </div>
                </div>
                <div class="carousel-item">
                  <img src="images/intro/intro3.png" class="d-block w-100" alt="...">
                  <div class="carousel-caption d-none d-md-block">
                    <h5>Tiệm bánh mì nổi tiếng ở Hà Nội</h5>
                    <p>Cổng trường đại học FPT Hà Nội.</p>
                  </div>
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
            
          </div>
        </div>
      </div>

      <!--Sản phẩm-->
      <div class="product">
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
      

      <!--Contact-->
      <div class="contact">
        <div class="container">
          <div class="row contact-row">
            <div class="col-md-4">
              <div class="contact-logo">
                <img src="images/contact-logo.png" alt="">
                <h5 style="color:white">Hãy đến và thưởng thức</h5>
              </div>
            </div>
            <div class="col-md-4">
              <div class="contact-title">
                <div class="contact-title-detail">
                  <h3>Free Ship</h3>
                  <p>Miễn phí ship với bán kính 2km</p>
                </div>
                <div class="contact-title-detail">
                  <h3>Chất lượng sản phẩm</h3>
                  <p>Đảm bảo vệ sinh an toàn thực phẩm</p>
                </div>
                <div class="contact-title-detail">
                  <h3>Không gian shop</h3>
                  <p>Thiết bị mới, không gian thoáng mát, sạch sẽ</p>
                </div>
                <div class="contact-title-detail">
                  <h3>Đặt hàng</h3>
                  <p>Nhận đặt hàng, giao hàng với số lượng lớn</p>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <form class="form-contact">
                <input class="contact-phone" type="submit" value="0983734475">
                <input class="contact-mess" type="submit" value="Chat Facebook">
              </form>
            </div>
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

