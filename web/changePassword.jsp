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
        <form style="margin-top: 100px" class="form-horizontal" action="changePassword" method="post">
            <!-- Password input-->
            <div class="form-group">
              <label class="col-md-4 control-label" for="available_quantity">Nhập mật khẩu cũ</label>  
              <div class="col-md-4">
                  <input id="available_quantity" name="oldPass" value="" placeholder="" class="form-control input-md" required="" type="password">

              </div>
            </div>
            
            <!-- Password input-->
            <div class="form-group">
              <label class="col-md-4 control-label" for="available_quantity">Nhập mật khẩu mới</label>  
              <div class="col-md-4">
                  <input id="available_quantity" name="newPass" value="" placeholder="" class="form-control input-md" required="" type="password">

              </div>
            </div>
            
            <!-- Password input-->
            <div class="form-group">
              <label class="col-md-4 control-label" for="available_quantity">Nhập lai mật khẩu mới</label>  
              <div class="col-md-4">
                  <input id="available_quantity" name="confirmPass" value="" placeholder="" class="form-control input-md" required="" type="password">

              </div>
            </div>


            <!-- Button -->
            <div class="form-group">
              <label class="col-md-4 control-label" for="singlebutton"></label>
              <div class="col-md-4">
                  <input type="submit" id="singlebutton"  class="btn btn-primary" value="Xác nhận thay đổi">
              </div>
              </div>
            <a style="margin-left: 520px; color: black" href="home">Quay về trang chủ</a>

</form>

    </body>
</html>
