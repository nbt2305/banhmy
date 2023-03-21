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
        <h3 style="color: red; text-align: center">${requestScope.id}</h3>
        <form style="margin-top: 100px" class="form-horizontal" action="addProduct" method="post">
<!-- Form Name -->

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_id">ID sản phẩm</label>  
  <div class="col-md-4">
      <input id="product_id" name="id" placeholder="ID sản phẩm" value="" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name">Tên sản phẩm</label>  
  <div class="col-md-4">
      <input id="product_name" name="name" placeholder="Tên sản phẩm" value="" class="form-control input-md" required="" type="text">
    
  </div>
</div>


<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_categorie">Loại sản phẩm</label>
  <div class="col-md-4">
    <select id="product_categorie" name="cid" class="form-control">
        <option value="1">Đồ ăn</option>
        <option value="2">Nước uống</option>
        <option value="3">Combo</option>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="available_quantity">Giá sản phẩm</label>  
  <div class="col-md-4">
      <input id="available_quantity" name="price" value="" placeholder="Giá sản phẩm" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_weight">Số lượng trong kho</label>  
  <div class="col-md-4">
      <input id="product_weight" name="unitStock" value="" placeholder="Số lượng trong kho" class="form-control input-md" required="" type="text">
    
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="percentage_discount">Hình ảnh</label>  
  <div class="col-md-4">
      <input id="percentage_discount" name="picture" value="" placeholder="Đường dẫn hình ảnh" class="form-control input-md" required="" type="text">
    
  </div>
</div>




<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
      <input type="submit" id="singlebutton"  class="btn btn-primary" value="Thêm">
  </div>
  </div>

</form>

    </body>
</html>
