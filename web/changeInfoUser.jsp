<%-- 
    Document   : addProduct
    Created on : Oct 26, 2022, 4:09:45 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <body>
        <h3 style="color: green; text-align: center">${requestScope.success}</h3>
        <h3 style="color: red; text-align: center">${requestScope.error}</h3>
        <form style="margin-top: 100px" class="form-horizontal" action="changeInfoUserAfter" method="post">
            <!-- Text input-->
            <div class="form-group">
              <label class="col-md-4 control-label" for="">Tên khách hàng</label>  
              <div class="col-md-4">
                  <input id="product_id" name="customerName" placeholder="" value="${sessionScope.accountChange.getName()}" class="form-control input-md" required="" type="text">

              </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
              <label class="col-md-4 control-label" for="product_name">Địa chỉ Email</label>  
              <div class="col-md-4">
                  <input id="product_name" name="email" placeholder="" value="${sessionScope.accountChange.getEmail()}" class="form-control input-md" required="" type="text">

              </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
              <label class="col-md-4 control-label" for="available_quantity">Số điện thoại</label>  
              <div class="col-md-4">
                  <input id="available_quantity" name="phone" value="${sessionScope.accountChange.getPhone()}" placeholder="" class="form-control input-md" required="" type="text">

              </div>
            </div>
            


            <!-- Button -->
            <div class="form-group">
              <label class="col-md-4 control-label" for="singlebutton"></label>
              <div class="col-md-4">
                  <input type="submit" id="singlebutton"  class="btn btn-primary" value="Xác nhận thay đổi">
              </div>
              </div>
            <a style="margin-left: 520px; color: black" href="changePassword.jsp">Thay đổi mật khẩu</a>
            <a style="margin-left: 520px; color: black" href="home">Quay về trang chủ</a>

</form>

    </body>
</html>
