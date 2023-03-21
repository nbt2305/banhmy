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
                    <div style="height: 600px" class="user_card">
				<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img src="images/contact-logo.png" class="brand_logo" alt="Logo">
					</div>
				</div>
                            <div class="d-flex justify-content-center form_container">
                                    <form action="signup" method="post">
                                        <div style="color: red;" class="d-flex justify-content-center links">
                                            <div> ${error}</div>
					</div>
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="name" class="form-control input_user" value="" placeholder="Họ tên">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-envelope"></i></span>
							</div>
							<input type="text" name="email" class="form-control input_user" value="" placeholder="Email">
						</div>
                                                <div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-phone" aria-hidden="true"></i></span>
							</div>
							<input type="text" name="phone" class="form-control input_user" value="" placeholder="Số điện thoại">
						</div>
                                                <div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="user" class="form-control input_user" placeholder="Tên đăng nhập">
						</div>
                                                <div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-lock" aria-hidden="true"></i></span>
							</div>
                                                    <input type="password" name="pass" class="form-control input_user" value="" placeholder="Mật khẩu">
						</div>
                                                
                                                <div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fa fa-lock" aria-hidden="true"></i></span>
							</div>
                                                    <input type="password" name="passAgain" class="form-control input_user" value="" placeholder="Nhập lại mật khẩu">
						</div>
						<div class="form-group">
						</div>
							<div class="d-flex justify-content-center mt-3 login_container">
                                                            <button style="background-color: yellow!important; font-weight: bold;" type="submit" name="button" class="btn login_btn">Đăng ký</button>
                            </div>
					</form>
				</div>
		
				<div class="mt-4">
                                        
					<div style="color: white;" class="d-flex justify-content-center links">
						Bạn đã có tài khoản ? <a style="color: white" href="LogIn.jsp" class="ml-2">Đăng nhập</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
