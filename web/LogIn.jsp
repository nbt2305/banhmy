<%-- 
    Document   : LogIn
    Created on : Oct 24, 2022, 8:14:53 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="dal.*" %>
<%@page import="models.*" %>
<%@page import="java.until.*" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/LogIn.css">
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
    
<head>
	<title>My Awesome Login Page</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
</head>
<!--Coded with love by Mutiullah Samim-->
<body>
    <div class="container h-100">
		<div class="d-flex justify-content-center h-100">
			<div style="height: 500px" class="user_card">
				<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img src="images/contact-logo.png" class="brand_logo" alt="Logo">
					</div>
				</div>
				<div class="d-flex justify-content-center form_container">
                                    <form action="login" method="post">
                                        <div style="color: white;background: red; padding: 5px; margin-bottom: 10px" class="d-flex justify-content-center links">
                                            <div> ${error}</div>
					</div>
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="user" class="form-control input_user" value="" placeholder="Tên đăng nhập">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="pass" class="form-control input_pass" value="" placeholder="Mật khẩu">
						</div>
						<div class="form-group">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="customControlInline">
								<label style="color: white;" class="custom-control-label" for="customControlInline">Quên mật khẩu ?</label>
							</div>
						</div>
							<div class="d-flex justify-content-center mt-3 login_container">
                                                            <button style="background-color: yellow!important;" type="submit" name="button" class="btn login_btn">Đăng nhập</button>
                            </div>
					</form>
				</div>
		
				<div class="mt-4">
                                        
					<div style="color: white;" class="d-flex justify-content-center links">
						Bạn chưa có tài khoản? <a style="color: white" href="SignUp.jsp" class="ml-2">Đăng ký</a>
					</div>
					<div class="d-flex justify-content-center links">
						<a style="color: white" href="ForgotPassword.jsp">Quên mật khẩu?</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
