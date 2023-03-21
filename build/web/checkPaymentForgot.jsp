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
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container px-3 my-5 clearfix">
    <!-- Shopping cart table -->
    <div class="card-shopping">
        <h2 style="text-align: center">Chọn một sản phẩm mà bạn đã mua</h2>
        <div class="card-shopping-body">
            <div class="table-responsive">
              <table class="table table-bordered m-0">
                <thead>
                  <tr>
                    <!-- Set columns width -->
                    <th class="text-center py-3 px-4" style="min-width: 400px;">Thông tin</th>
                    <th class="text-right py-3 px-4" style="width: 100px;">Sản phẩm đã mua</th>
                  </tr>
                </thead>
                <tbody>
                    
        
                <c:forEach items="${requestScope.getListProducts}" var="i">
                    <tr>
                    <td class="p-4">
                        <div style="display: flex" class="media align-items-center">
                            <img style="width: 200px; margin-right: 50px" src="${i.getPicture()}" class="" alt="">
                        <div class="media-body">
                            <a style="font-size: 20px" href="#" class="d-block text-dark">${i.getProductName()}</a>
                        </div>
                      </div>
                    </td>
                <td class="text-right font-weight-semibold align-middle p-4"><a href="checkPaymentForgot?ProductID=${i.getProductID()}">Chọn</a></td>
                  </tr>
                </c:forEach>
                          
                  
        
                  
                </tbody>
              </table>
            </div>
            <!-- / Shopping cart table -->
        
            <h2 style="text-align: center">${requestScope.bellCount}</h2>
            <h2 style="text-align: center">${requestScope.bell}</h2>
        
          </div>
      </div>
  </div>
    </body>
</html>
