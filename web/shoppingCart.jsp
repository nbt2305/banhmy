<%-- 
    Document   : shoppingCart
    Created on : Oct 28, 2022, 8:08:25 AM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dal.*" %>
<%@page import="models.*" %>
<%@page import="java.until.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap-5.0.2-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="fonts/fontawesome-free-6.1.2-web/css/all.min.css">
        <script src="css/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/shoppingCart.css"/>
        <script src="js/myCode.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <h5 style="margin-left: 150px; margin-top: 50px"><a style="text-decoration: none; color: grey" href="home">Trang chủ/</a><a style="text-decoration: none; color: black" href="#">Giỏ hàng</a></h5>
        <div class="container px-3 my-5 clearfix">
    <!-- Shopping cart table -->
    <div class="card-shopping">
        <div class="card-shopping-header">
            <h2>Giỏ hàng</h2>
        </div>
        <div class="card-shopping-body">
            <div class="table-responsive">
              <table class="table table-bordered m-0">
                <thead>
                  <tr>
                    <!-- Set columns width -->
                    <th class="text-center py-3 px-4" style="min-width: 400px;">Sản Phẩm &amp; Thông tin chi tiết</th>
                    <th class="text-right py-3 px-4" style="width: 100px;">Giá</th>
                    <th class="text-center py-3 px-4" style="width: 120px;">Số lượng</th>
                    <th class="text-right py-3 px-4" style="width: 100px;">Tổng</th>
                    <th class="text-center align-middle py-3 px-0" style="width: 40px;"><a href="#" class="shop-tooltip float-none text-light" title="" data-original-title="Clear cart"><i class="ino ion-md-trash"></i></a></th>
                  </tr>
                </thead>
                <tbody>
                    
        
                <c:forEach items="${requestScope.listOrderByAccountName}" var="i">
                    <c:forEach items="${requestScope.listProductOfOrder}" var="j">
                        <c:if test="${i.getProductID() == j.getProductID()}">
                            <tr>
                                <td class="p-4">
                                    <div style="display: flex" class="media align-items-center">
                                        <img style="width: 200px; margin-right: 50px" src="${j.getPicture()}" class="" alt="">
                                    <div class="media-body">
                                        <a style="font-size: 20px" href="#" class="d-block text-dark">${j.getProductName()}</a>
                                    </div>
                                  </div>
                                </td>
                                <td class="text-right font-weight-semibold align-middle p-4">${j.getUnitPrice()}đ</td>
                                <td class="align-middle p-4"><input type="text" class="form-control text-center" value="${i.getQuantity()}"></td>
                                <td class="text-right font-weight-semibold align-middle p-4">${i.getUnitPrice()}đ</td>
                                <td class="text-center align-middle px-0"><a href="deleteOrderInShoppingCart?ProductID=${i.getProductID()}" class="shop-tooltip close float-none text-danger" title="" data-original-title="Remove">×</a></td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </c:forEach>
                          
                  
        
                  
                </tbody>
              </table>
            </div>
            <!-- / Shopping cart table -->
        
        
            <div style="margin-left: 100px" class="float-right">
                <a href="home" type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3">Quay về mua hàng</a>
              <a href="loadPayment" type="button" class="btn btn-lg btn-primary mt-2">Thanh toán</a>
              <h3 style="color: green">${requestScope.bell}</h3>
            </div>
        
          </div>
      </div>
  </div>
    </body>
</html>
